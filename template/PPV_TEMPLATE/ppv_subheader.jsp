<%@page import="java.io.File"%>
<%
	File productEnJsFile = new File("/opt/jboss/server/web/deploy/vod.war/moviehouse/data/" + ppvVersion  + "/" + subcustcat + "/PPV_MH_" + productId + "_EN.js");
	if (!productEnJsFile.exists()) {
%>
	<script type="text/javascript">
<%
		if("en_us".equals(language)) {
%>
		window.location = "/vod/moviehouse/en/ppv/expire.jsp?<%=urlParam%>";
<%
		} else {
%>
		window.location = "/vod/moviehouse/cn/ppv/expire.jsp?<%=urlParam%>";
<%
		}
%>
	</script>
<%
	}
%>
