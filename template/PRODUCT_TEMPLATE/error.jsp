<%@page contentType="text/html; charset=big5" pageEncoding="big5"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, java.util.List"
%>
<%@include file="svod_header.jsp"%>
<%
String api= request.getParameter("api");
String respCode= request.getParameter("respcode");
String urlparam = "lang="+language+"&version="+svodVersion+"&catId="+catId+"&libId="+libId+"&styleId="+styleId;
String backURL="";
String exitURL="";
String cat_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+".js";

//libId = "L00305";
String db_language = "";

QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
String errMsg = "";
if (api!=null) {
	if("isLibrarySubscribed".equals(api) && "BUY_PLAN".equals(respCode)){
		errMsg = new String(resource.getString("error.notSubscribed").getBytes("8859_1"),"Big5");
	}
	else{
		errMsg = wrapper.getUIMessage(api, respCode, libId, language);
	}
} else {
	if("5253".equals(respCode)) {
		errMsg = new String(resource.getString("error.stbError").getBytes("8859_1"),"Big5");
	}
	else if("wrongpassword".equals(respCode)) {
		errMsg = new String(resource.getString("error.wrongPassword").getBytes("8859_1"),"Big5");
	}
	else {
		errMsg = new String(resource.getString("error.common").getBytes("8859_1"),"Big5");
	}
}
	
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=big5" />
	<title> New Document </title>

    
    <script language="javascript" src="file:////javascript/iptv.js"></script>
    <script>
    	var styleId = "<%=styleId%>";
			var language = "<%=language%>";
			<jsp:include page="<%=cat_include%>" />
	  </script>
    <script language="javascript">
    	var catId = "<%=catId%>";
    	iptvRegisterKeyHandler(keyEvent);
    	function keyEvent(keyCode) {
    		if(keyCode == KEY_BACK||keyCode == KEY_ENTER){
    			window.parent.location.href="match_list.jsp?<%=urlParam%>";
    		}
    	}
    	function load(){
    	}
    </script>
</head>

<body background="images/<%=styleId%>/<%=language%>/error_message.gif" bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e" onload="load();">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<td colspan="3" height="140">&nbsp;</td>
  </tr>
  
  <tr>
    <td width="80" height="170">&nbsp;</td>
    <td width="480" align="left"><%=errMsg%></td>
    <td width="80">&nbsp;</td>
    
    
  </tr>
  
  <tr>
     <td colspan="3" height="120">&nbsp;</td>
  </tr>
  
</table>
</body>
</html>
