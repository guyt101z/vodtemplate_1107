<%
	String detail_include = "../../../data/"+ppvVersion+"/"+subcustcat+"/PPV_MH_"+productId+"_EN.js";
%>
<html>
<head>
<title>test</title>
<script language="javascript" src="file:////javascript/iptv.js"></script>
<script>
	<jsp:include page="<%=detail_include%>" />
</script> 
<script language="JavaScript">
<!--	var movieURL = "<%=movieRTSP%>";-->
	var inrtsp = "<%=inRTSP%>";
	var urlparam = "<%=urlParam%>";
	var bitrate = "<%=bitRate%>";
	var productid = "<%=productId%>";
</script>
</head>

<frameset cols="100%">
<script language="JavaScript">
<!--
	document.write('<frame name="video" src="../play-movie.jsp?inrtsp='+inrtsp+'&bitrate='+bitrate+'&<%=urlParam%>" marginwidth="0" marginheight="0" scrolling="no" noresize>');
}
-->
</script>
</frameset>
</html>
