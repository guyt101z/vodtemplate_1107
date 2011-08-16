<%@page contentType="text/html"
import="ims.vi.quadplay.CommonProfileService.Profile, com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper"
%>

<%
String fsa = "";
String stbId = request.getParameter("stbid");
String stbSid = request.getParameter("sid");
String language = request.getParameter("lang");
String url = request.getParameter("url");

QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
Profile profile = wrapper.getProfileByStbInfoWS(stbId, stbSid);
if (profile!=null){
	if (profile.getStatus() == null || profile.getStatus().equals("INACTIVE") || profile.getStatus().equals("CLOSED")){
	if ("en_us".equals(language)) {
%>
	<script type="text/javascript">
	<!--
	window.location = "/vodtemplate/template/PPV_TEMPLATE/no_profile_err_en.html";
	//-->
	</script>

<%
	} else {
%>
	<script type="text/javascript">
	<!--
	window.location = "/vodtemplate/template/PPV_TEMPLATE/no_profile_err_cn.html";
	//-->
	</script>
<%	
	}
	}

 	fsa = profile.getFsa();
	StringBuffer sb = new StringBuffer();
	sb.append("fsa="+fsa+"&");
	sb.append("bsn="+profile.getBsn()+"&");
	sb.append("servtype="+profile.getServiceType()+"&");
	sb.append("custcat="+profile.getCustCat()+"&");
	sb.append("linerate="+profile.getLineRate()+"&");
	sb.append("subcustcat="+profile.getSubCustCat()+"&");
	
	java.util.Map<String, String[]> parameters = request.getParameterMap();
	
	for(java.util.Iterator iter = parameters.entrySet().iterator();iter.hasNext();){  
		java.util.Map.Entry element = (java.util.Map.Entry)iter.next();  
		Object strKey = element.getKey();
		String[] value=(String[])element.getValue();
		String param = (String) strKey;
		if ( !("fsa".equals(param) && "bsn".equals(param) && "servtype".equals(param) && "custcat".equals(param) && "linerate".equals(param) && "subcustcat".equals(param)) ){
			for(int i=0;i<value.length;i++){
				sb.append(strKey.toString()+"="+value[i]+"&");
			}
		}
	}
	String tempURL = url+"?"+sb.toString();
%>
	<script type="text/javascript">
	<!--
	window.location = "<%=tempURL%>";
	//-->
	</script>
<%	
} else { // No Profile
	if ("en_us".equals(language)) {
%>
	<script type="text/javascript">
	<!--
	window.location = "/vodtemplate/template/PPV_TEMPLATE/no_profile_err_en.html";
	//-->
	</script>

<%
	} else {
%>
	<script type="text/javascript">
	<!--
	window.location = "/vodtemplate/template/PPV_TEMPLATE/no_profile_err_cn.html";
	//-->
	</script>
<%	
	}
}
%>
