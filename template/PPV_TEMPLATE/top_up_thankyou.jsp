<%@page contentType="text/html; charset=big5" pageEncoding="big5"
 import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, java.util.List" %>
<%@include file="../../ppv_header.jsp"%>
<%
QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
String topUpOfferCode = request.getParameter("topupoffercode");
String balance = request.getParameter("balance");
String addVal = request.getParameter("addval");
String doTopUp = request.getParameter("dotopup");
String rereferrer = request.getParameter("rereferrer");
String cat = request.getParameter("cat");
String productId = request.getParameter("productid");
%>
<html>
<%@include file="qapi/topUpCashPoint.jsp"%>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title> New Document </title>

    <link href="css/mh_style_e.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="file:////javascript/iptv.js"></script>
    <script language="javascript" src="js/top_up_menu/text.js"></script>
    <script language="javascript">
    	iptvRegisterKeyHandler(keyEvent);
    	function keyEvent(keyCode) {
    		if(keyCode == KEY_ENTER){
    			window.parent.location.href = "/vod/moviehouse/en/ppv/index.jsp";
    		}
				else if(keyCode == KEY_BLUE){
					window.parent.location.href = "/vod/moviehouse/en/ppv/t_c.jsp?";
				}
    		else if(keyCode == KEY_BACK){
    			window.parent.location.href = "/vod/moviehouse/en/ppv/top_up_menu.jsp?referrer=<%=rereferrer%>&cat=<%=cat%>&productid=<%=productId%>&stbid=<%=stbId%>&sid=<%=stbSid%>";
    		}
    	}
    </script>
</head>
<body id="body_content" bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e" onLoad="load()">
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
							<!-- left table - poster and icon -->
                        	<table width="165" height="330" border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td height="25"></td>
                                </tr>
                                <tr>
                                	<td height="173" class="paddingLeft25"><!--img width="115" height="173" src="../../images/poster01.jpg"--></td>
                                </tr>
                                <tr>
                                	<td height="10"></td>
                                </tr>
                                <tr>
                                	<td height="24"><!--img class="paddingLeft25" src="../../images/classicification_PG.png"><img class="paddingLeft6" src="../../images/HD.png"><img class="paddingLeft6" src="../../images/SD.png"--></td>
                                </tr>
                                <tr>
                                	<td height="98"></td>
                                </tr>
                            </table>
                        
                        </td>
                    </tr>
                    <tr>
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10"><!--Press number to select category <br>-->
                       </td>
                    </tr>
                    <tr>
                    	<td width="165" height="5"></td>
                    </tr>
                </table>
            </td>

		<!-- right table -->
            <td width="475" height="495">
                <table width="474" border="0" cellpadding="0" cellspacing="0" align="right">
                    <tr>
                        <td height="36"><img width="475" height="36" border="0" src="../../images/back_exit_e.png"></td>                   
                    </tr>
                    <tr>
                      <td>
                            <table height="254" border="0" cellpadding="0" cellspacing="0" width="474" align="right">
                            <tr>
                                    <td height="4"></td>
                            </tr>
                            <tr>
                                    <td width="" height="32" class=" txt01 paddingLeft18">Thank You</td>
                                </tr>
                                <tr>
                                    <td width="" height="32" class="txt02 paddingLeft18">now DOLLAR top-up successful</td>
                                </tr>
                                <tr>
                                    <td width="" height="186" class=""></td>
                                </tr>
                            </table>    
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table height="143" width="474" border="0" cellpadding="0" cellspacing="0" align="right">
                            	<tr>
                                	<td height="66"></td>
                                </tr>
                                <tr>
                                    <td height="45" class="txtInfo02 paddingLeft18 paddingRight50"><!--You can also watch this on the internet for FREE.<br>
            For details, please visit moviehouse.now.com--></td>
                                </tr>
                                <tr>
                                    <td width="474" height="32" class="selectTopUp01">Go back to  now Video Express</td>
                                </tr> 
                            </table>    
                        </td>
                    </tr>
                    <tr>
                    	<td height="14"></td>
                    </tr>
                    <tr>
                        <td height="48" class="txtInfo02 paddingLeft18 paddingRight50"><!--This library may provide content not suitable for viewers under 18 and that the subscriber is responsible for selling own parental lock preference.--></td>
                    </tr>
                </table>
            </td>

		<!-- footer -->
		<tr>
        	<td colspan="2" width="640" height="35" background="../../images/footer_tc_e.jpg">
			</td>
        </tr>
	</table>
</body>
</html>
