<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper"
%>
<%
	String language = request.getParameter("lang");
	String catId = request.getParameter("catId");
	String version = request.getParameter("version");
	String libId = request.getParameter("libId");
	String styleId = request.getParameter("styleId");
	StringBuffer sb = new StringBuffer();
	java.util.Map<String, String[]> parameters = request.getParameterMap();
	for(java.util.Iterator iter = parameters.entrySet().iterator();iter.hasNext();){  
		java.util.Map.Entry element = (java.util.Map.Entry)iter.next();  
		Object strKey = element.getKey();
		String[] value=(String[])element.getValue();
		String param = (String) strKey;
		for(int i=0;i<value.length;i++){
			sb.append(strKey.toString()+"="+value[i]+"&");
		}
	}
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<script language='JavaScript' src='file:////javascript/iptv.js'></script>
<script language='JavaScript'>
	var stbid = iptvGetSTBID();
	var sid = iptvGetSTBSessionID();
	if(stbid.substr(0,7) == "0015253"){
        window.parent.location.href = "error.jsp?respcode=5253&stbid="+stbid+"&catId=<%=catId%>&lang=<%=language%>&version=<%=version%>&libId=<%=libId%>&styleId=<%=styleId%>";
	} else{
	var url = "match_list.jsp";
	var params = "<%=sb.toString()%>stbid=" + stbid + "&sid=" + sid + "&url=" + url;
	window.location = "/vodtemplate/template/PRODUCT_TEMPLATE/svod_redirect.jsp?"+params;
	}
</script>
</head>

<body>

</body>
</html>
