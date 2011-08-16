<%@page import="java.util.*"%>
<%
String svodVersion = request.getParameter("version");
String fsa = request.getParameter("fsa");
String stbId = request.getParameter("stbid");
String stbSid = request.getParameter("sid");
String bsn = request.getParameter("bsn");
String servtype = request.getParameter("servtype");
String custcat = request.getParameter("custcat");
String linerate = request.getParameter("linerate");
String subcustcat = request.getParameter("subcustcat");

String language = request.getParameter("lang");
String catId = request.getParameter("catId");
String libId = request.getParameter("libId");
String styleId = request.getParameter("styleId");
String currentUrl = (request.getRequestURL()).toString();

String urlParam="";
//-------------------for UAT
//libId = "L00321";
//-------------------for QA
//libId = "L00701";

StringBuffer sb = new StringBuffer();
ResourceBundle.clearCache();
ResourceBundle resource = ResourceBundle.getBundle(styleId+"_resource_"+language);

if (fsa==null || stbId==null || stbSid == null) {	
	java.util.Map<String, String[]> parameters = request.getParameterMap();
	
	for(java.util.Iterator iter = parameters.entrySet().iterator();iter.hasNext();){  
		java.util.Map.Entry element = (java.util.Map.Entry)iter.next();  
		Object strKey = element.getKey();
		String[] value=(String[])element.getValue();
		if (!("stbid".equals(strKey.toString()) || "sid".equals(strKey.toString())) ){
		
			for(int i=0;i<value.length;i++){
				sb.append(strKey.toString()+"="+value[i]+"&");
			}
		}
	}
	sb.append("url="+currentUrl);
	urlParam = sb.toString();
%>
	<script src="file:////javascript/iptv.js"></script>
	<script type="text/javascript">
	<!--
	window.location = "svod_redirect.jsp?stbid=" + iptvGetSTBID() +"&sid=" + iptvGetSTBSessionID() + "&<%=urlParam%>";
	//-->
	</script>
<%
	return;
} else {
	sb.append("fsa="+fsa+"&");
	sb.append("stbid="+stbId+"&");
	sb.append("sid="+stbSid+"&");
	sb.append("lang="+language+"&");
	sb.append("libId="+libId+"&");
	sb.append("catId="+catId+"&");
	sb.append("bsn="+bsn+"&");
	sb.append("servtype="+servtype+"&");
	sb.append("custcat="+custcat+"&");
	sb.append("linerate="+linerate+"&");
	sb.append("subcustcat="+subcustcat+"&");	
	sb.append("version="+svodVersion+"&");
	sb.append("styleId="+styleId+"&");
	urlParam = sb.toString();


	
	//Support Sub-cust-cat RES, RESLAM, RESAPT and RESAPRHYB
	if (!("RES".equals(subcustcat) ||  
		"RESLAM".equals(subcustcat) ||
		"RESAPT".equals(subcustcat) ||
		"RESAPTHYB".equals(subcustcat))  ) {
        	if ("en_us".equals(language)) {
%>
        		<script type="text/javascript">
        		<!--
        		window.location = "invalid_cust_cat.jsp?<%=urlParam%>";
        		//-->
        		</script>

<%
        	} else {
%>
        		<script type="text/javascript">
        		<!--
        		window.location = invalid_cust_cat.jsp?<%=urlParam%>";
        		//-->
        		</script>
<%
        	}
	}
		
}
%>
