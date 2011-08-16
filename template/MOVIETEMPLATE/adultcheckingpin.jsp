<%@ page import="java.net.URLEncoder" %>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 response.setHeader
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader("Expires",0); //prevents caching at the proxy server

	String status = request.getParameter("status");
	String zonetype = request.getParameter("zonetype");
	String channelid = request.getParameter("channelid");
	String stbid = request.getParameter("stbid");
	String referer = request.getParameter("referer");
	String isAdultAdmissionAllowed = request.getParameter("isAdultAdmissionAllowed");
	String isAdultAdmissionDone = request.getParameter("isAdultAdmissionDone");
	String lang = request.getParameter("lang");
	
	String heading1 = "";
	String heading2 = "";
	String subHeading = "";
	String content = "";
	
	if("en_us".equals(lang)){
		heading1 = "Adult Zone";
		heading2 = "AV-On-Demand";
		subHeading = "Go to ";
		content = "This zone is restricted to subscribers aged 18 or above.<BR><BR>now TV provides a locking device that uses a personal identification number (PIN) to restrict unauthorized access to selected channels, program categories, including adult programs. Please do not disclose your PIN to avoid tampering of the locking device to gain access to restricted program categories/channels. Resetting your PIN regularly is strongly recommended.";
	}
	else{
		heading1 = "成人區";
		heading2 = "成人自選影院";
		subHeading = "進入";
		content = "此區只限十八歲或以上人仕進入.<BR><BR>now寬頻電視設有一項名為『家長鎖定』的鎖碼裝置，此裝置可讓訂戶以個人識別號碼【PIN】限制他人在未經授權的情況下取用指定的頻道及/或節目類別，包括成人節目。請不要向第三者披露你的個人識別號碼，以確保鎖碼裝置不會遭擅自更改或調校以收看限制的節目類別/頻道。我們建議你定期更改個人識別號碼。";
	}

	boolean isNoProfile = false;

	boolean checkCatIII = true;
	// = EPGConciseHandler.checkCatIIIViewing(request, response);

	String errorCode="";
	// = (String)request.getAttribute(AppWebKeys.ErrorCodeKey);
	//AppLog.logUser("errorCode: [" + errorCode + "]");
	if("Error:0002".equals(errorCode))
	{
		isNoProfile = true;
	}
	String enterURL = "";

	if("true".equals(isAdultAdmissionDone)||"true".equals(isAdultAdmissionAllowed)){
		enterURL = "index.jsp?" + request.getQueryString();
	}
	else{
		String successpage = URLEncoder.encode("/vodtemplate/template/MOVIETEMPLATE/adultcheckingpin.jsp?isAdultAdmissionDone=true&"+ request.getQueryString(), "US-ASCII");
		enterURL = "/tvportal/adult/registration.jsp?stbid="+request.getParameter("stbid")+"_"+request.getParameter("sid")+"&successpage="+successpage+"&" + request.getQueryString();
	}
%>
<html>
<head>
<title>adult-check</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<script language='JavaScript' src='file:////javascript/iptv.js'></script>
<%
if(isNoProfile)
{
%>
<script language='JavaScript' src='NoProfileRedirect.js'></script>
<script language='JavaScript'>
	goNoProfileError(1,window);
</script>
<%
}
%>
<script language='JavaScript'>
<% if ("ondemand".equals(referer)) { %>
var b = "http://visvod.netvigator.com/jsp/en/ondemand/ondemand.html?<%=request.getQueryString()%>";
var failPwdURL = "http://visvod.netvigator.com/jsp/en/ondemand/ondemand.html?<%=request.getQueryString()%>";
<% } else { %>
var b = "http://vitvportal.netvigator.com/jsp/en/fullguide/fullguide.jsp?redirect=false&<%=request.getQueryString()%>";
var failPwdURL = "http://vitvportal.netvigator.com/jsp/en/fullguide/fullguide.jsp?redirect=false&<%=request.getQueryString()%>";
<% } %>
var e = "<%=enterURL%>";
b = "/vodtemplate/vodlanding/vod/vodlanding.jsp?<%=request.getQueryString()%>";
failPwdURL = "/vodtemplate/vodlanding/vod/vodlanding.jsp?<%=request.getQueryString()%>";

</script>
<%
	if (checkCatIII)
	{
%>
	<script language='JavaScript' src='js/adult-pin.js'></script>
<%
	}
	else
	{
%>
<script language='JavaScript'>
	iptvRegisterKeyHandler(keyEvent);
	function keyEvent(keyCode)
	{
		if(keyCode == KEY_ENTER)
		{
	    	document.location.href = e;
		}
		else if(keyCode == KEY_BACK)
		{
			document.location.href = b;
		}
	}
</script>
<%
	}
%>
<style type="text/css">
body {
	color: #FFFFFF;
	background-color: transparent;
	background-image: url("images/adult_checkbg.gif");
}

.subHeading { font-size: 20px; }

.heading {
	font-size: 20px;
	vertical-align: bottom;
}

.topRight {
	text-align: right;
	vertical-align: bottom;
}

.bottomLeft {
	text-align: left;
	vertical-align: middle;
}

.middle {
	vertical-align: top;
	font-size: 17px;
}
</style>
</head>

<body>
<table width="640" border="0" cellspacing="0" cellpadding="0">
	<tr>
				<td width="192" height="40">&nbsp;</td>
				<td class="heading"><%=("ADULT".equals(zonetype))?heading1:heading2%></td>
				<td class="topRight"><img id="back" src="images/back_<%=lang%>.gif" width="105" height="32"></td>
	</tr>
</table>

<table width="640" height="127" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td width="162" height="40">&nbsp;</td>
	<td class="subHeading"><%=subHeading%><%=("ADULT".equals(zonetype))?heading1:heading2%></td>
</tr>
</table>

<table width="640" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td width="162">&nbsp;</td>
	<td width="458" height="270" class="middle">
<%
	if (checkCatIII)
	{
%>
		<%=content%>
<%
	}
	else
	{
		//V1105 Adult Content Registration
		
		String successURL = "http://vitvportal.netvigator.com/jsp/en/adultfullguide/adult-check.jsp?"+request.getQueryString();
		response.sendRedirect("http://nowvodws.netvigator.com/tvportal/adult/registration.jsp?stbid="+stbid+"&channelid=&successpage="+URLEncoder.encode(successURL));
		return;
	}
%>
	</td>
	<td></td>
</tr>
</table>

<table width="620" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td width="162">&nbsp;</td>
	<td height="60" class="bottomLeft">
<%
	if (checkCatIII)
	{
%>
	<iframe name="bottom" src="adult-bottom-<%=lang%>.html"  width="342" height="60"></iframe>
<%
	}
	else
	{
%>
		press enter to continue
<%
	}
%>
	</td>
	<td align="right" width="116">
<%
	if (checkCatIII)
	{
%>
	<img src="images/img-off.gif" width="29" height="22" border="0" name="pin10"><img src="images/img-off.gif" width="29" height="22" name="pin11"><img src="images/img-off.gif" width="29" height="22" name="pin12"><img src="images/img-off.gif" width="29" height="22" name="pin13">
<%
	}
%>
	</td>
</table>

</body>

</html>
