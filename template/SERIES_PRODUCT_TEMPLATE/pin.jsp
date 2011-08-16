<%@ page contentType = "text/html; charset=Big5" %>
<%@include file="svod_header.jsp"%>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 response.setHeader
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader("Expires",0); //prevents caching at the proxy server

Calendar rightNow = Calendar.getInstance();
String seriesIndex = request.getParameter("seriesindex");
String seriesProductId = request.getParameter("seriesproductid");
String seriesId = request.getParameter("seriesid");
String scheduleId = request.getParameter("scheduleid");

%>	
<html>
	<head>
		<title>parental</title>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
		<script language='JavaScript' src='file:////javascript/iptv.js'></script>
		<script language="javascript">
			var urlparam = "<%=urlParam%>";
			var styleId = "<%=styleId%>";
			var language = "<%=language%>";
			var seriesindex = "<%=seriesIndex%>";
			var seriesid = "<%=seriesId%>";
			var seriesproductid = "<%=seriesProductId%>";
			var scheduleid = "<%=scheduleId%>";
		</script>
		<script src="js/pin.js"></script>
	</head>
		<body  bgcolor="transparent" background="images/<%=styleId%>/<%=language%>/enter_pin_password_bg.gif" text="#000000">
			<table width="640" height="530" border="0" cellpadding="0" cellspacing="0" valign="top">

				<tr>	
					<td height="456">
						<iframe name="moviepage" src="seriesProgramMain.jsp?<%=urlParam%>&seriesid=<%=seriesId%>&seriesindex=<%=seriesIndex%>" width="635" height="456"></iframe>
					</td>
				</tr>
				<tr>	
					<td height="74">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="480" height="74" align="left">
									<img src="images/<%=styleId%>/null.gif" border="0" width="460" height="74" name="txt">
								</td>
								<td valign="top" width="167" height="74" >
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td><img src="images/<%=styleId%>/null.gif" border="0" height="22"> </td>
										</tr>
										<tr>
											<td>
												<img src="images/<%=styleId%>/img-off.gif" width="34" height="30" border="0" name="pin10">

												<img src="images/<%=styleId%>/img-off.gif" width="34" height="30" name="pin11">

												<img src="images/<%=styleId%>/img-off.gif" width="34" height="30" name="pin12">

												<img src="images/<%=styleId%>/img-off.gif" width="34" height="30" name="pin13"> 
											</td>
										</tr>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</body>
		</html>
