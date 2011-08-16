<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<script language='JavaScript' src='file:////javascript/iptv.js'></script>
<script language='JavaScript' src='/vodtemplate/js/vodTimer.js'></script>
<script language='JavaScript' src='/vodtemplate/js/hdfilter.js'></script>
<script language='JavaScript' src='/vodtemplate/js/iptvvod.js'></script>
<script language="JavaScript">
var movieURL = parent.movieURL;
var urlParam = parent.urlparam;
var bitrate = parent.bitrate;
var next_productid = parent.next_productid;

// Lock Trick Play Key
var trickplayLockedTime = 40000;
var unlockTrickplayKey = true;		// true: disable trick play key

var maxPlayTime = 21600000;	// 6 hours

//UAT testing
var afterplayip="nowvodws.netvigator.com";
//var afterplayip="10.192.1.126";
var stopURL = "http://" + afterplayip + "/vodtemplate/template/MOVIETEMPLATE/after-play.jsp?mode=stop&bitrate="+bitrate+"&"+urlParam;
var powerOffURL = "http://" + afterplayip + "/vodtemplate/template/MOVIETEMPLATE/after-play.jsp?mode=poweroff&bitrate="+bitrate+"&"+urlParam;
var endURL = "http://" + afterplayip + "/vodtemplate/template/MOVIETEMPLATE/after-play.jsp?mode=end&bitrate="+bitrate+"&"+urlParam;
var timeLimitReachedURL = "http://" + afterplayip + "/vodtemplate/template/MOVIETEMPLATE/after-play.jsp?mode=overtime&bitrate="+bitrate+"&"+urlParam;
var errorURL = "http://" + afterplayip + "/vodtemplate/template/MOVIETEMPLATE/after-play.jsp?bitrate="+bitrate+"&"+urlParam;


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
	setTimeout("stopPlay()", duration);
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
