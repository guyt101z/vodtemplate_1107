<%@page contentType="text/html; charset=big5" pageEncoding="big5"%>
<%@include file="svod_header.jsp"%>
<%
String seriesId = request.getParameter("seriesid");
String cat_data_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+"_CAT_1.js";
String cat_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+".js";
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=Big5" />
		<title>cp_genre</title>
		<script language="javascript" src="file:////javascript/iptv.js"></script>
		<script language="javascript" src="js/common.js"></script>
		<script>
			<jsp:include page="<%=cat_include%>" />
			<jsp:include page="<%=cat_data_include%>" />
		</script>
		<style type="text/css">
			td {
				font-size: 19px;
			}
			.textGrey {
				color: #2C2C2C;
			}
		</style>
	</head>
	<body background="images/<%=styleId%>/<%=language%>/landingpage.gif" text="#FFFFFF" onLoad="load()">
		<table width="640" height="530" border="0" cellpadding="0" cellspacing="0" valign="top">
			<tr>
				<td colspan="2" width="432" valign="top"><img src="images/<%=styleId%>/null.gif" width="17" height="114"></td>
				<td width="6"><img src="images/<%=styleId%>/null.gif" width="6"></td>
			</tr>
			<tr>
				<td colspan="3" width="638" height="336"><iframe name="all_series" src="allseries.jsp?<%=urlParam%>" width="638" height="336"></iframe></td>
			</tr>
			<tr>
				<td height="80" colspan="3"><img src="images/<%=styleId%>/null.gif" height="80"></td>
			</tr>
		</table>
	</body>
</html>
