<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, java.net.URLEncoder"
%>
<%@include file="../../ppv_header.jsp"%>
<%
        String productId = request.getParameter("productid");
        String cat = request.getParameter("cat");
        String movieFormat = request.getParameter("movieformat");
        String movieDuration = request.getParameter("movieDuration");
				String expDayVal = request.getParameter("expdayval");
        String inRTSP = request.getParameter("inrtsp");
        String bitRate = request.getParameter("bitrate");
        String isNotify = "Y";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title> New Document </title>

	<link href="css/mh_style_e.css" rel="stylesheet" type="text/css">

	<script language="javascript" src="file:////javascript/iptv.js"></script>
    	<script language="javascript">
        	var urlparam = "isNotify=<%=isNotify%>&movieDuration=<%=movieDuration%>&expdayval=<%=expDayVal%>&inrtsp=<%=inRTSP%>&bitrate=<%=bitRate%>&cat=<%=cat%>&productid=<%=productId%>&movieformat=<%=movieFormat%>&<%=urlParam%>";
	</script>
	<script language="javascript" src="js/notification.js"></script>
</head>
<body bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e" onload="load()">
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
                                	<td height="24"><!--img class="paddingLeft25" src="../images/classicification_PG.png"><img class="paddingLeft6" src="../images/HD.png"><img class="paddingLeft6" src="../images/SD.png"--></td>
                                </tr>
                                <tr>
                                	<td height="98"></td>
                                </tr>
                            </table>
                        
                        </td>
                    </tr>
                    <tr>
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10"><!--Press number to select category<span class="tranSpace"></span>-->Press ENTER to watch the program<!--img align="absmiddle" src="../images/up_down_button.png"--></td>
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
                                    <td width="" height="32" class=" txt01 paddingLeft18"></td>
                                </tr>
                                <tr>
                                    <td width="" height="32" class="txt02 paddingLeft18">Sorry, this program will exceed available viewing period, it will be terminated before completion.</td>
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
                                	<td colspan="2" height="66"></td>
                                </tr>
                                <tr>
                                    <td height="45" colspan="2" class="txtInfo02 paddingLeft18 paddingRight50"><!--You can also watch this on the internet for FREE.<br>
            For details, please visit moviehouse.now.com--></td>
                                </tr>
                                <tr>
                                    <td width="211" height="32" class="select01">Watch the program</td>
                                    <td width="263" height="32" class="select02"></td>
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
        	<td colspan="2" width="640" height="35" background="../../images/footer.jpg">
			</td>
        </tr>
	</table>
</body>
</html>
