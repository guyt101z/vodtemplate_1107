<%@include file="ppv_version.jsp"%>
<%

String fsa = request.getParameter("fsa");
String stbId = request.getParameter("stbid");
String stbSid = request.getParameter("sid");
String bsn = request.getParameter("bsn");
String servtype = request.getParameter("servtype");
String custcat = request.getParameter("custcat");
String linerate = request.getParameter("linerate");
String subcustcat = request.getParameter("subcustcat");
String language = request.getParameter("lang");
String currentUrl = (request.getRequestURL()).toString();
String urlParam="";
String back="";
if (request.getParameter("back") == null || request.getParameter("back").equals("")){
	back = request.getHeader("Referer");
}
else {
	back = request.getParameter("back");
}
StringBuffer sb = new StringBuffer();
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
	urlParam = sb.toString() + "&back="+back;
%>
	<script src="file:////javascript/iptv.js"></script>
	<script type="text/javascript">
	<!--
	window.location = '/vod/moviehouse/ppv_redirect.jsp?stbid=' + iptvGetSTBID() +"&sid=" + iptvGetSTBSessionID() + "&<%=urlParam%>";
	//-->
	</script>
<%
	return;
} else {
	sb.append("fsa="+fsa+"&");
	sb.append("stbid="+stbId+"&");
	sb.append("sid="+stbSid+"&");
	sb.append("lang="+language+"&");
	sb.append("bsn="+bsn+"&");
	sb.append("servtype="+servtype+"&");
	sb.append("custcat="+custcat+"&");
	sb.append("linerate="+linerate+"&");
	sb.append("subcustcat="+subcustcat+"&");	
	urlParam = sb.toString() + "&back="+back;

        //Support Sub-cust-cat RES, RESLAM, RESAPT and RESAPRHYB
        if (!(	"RES".equals(subcustcat) ||
                "RESLAM".equals(subcustcat) )) {
                if ("en_us".equals(language)) {
%>
                        <script type="text/javascript">
                        <!--
                        window.location = "/vod/moviehouse/en/ppv/invalid_cust_cat.jsp?<%=urlParam%>";
                        //-->
                        </script>

<%
                } else {
%>
                        <script type="text/javascript">
                        <!--
                        window.location = "/vod/moviehouse/cn/ppv/invalid_cust_cat.jsp?<%=urlParam%>";
                        //-->
                        </script>
<%
                }
        }

}
%>
