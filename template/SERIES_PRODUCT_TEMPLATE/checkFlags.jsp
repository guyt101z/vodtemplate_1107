<%@page contentType="text/html; charset=big5"%>
<%@include file="svod_header.jsp"%>
<%
        String seriesId = request.getParameter("seriesid");
        String seriesIndex = request.getParameter("seriesindex");
        String seriesProductId = request.getParameter("seriesproductid");
        String scheduleId = request.getParameter("scheduleid");
%>
<%@include file="qapi/getVodProductRestrictedFlags.jsp"%>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html;charset=big5" />
        <title> New Document </title>
	<script language="javascript" src="file:////javascript/iptv.js"></script>
        <script language="javascript">
                var l_is_locked = "<%=isLocked%>";
                var l_is_restricted = "<%=isRestricted%>";
		var globalSVODLock = iptvGetNonVolatileData("g_svl");
		var restrictedSVODLock = iptvGetNonVolatileData("r_svl");
		var urlparam = "<%=urlParam%>";
		var seriesId = "<%=seriesId%>";
		var seriesindex = "<%=seriesIndex%>";
		var seriesProductId = "<%=seriesProductId%>";
		var scheduleId = "<%=scheduleId%>";
                urlparam+="&seriesindex="+seriesindex+"&seriesid="+seriesId+"&seriesproductid="+seriesProductId+"&scheduleid="+scheduleId;
		if(l_is_locked == "true"){
	                window.parent.location.href="pin.jsp?verified=false&"+urlparam;
                } else{
        		if(globalSVODLock == "Y") {
                        	window.parent.location.href="pin.jsp?verified=false&"+urlparam;
                        } else if (restrictedSVODLock != "N") {
                        	if(l_is_restricted == "true") {
                                	window.parent.location.href="pin.jsp?verified=false&"+urlparam;
                                } else {
                                        window.parent.location.href="qapi/getsvod.jsp?verified=false&playonly=true&"+urlparam;
                                }
                        } else {
                        	window.parent.location.href="qapi/getsvod.jsp?verified=true&playonly=true&"+urlparam;
                        }
                }
        </script>
</head>
<body>
</body>
</html>

