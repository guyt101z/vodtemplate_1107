<%@page contentType="text/html" 
import="java.net.URLDecoder, java.lang.Long, java.util.Date, ims.vi.quadplay.CommonProfileService.Profile, com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper"
%>
<%@include file="../../ppv_header.jsp"%>
<%
QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
Profile profile = wrapper.getProfileByStbInfoWS(stbId, stbSid);
if (profile.getStatus() == null || profile.getStatus().equals("INACTIVE") || profile.getStatus().equals("CLOSED")){
	if ("en_us".equals(language)) {
%>
	<script type="text/javascript">
	<!--
	window.location = "/vod/no_profile_err_en.html";
	//-->
	</script>

<%
	} else {
%>
	<script type="text/javascript">
	<!--
	window.location = "/vod/no_profile_err_cn.html";
	//-->
	</script>
<%	
	}
}
	String movieFormat = request.getParameter("movieformat");
	/*
	//this comment is for fixing Bug 6040 will be released later
	if ("HD".equalsIgnoreCase(movieFormat) && (profile.getServiceType() == null || profile.getServiceType().indexOf("SD")!=-1))
	{
		String api = "getPPVVodUrl";
		String respCodeStr = "ACCOUNT_NOT_ACTIVE";
%>
		<script type="text/javascript">
      <!--
      window.location = "error.jsp?api=<%=api%>&respcode=<%=respCodeStr%>&<%=urlParam%>";
      //-->
    </script>
<%
	}
	*/
	String expDayVal = request.getParameter("expdayval");
	String movieDurationRqt = request.getParameter("movieDuration");
	String isNotifyRqt = request.getParameter("isNotify");
	long expDayLong = Long.parseLong(expDayVal);
	long current = new Date().getTime();
	long remainingTime = expDayLong - current;
	if(expDayVal != null && !"null".equals(expDayVal) && expDayVal.length() > 0){
		// 1282646910428 is the value for 2010-08-24
		//if(current > expDayLong && expDayLong > 1282646910428){
		if(current > expDayLong){
			 try{
			 request.getRequestDispatcher("expire.jsp").forward(request,response);
			 }
			 catch(Exception e){
			 e.printStackTrace();
			 }
		}
	}
	if(movieDurationRqt != null && !"null".equals(movieDurationRqt) && movieDurationRqt.length() > 0){
		long movieDurationInMsec = Integer.parseInt(movieDurationRqt)*60*1000;
		if (isNotifyRqt == null && remainingTime < (movieDurationInMsec + 5*60*1000)) {
			 try{
			 request.getRequestDispatcher("notification.jsp").forward(request,response);
			 }
			 catch(Exception e){
			 e.printStackTrace();
			 }
		}
	}
	
	String inRTSP = request.getParameter("inrtsp");
	String inbitrate = request.getParameter("bitrate");
	if(inRTSP == null || "null".equals(inRTSP) || inRTSP.length() == 0){
		inRTSP = "no rtsp";
	} else {
		inRTSP = URLDecoder.decode(inRTSP, "US-ASCII");
	}
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<script language='JavaScript' src='file:////javascript/iptv.js'></script>
<script language='JavaScript' src='/vod/js/vodTimer.js'></script>
<script language='JavaScript' src='/vod/js/hdfilter.js'></script>
<script language='JavaScript' src='/vod/js/iptvvod.js'></script>
<script language="JavaScript">
var stbid = iptvGetSTBID();
var sid = iptvGetSTBSessionID();
var stbid_substring = stbid.substr(0,7);

//if(stbid_substring == "0015253" || stbid_substring == "0015212" || stbid_substring == "0015218"){
//      window.parent.location.href = "error.jsp?respcode=unsupport_stb&stbid="+stbid;
//}

var inrtsp = "<%=inRTSP%>";
var movieURL;
var urlParam;
var bitrate;
var remainingTime = parseInt("<%=remainingTime%>");

// Lock Trick Play Key
var trickplayLockedTime = 40000;
var unlockTrickplayKey = true;		// true: disable trick play key

if(inrtsp == "no rtsp"){
	movieURL = parent.movieURL;
	urlParam = parent.urlparam;
	bitrate = parent.bitrate;
} else {
	movieURL = "<%=inRTSP%>";
	bitrate = "<%=inbitrate%>";
}

var maxPlayTime = 21600000;	// 6 hours

//UAT testing
var afterplayip="nowvodws.netvigator.com";
//var afterplayip="10.192.1.126";
var stopURL = "http://" + afterplayip + "/vod/moviehouse/en/ppv/after-play.jsp?mode=stop&bitrate="+bitrate+"&"+urlParam;
var powerOffURL = "http://" + afterplayip + "/vod/moviehouse/en/ppv/after-play.jsp?mode=poweroff&bitrate="+bitrate+"&"+urlParam;
var endURL = "http://" + afterplayip + "/vod/moviehouse/en/ppv/after-play.jsp?mode=end&bitrate="+bitrate+"&"+urlParam;
var timeLimitReachedURL = "http://" + afterplayip + "/vod/moviehouse/en/ppv/after-play.jsp?mode=overtime&bitrate="+bitrate+"&"+urlParam;
var errorURL = "http://" + afterplayip + "/vod/moviehouse/en/ppv/after-play.jsp?bitrate="+bitrate+"&"+urlParam;


function load() {
	iptvRegisterKeyHandler(keyHandler);
	iptvVODRegisterEventHandler(eventHandler);
	
	iptvDisableAllDefaultKeyHandlings();

	iptvHideBrowserBorder();

	iptvVODPlayRTSPBrowser(movieURL);

	//iptvVODSetMaxPlayTimeMultiplier(1.5);
	//setTimeout("stopPlay()", maxPlayTime);
	// 2007-03-28 STB multiple computation causes error.
	// Workaround: get duration of movie and times 1.5 instead of using iptvVODSetMaxPlayTimeMultiplier();
	setTimeout("setMaxPlayTime()", 3000);

	initialize();	
}

function setMaxPlayTime() {
	var duration = iptvVODGetDuration();
	duration *= 1.5;
	duration *= 1000;
	if (remainingTime < duration){
		setTimeout("stopPlay()", remainingTime);
	}
	else	{
		setTimeout("stopPlay()", duration);
	}
}

function unload() {
	iptvShowBrowserBorder();
	
	iptvEnableAllDefaultKeyHandlings();
	
	iptvUnregisterKeyHandler();
	iptvVODUnregisterEventHandler();
	
	finalize();
}
</script>


</head>
<body bgcolor="transparent" text="#FFFFFF" onload="load()" onunload="unload()">
<table width="640" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="640" height="15"></td>
	</tr>
	<tr>
		<td height="100"><img src="file:////gif/null.png" width="640" height="100" name="rightCornerText"></td>
	</tr>
	<tr>
		<td><img src="file:////gif/vol_null.gif" width="150" height="50" name="leftCornerText"></td>
	</tr>
	<tr>
		<td height="200"></td>
	</tr>
</table>
<table width="640" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="50"></td>
		<td><img src="file:////gif/null.gif" width="32" height="40" name="muteImage"></td>
	</tr>
</table>
</body>
</html>
