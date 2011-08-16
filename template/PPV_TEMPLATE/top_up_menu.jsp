<%@page contentType="text/html; charset=big5" pageEncoding="big5"
 import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, java.util.List" %>
<%@include file="../../ppv_header.jsp"%>
<%
String referrer = request.getParameter("referrer");
String productId = request.getParameter("productid");
String cat = request.getParameter("cat");
if (referrer == null || "".equals(referrer)) {
	urlParam = urlParam+"&referrer=top_up_menu.jsp";
}
else {
	urlParam = urlParam+"&referrer="+referrer;
}
%>
<%@include file="qapi/getCashPointBalance.jsp"%>
<%@include file="qapi/getCashPointTopUpPlan.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title> PPV Top Up Menu </title>

		<link href="css/mh_style_e.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="file:////javascript/iptv.js"></script>
		<script language="javascript">
			var urlParam = "<%=urlParam%>";
			var cur_cash_point = "<%=cashPointBalance%>";
			var stbid = "<%=stbId%>";
			var stbsid = "<%=stbSid%>";
			var expiry_date = "<%=expiryDateString%>";
			var referrer = "<%=referrer%>";
			var productid = "<%=productId%>";
			var cat = "<%=cat%>";
			var goBack = "<%=back%>";
		</script>
		<script language="javascript" src="js/top_up_menu/text.js"></script>
		<script language="javascript" src="js/top_up_menu/handler.js"></script>
		<script language="javascript" src="js/top_up_menu/entry.js"></script>
		<script language="javascript" src="js/top_up_menu/select_plan.js"></script>
		<script language="javascript" src="js/top_up_menu/pin.js"></script>

	</head>

<body id="body_content" bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e" onLoad="load()">
</body>
</html>


