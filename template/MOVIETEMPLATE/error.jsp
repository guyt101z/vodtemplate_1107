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
    		if(keyCode == KEY_BACK){
    			window.parent.location.href="index.jsp?<%=urlparam%>";
    		}
    	}
    	function load(){
    		document.getElementById("logo").src="/vodtemplate/data/"+catId+"/"+logo_file;
    	}
    </script>
</head>

<body bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e" onload="load();">
	<table width="640" height="530" cellpadding="0" cellspacing="0" border="0">
		<!-- left table -->
		<tr>
        	<td width="165" height="495">
            	<table border="0" cellpadding="0" cellspacing="0">
                	<tr>
                    	<td width="165" height="70" class="logo"><img id="logo" width="145" height="52" align="top" src=""></td>
                    </tr>
                    <tr>
                    	<td valign="top" width="165" height="330">
							<!-- left table text -->
                        	<table border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td height="55"></td>
                                </tr>
                            	<tr>
                                	<td height="275" class="termConditionTxt paddingLeft13"><!--The now Select service Terms & Conditions (press MENU and select INFODESK to view) shall apply to your subscription of now Drama - Disney ABC (HD). Please press ENTER to confirm your acceptance of these Terms and Conditions and to subscribe to now Drama - Disney ABC.--></td>
                                </tr>
                            </table>
                        
                        </td>
                    </tr>
                    <tr>
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10"><!--<%if (language.equals("cn")){%>½Ð«öENTERÄ~Äò<%}else{%>Press ENTER to continue<%}%>--></td>                    </tr>
                    <tr>
                    	<td width="165" height="5"></td>
                    </tr>
                </table>
            </td>

		<!-- right table -->
            <td width="475" height="495" valign="top">
              <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="36">
                        	<img width="475" height="36" border="0" src="images/<%=styleId%>/<%=language%>/back_exit.png">
                        </td>                   
                    </tr>
                    <tr>
                      <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="474" height="32" align="right">
                            <tr>
                                    <td height="4"></td>
                            </tr>
                            <tr>
                                    <td width="" height="59" class=" txt01 paddingLeft18 paddingRight50"><%=errMsg%></td>
                              </tr>
                              <tr>
                              <td width="" height="50" class=" txt01 paddingLeft18"></td>
                              </tr>
                            </table>                        
                      <!--This library may provide content not suitable for viewers under 18 and that the subscriber is responsible for selling own parental lock preference.--></td>
                    </tr>
                    
                    <!--tr>
                    	<td height="5" colspan="3"></td>
                    </tr-->
                </table>
	        </td>
      </tr>
        
		<!-- footer -->
		<tr>
        	<td id="footer_img" colspan="2" width="640" height="35" background="images/<%=styleId%>/<%=language%>/footer.jpg">
			</td>
        </tr>
	</table>
</body>
</html>
