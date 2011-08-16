<%@ page contentType = "text/html; charset=Big5"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, org.apache.log4j.*, java.util.*"%>
<%@include file="svod_header.jsp"%>
<%

Logger logger;

response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 response.setHeader
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader("Expires",0); //prevents caching at the proxy server

int BITRATE_MPEG4HD = 8000000;
int BITRATE_MPEG4SD = 2800000;
int BITRATE_MPEG2SD = 4800000;
int default_bitrate = BITRATE_MPEG2SD;

%>
<html>
<head>
	<title>after play</title>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
</head>

<body bgColor="#000000" text="#FFFFFF" leftmargin="0" topmargin="0">
<script src="file:////javascript/iptv.js"></script>
<SCRIPT LANGUAGE="JavaScript">
	var stbid="";
	function getSTBId(){
		var tmp_stbid = iptvGetSTBID();
		var tmp_session_id = iptvGetSTBSessionID();
		stbid = tmp_stbid + "_" + tmp_session_id;
		if (stbid == 0) {
	        	return "null";
		} else {
	        	return stbid;
		}
	}
<%
	String OBJECT_NAME = "movie house after-play.jsp";
	
	logger = Logger.getLogger(OBJECT_NAME);

	String afterplayip = "nowvodws.netvigator.com";
        String nextEpisodeSelected = request.getParameter("nextEpisodeSelected");
	String version = request.getParameter("version");
	String stbid = request.getParameter("stbid");
	String sid = request.getParameter("sid");
	String seriesId = request.getParameter("seriesid");
	String seriesProductId = request.getParameter("seriesproductid");
	String nextSeriesProductId = request.getParameter("nextseriesproductid");
	String nextSeriesScheduleId = request.getParameter("nextseriesscheduleid");
	String enableNextEpisode = request.getParameter("enablenextepisode");
	String cat = request.getParameter("cat");
	String playNextURL = "http://" + afterplayip + "/vodtemplate/template/PRODUCT_TEMPLATE/checkFlags.jsp?"+urlParam+"&cat="+cat+"&seriesid="+seriesId+"&seriesproductid="+nextSeriesProductId+"&scheduleid="+nextSeriesScheduleId;
	String seriesDetailPageURL = "http://" + afterplayip + "/vodtemplate/template/PRODUCT_TEMPLATE/detail.jsp?"+urlParam+"&cat="+cat+"&seriesid="+seriesId+"&seriesproductid="+seriesProductId;
	String errorMsg = request.getParameter("error_code");
	
	if(errorMsg == null || errorMsg.equals("")){
	
		String stbip = request.getRemoteAddr();

		int bitrate = request.getParameter("bitrate") == null ? default_bitrate:Integer.parseInt(request.getParameter("bitrate"));
		Long lBitrate = new Long(bitrate);
		
		QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();

		ims.vi.quadplay.MovieHouseCheckoutService.MovieHouseSdxMessage message = 
			 wrapper.freeBandwidth(stbid, sid, stbip, lBitrate);
			 
	
		if (message!=null) {
		
			if (ims.vi.quadplay.MovieHouseCheckoutService.MovieHouseResponseCode.SUCCESS.equals(message.getResponseCode())) {
			%>
		 	if ("<%=seriesId%>" != "" && "<%=seriesId%>" != "null"){ 
		 		if ("<%=nextEpisodeSelected%>"== "Y") {
	                		window.location.href="<%=playNextURL%>";
		                } else {
					window.location.href="<%=seriesDetailPageURL%>";
				}
			} else {
				window.location.href="match_list.jsp?catId=<%=catId%>&lang=<%=language%>&version=<%=version%>&libId=<%=libId%>&styleId=<%=styleId%>";
			}
			<%
			} else {
				logger.info(OBJECT_NAME + " : Fail to Release Network bandwidth after VOD streaming.");
			
			}
		} else { // Err Null return from QAPI
		
		}
		
	}else if(errorMsg != null || !errorMsg.equals("")){
    		if(errorMsg.startsWith("VOD_ENTONE"))
		{
    			//insertStreamLiner(request,profile,errorMsg,"");
    			
    		}
		logger.info(OBJECT_NAME + " error occur: " + errorMsg);
%>
		//window.location.href="../error-page.jsp?stbid="+getSTBId()+"&errorCode=<%=errorMsg%>";
		window.location.href="error.jsp?stbid="+getSTBId()+"&errorCode=<%=errorMsg%>&catId=<%=catId%>&lang=<%=language%>&version=<%=version%>&libId=<%=libId%>";

<%                
	}else{
		logger.info(OBJECT_NAME + " after bandwidth free handling.");
		//response.sendRedirect("/jsp/en/vod/movie-cat/movie-cat.jsp?stbid=" + stbid );
%>
		 if ("<%=seriesId%>" != "" && "<%=seriesId%>" != "null"){ 
		 	if ("<%=nextEpisodeSelected%>"== "Y") {
	                	window.location.href="<%=playNextURL%>";
	                } else {
				window.location.href="<%=seriesDetailPageURL%>";
			}
		 } else {
			window.location.href="match_list.jsp?catId=<%=catId%>&lang=<%=language%>&version=<%=version%>&libId=<%=libId%>&styleId=<%=styleId%>";
		 }
<% 		
	}
%>

</script>
</body>
</html>
