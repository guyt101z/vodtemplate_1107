<%@page contentType="text/html"
import="org.apache.log4j.*, java.util.Properties, java.io.File, java.io.FileInputStream, java.util.ResourceBundle, java.io.FileNotFoundException"
%>
<%@include file="data/hourregenlibrary.jsp"%>
<%
	Logger logger = Logger.getLogger("vod.jsp");

	String[] templateLibraryStyleId = new String[5];
	String templateId = "";
	String libId = "";
	String styleId = "";
	String catId = request.getParameter("catId");
	String version = "";
	String pinCheck = "";
	try {
		logger.info("[catId:"+catId+"] - Start try reading file 'config.properties'...");
		Properties mapping = new Properties();
		mapping.load(new FileInputStream(new File(request.getRealPath("config.properties"))));
		if (mapping.getProperty(catId) != null) {
			templateLibraryStyleId = mapping.getProperty(catId).split(",");
		}
	} catch (FileNotFoundException e) {
		logger.info("[catId:"+catId+"] - The file 'config.properties' is not found.");
		//Do nothing
	} catch (Exception e) {
		e.printStackTrace();
	}
	if (templateLibraryStyleId[0] == null || templateLibraryStyleId[1] == null || templateLibraryStyleId[2] == null){
		templateLibraryStyleId = libraryTemplateMapping.get(catId);
	}
	if (templateLibraryStyleId == null || templateLibraryStyleId.length == 0){
		logger.info("[catId:"+catId+"] - Can't find any mapping");
		response.sendRedirect(request.getHeader("Referer"));
	}
	else {	
		templateId = templateLibraryStyleId[0];
		libId = templateLibraryStyleId[1];
		styleId = templateLibraryStyleId[2];
		pinCheck = templateLibraryStyleId[3];
		version = templateLibraryStyleId[4];
	}
%>
<html>
<head>
	<script language="javascript" src="file:////javascript/iptv.js"></script>
	<script language="javascript">
		var stbid = iptvGetSTBID();
		var sid = iptvGetSTBSessionID();
		var language = iptvGetLanguage();
		if (language == '1') {
			language = 'zh_tw';
		}
		else {
			language = 'en_us';
		}
		var pinCheck = "<%=pinCheck%>";
		//For clear the cat_style in MOVIEHOUSE SVOD
		iptvSetNonVolatileData("view", "");
		if (pinCheck == "Y"){
			window.location="template/<%=templateId%>/adultchecking.jsp?stbid=" + stbid + "&sid=" + sid + "&lang="+language+"&version=<%=version%>&catId=<%=catId%>&libId=<%=libId%>&styleId=<%=styleId%>";
		} else { 
			window.location="template/<%=templateId%>/index.jsp?lang="+language+"&version=<%=version%>&catId=<%=catId%>&libId=<%=libId%>&styleId=<%=styleId%>";
		}
	</script>
</head>
<body>
</body>
</html>
