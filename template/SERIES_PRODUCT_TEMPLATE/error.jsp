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
	errMsg = wrapper.getUIMessage(api, respCode, libId, language);
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

    <link href="css/<%=styleId%>/mh_style_e.css" rel="stylesheet" type="text/css"> 
    <script language="javascript" src="file:////javascript/iptv.js"></script>
    <script>
			<jsp:include page="<%=cat_include%>" />
	  </script>
    <script language="javascript">
    	var catId = "<%=catId%>";
    	iptvRegisterKeyHandler(keyEvent);
    	function keyEvent(keyCode) {
    		if(keyCode == KEY_ENTER){
    			window.parent.location.href="index.jsp?<%=urlparam%>";
    		}
    	}
    </script>
    <style type="text/css">
	td {
		font-size: 14px;
	}
    </style>
</head>

<body background="images/<%=styleId%>/<%=language%>/error_message.gif" text="#FFFFFF" leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<td colspan="2" height="100">&nbsp;</td>
  </tr>
  <tr>
    <td width="20" height="340">&nbsp;</td> 
    <td width="100%" align="center" valign="middle"><font size="4" color="#000000"><%=errMsg%></font></td>       
  </tr>
  <tr>
     <td width="20" height="60">&nbsp;</td><td></td>
  </tr>
</table>
</body>
</html>
