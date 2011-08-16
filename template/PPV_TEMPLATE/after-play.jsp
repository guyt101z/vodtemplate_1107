<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, org.apache.log4j.*, java.util.*"%>
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
	
	String fsa = request.getParameter("fsa");
	String stbid = request.getParameter("stbid");
	String sid = request.getParameter("sid");
	
	String errorMsg = request.getParameter("error_code");
	
	if(errorMsg == null || errorMsg.equals("")){
	
		String stbip = request.getRemoteAddr();
		String bitrateRqt = request.getParameter("bitrate");
		int bitrate = (bitrateRqt == null || (bitrateRqt != null && bitrateRqt.equals("null"))) ?  default_bitrate:Integer.parseInt(bitrateRqt);
		Long lBitrate = new Long(bitrate);
		
		QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();

		ims.vi.quadplay.MovieHouseCheckoutService.MovieHouseSdxMessage message = 
			 wrapper.freeBandwidth(stbid, sid, stbip, lBitrate);
			 
	
		if (message!=null) {
		
			if (ims.vi.quadplay.MovieHouseCheckoutService.MovieHouseResponseCode.SUCCESS.equals(message.getResponseCode())) {
			%>
			window.location.href="/vod/moviehouse/en/ppv/grid_view.jsp?lang=en_us";
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
		window.location.href="error.jsp?stbid="+getSTBId()+"&errorCode=<%=errorMsg%>";

<%                
	}else{
		logger.info(OBJECT_NAME + " after bandwidth free handling.");
		//response.sendRedirect("/jsp/en/vod/movie-cat/movie-cat.jsp?stbid=" + stbid );
%>
		window.location.href="/vod/moviehouse/en/ppv/grid_view.jsp?lang=en_us";

<% 		
	}
%>

</script>
</body>
</html>
