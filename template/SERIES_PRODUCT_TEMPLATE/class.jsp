<%@page contentType="text/html; charset=big5" pageEncoding="big5" %>
<%@include file="svod_header.jsp"%>
<html>
	<title> New Document </title>
	<head>
		<script language='JavaScript' src='file:////javascript/iptv.js'></script>
		<script language='JavaScript'>
			iptvRegisterKeyHandler(keyEvent);
			function keyEvent(keycode)
			{
				if(keycode == KEY_BACK)
				{
					iPanel.back();
				}
			}
		</script>
	</head>
	<body background="images/<%=styleId%>/<%=language%>/class.gif">
	</body>
</html>


