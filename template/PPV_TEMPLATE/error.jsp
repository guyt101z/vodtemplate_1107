<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, java.util.List"
%>
<%@include file="../../ppv_header.jsp"%>
<%
String api= request.getParameter("api");
String respCode= request.getParameter("respcode");
String movieFormat = request.getParameter("movieformat");
String referrer = request.getParameter("referrer");

language = "en_us";

QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
String errMsg = "";
if (api!=null) {
	if (respCode.equals("PURCHASED_OTHER_FORMAT") || respCode.equals("ALREADY_PURCHASED_ONE_OF_TWO_FORMAT")) {
		errMsg = ((movieFormat!=null)?wrapper.getUIMessage(api, respCode, movieFormat, language):wrapper.getUIMessage(api, respCode, "SD", language));
	} else {
		errMsg = wrapper.getUIMessage(api, respCode, "", language);
	}
} else {
	if("unsupport_stb".equals(respCode)) {
		errMsg = "This service is not available to this decoder. For enquiries, please contact our customer representative at PCCW Consumer Service Hotline (1000). ";
	}
	else if("wrongpassword".equals(respCode)) {
		errMsg = "Invalid PIN. Please contact our PCCW Consumer Service Hotline (1000) for assistance";
	}
	else {
		errMsg = "System busy.  <br>Please try again later. <br>Contact PCCW Consumer Service Hotline (1000) if the problem persists. ";
	}
}

%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title> New Document </title>

    <link href="css/mh_style_e.css" rel="stylesheet" type="text/css">

    <script language="javascript" src="file:////javascript/iptv.js"></script>
    <script language="javascript">
    	iptvRegisterKeyHandler(keyEvent);
    	function keyEvent(keyCode) {
    		if(keyCode == KEY_ENTER || keyCode == KEY_BACK){
    			if("<%=referrer%>" == "top_up_menu.jsp"||"<%=referrer%>" == "top_up_thankyou.jsp"){
    				window.parent.location.href="top_up_menu.jsp";
    			}
    			else if ("<%=referrer%>" == "ONELINK") {
    				window.parent.location.href="<%=back%>";
    			}
    			else if ("<%=referrer%>" == "MENU") {
    				var style = iptvGetSystemNonVolatileData(SYSTEMDATA_UISTYLEID);
    				window.parent.location.href="http://vitvportal.netvigator.com/jsp/en/menu/menu.jsp?stbid="+iptvGetSTBID()+"_"+iptvGetSTBSessionID()+"&styleid="+style;
    			}
    			else{
    				window.parent.location.href="index.jsp";
    			}
    		}
    	}
    </script>
</head>

<body bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e">
	<table width="640" height="530" cellpadding="0" cellspacing="0" border="0">
		<!-- left table -->
		<tr>
        	<td width="165" height="495">
            	<table border="0" cellpadding="0" cellspacing="0">
                	<tr>
                    	<td width="165" height="70" class="logo"><img width="145" height="52" align="top" src="../../images/sd_video_express_e_ppv.png"></td>
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
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10">Press ENTER to continue</td>
                    </tr>
                    <tr>
                    	<td width="165" height="5"></td>
                    </tr>
                </table>
            </td>

		<!-- right table -->
            <td width="475" height="495" valign="top">
              <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="36"><img width="475" height="36" border="0" src="../../images/back_exit_e.png"></td>
                    </tr>
                    <tr>
                      <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="474" height="32" align="right">
                            <tr>
                                    <td height="4"></td>
                            </tr>
                            <tr>
                                    <td width="" height="59" class="errorTxt txt01 paddingLeft18 paddingRight50"><%=errMsg%></td>
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
        	<td colspan="2" width="640" height="35" background="../../images/footer.jpg">
			</td>
        </tr>
	</table>
</body>
</html>


