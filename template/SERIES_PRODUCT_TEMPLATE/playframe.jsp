<%
	String detail_include = "";
	detail_include = "../../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+seriesId+".js";
%>
<html>
<head>
<title>test</title>
<script language="javascript" src="file:////javascript/iptv.js"></script>
<script>
	<jsp:include page="<%=detail_include%>" />
</script>
<script language="JavaScript">
	var movieURL = "<%=movieRTSP%>";
	var urlparam = "<%=urlParam%>";
	var bitrate = "<%=bitRate%>";
	var seriesid = "<%=seriesId%>";
	var seriesproductid = "<%=seriesProductId%>";
	var seriesindex = "<%=seriesIndex%>";
	var nextseriesproductid = "";
	var nextseriesscheduleid = "";
	if (seriesid != "" && seriesid != "null" && seriesproductid != "" && seriesproductid != "null") {
		for (var i = 0; i < series_product_array.length; i++){
			if (series_product_array[i].id == seriesproductid && i+1 <series_product_array.length) {
				nextseriesproductid = series_product_array[i+1].id;
				nextseriesscheduleid = series_product_array[i+1].schedule_id;
				break;
			}
		}
		urlparam += "&nextseriesproductid="+nextseriesproductid+"&nextseriesscheduleid="+nextseriesscheduleid+"&enablenextepisode="+enable_next_episode;
	}
	var next_productid = nextseriesproductid;
</script>
</head>

<%if (isPlayOnly) {%>
<frameset cols="100%">
<script language="JavaScript">
    document.write('<frame name="video" src="../play-movie.jsp?'+urlparam+'" marginwidth="0" marginheight="0" scrolling="no" noresize>');    
</script>

</frameset>
<%} else {%>
<frameset cols="100%">
<script language="JavaScript">
<!--
document.write('<frame name="video" src="../play-movie.jsp?'+urlparam+'" marginwidth="0" marginheight="0" scrolling="no" noresize>');
-->
</script>
    
</frameset>
<%}%>
</html>
