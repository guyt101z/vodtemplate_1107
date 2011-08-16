<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper"
%>
<%@include file="../../ppv_header.jsp"%>
<%
	String [] price = new String [2];	// 0 - SD price
						// 1 - HD price

	String [] priceTxt = new String [2];	// 0 - SD price text
						// 1 - HD price	text

	String productId = request.getParameter("productid");
	String movieFormat = request.getParameter("movieformat");
	String presentedPrice = request.getParameter("price");
	String backURL = request.getParameter("referrer");
	String purchaseOther = request.getParameter("purchaseother");
	QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
%>
<%@include file="qapi/existInMyPlaylist.jsp"%>
<%
String expDay = "";
if ("HD".equals(movieFormat)) {
	expDay = expTime[1];
} else if ("SD".equals(movieFormat)){
	expDay = expTime[0];
}


%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title> New Document </title>

    <link href="css/mh_style_e.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="file:////javascript/iptv.js"></script>
    <script language="javascript" src="js/pin.js"></script>
    <script language="javascript">
    	var backURL = "<%=backURL%>";
			var urlparam = "productid=<%=productId%>&movieformat=<%=movieFormat%>&purchaseother=<%=purchaseOther%>&<%=urlParam%>";
			var price = "<%=presentedPrice%>";
			var movieformat = "<%=movieFormat%>";
    </script>
    <script language="javascript" src="../../data/<%=ppvVersion%>/<%=subcustcat%>/PPV_MH_<%=productId%>_EN.js"></script>
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
                        	<table border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td height="25"></td>
                                </tr>
                                <tr>
                                	<td class="paddingLeft25"><img id="poster" width="115" height="173" src="../../images/spacer.gif"></td>
                                </tr>
                                <tr>
                                	<td height="10"></td>
                                </tr>
                                <tr>
                                	<td>
                                                <table border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                                <td width="27" height="24"><img class="paddingLeft6" width="27" height="24" src="../../images/spacer.gif"></td>
                                                                <td width="43" height="23">
                                                                        <table id="classTable" width="43" height="23" border="0" cellpadding="0" cellspacing="0" background="../../images/spacer.gif">
                                                                                <tr>
                                                                                        <td id="classification" align="middle">
                                                                                        </td>
                                                                                </tr>
                                                                        </table>
                                                                </td>
                                                                <td width="27" height="24"><img id="hdpic" class="paddingLeft6" width="27" height="24" src="../../images/spacer.gif"></td>
                                                                <td width="27" height="24"><img id="sdpic" class="paddingLeft6" width="27" height="24" src="../../images/spacer.gif"></td>
                                                        </tr>
                                                <!--img id="classification" class="paddingLeft25" width="44" height="23" src="../../images/spacer.gif"-->
                                                </table>

					</td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                    <tr>
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10"><!--Press number to select category <br>Press <img align="absmiddle" src="../../images/up_down_button.png"> and ENTER to select--></td>
                    </tr>
                    <tr>
                    	<td width="165" height="5"></td>
                    </tr>
                </table>
            </td>

		<!-- right table -->
            <td width="475" height="495">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="36"><img width="475" height="36" border="0" src="../../images/back_exit_e.png"></td>
                    </tr>
                    <tr>
                      <td height="183">
                            <table border="0" cellpadding="0" cellspacing="0" width="474" align="right">
                            <tr>
                                    <td height="4"></td>
                            </tr>
                            <tr>
                                    <td width="" height="32" class=" txt01 paddingLeft18">This Movie is under Parental Control.</td>
                                </tr>
                                <tr>
                                    <td id="title" width="" height="32" class="txt01 paddingLeft18"></td>
                                </tr>
                                <tr>
                                    <td width="" height="118" class=""></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                    	<td height="34">
                        	<table border="0" cellpadding="0" cellspacing="0" align="right" class="timeRemainBar">
                            	<tr>
                                	<td width="310" class="txt02 paddingLeft18">Expiry date and time:</td>
                                	<td class="txt01"><%=expDay%></td>
                                </tr>
                            </table>

                        </td>
                    </tr>

                    <tr>
                    	<td>
                            <table width="474" border="0" cellpadding="0" cellspacing="0" align="right">
                                <tr>
                                    <td height="66" colspan="2"> </td>
                                </tr>
                                <tr>
                                    <td height="32" colspan="2"><!--span class="paddingLeft18 txtInfo02">(non-refundable after subscription confirmation)</span--></td>
                                </tr>
                                <tr>
                                    <td height="44" width="268" class="paddingLeft18">Enter <span class="nowfontsize23">now</span> TV PIN to unlock and Press ENTER to watch movie:</td>
                                    <td height="44" width="206"><img id="pin" width="181" height="38" src="../../images/inputbox_bg.png"></td>
                                </tr>
                                <tr>
                                    <td id="errorMsg" height="19" colspan="2" class="paddingLeft18 txtInvalid"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="48" class="txtInfo02 paddingLeft18 paddingRight50">Some programs are suitable for viewing by adults only. You are responsible for selecting and setting your own parental lock preference via the MENU page.</td>
                    </tr>
                    <!--tr height="5">
                    	<td height="5" colspan="3"></td>
                    </tr-->
                </table>
	        </td>
        </tr>

		<!-- footer -->
		<tr>
        	<td colspan="2" width="640" height="35" background="../../images/footer_class_tc_e.jpg">
		<!-- pages indicator -->
                <!--table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="483"></td>
                        <td width="25"><img width="25" height="35" src="../../images/pagearrow_left_dim.png"></td>
                        <td width="94" class="pageNum">1/20</td>
                        <td width="25"><img width="25" height="35" src="../../images/pagearrow_right.png"></td>
                        <td width="13"></td>
                    </tr>
                </table-->
			</td>
        </tr>
	</table>
</body>
</html>


