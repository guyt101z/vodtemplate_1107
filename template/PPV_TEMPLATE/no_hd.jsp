<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper"
%>
<%@include file="../../ppv_header.jsp"%>
<%						
	String productId = request.getParameter("productid");
	String cat = request.getParameter("cat");
	String movieFormat = request.getParameter("movieformat");
	String backURL = request.getParameter("referrer");
	QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
	String [] cashPointPrice = new String [2];	// 0 - SD price
						// 1 - HD price
	String [] price = new String [2];	// 0 - SD price
						// 1 - HD price	
						
	String [] priceTxt = new String [2];	// 0 - SD price text
						// 1 - HD price	text
%>
<%@include file="../../ppv_subheader.jsp"%>
<%@include file="qapi/getVodProductRestrictedFlags.jsp"%>
<%@include file="qapi/getPrice.jsp"%>	
<%@include file="qapi/getCashPointBalance.jsp"%>
<%@include file="qapi/existInMyPlaylist.jsp"%>
<%
String expDay = "";
String expDayVal = "";
if ("HD".equals(movieFormat)) {
	expDay = expTime[1];
	expDayVal = expTimeVal[1];
} else if ("SD".equals(movieFormat)){
	expDay = expTime[0];	
	expDayVal = expTimeVal[0];	
}
expDayVal = expTimeVal[0];
String detail_include = "../../data/"+ppvVersion+"/"+subcustcat+"/PPV_MH_"+productId+"_EN.js";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title> New Document </title>

    <link href="css/mh_style_e.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="file:////javascript/iptv.js"></script>
    <script language="javascript">
        var backURL = "<%=backURL%>";
        var urlparam = "cat=<%=cat%>&movieDuration=<%=movieDuration%>&expdayval=<%=expTimeVal[0]%>&productid=<%=productId%>&movieformat=<%=movieFormat%>&<%=urlParam%>";
				var SDpriceTxt = "<%=priceTxt[0]%>";
				var HDpriceTxt = "<%=priceTxt[1]%>";
				var SDprice = "<%=price[0]%>";
				var HDprice = "<%=price[1]%>";
				var SDcashpoint = "<%=cashPointPrice[0]%>";
				var HDcashpoint = "<%=cashPointPrice[1]%>";
        var movieformat = "<%=movieFormat%>";
        var l_is_locked = "<%=isLocked%>";
				var l_is_restricted = "<%=isRestricted%>";
				var cashpointbalance = "<%=cashPointBalance%>";
    </script>

    <script language="javascript" src="js/no_hd.js"></script>
		<script>
			<jsp:include page="<%=detail_include%>" />
		</script> 
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
                                							<td class="paddingTop3" id="classification" align="middle" valign="middle">
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
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10"><!--Press number to select category <br>-->Press ENTER to select</td>
                    </tr>
                    <tr>
                    	<td width="165" height="1"></td>
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
                      <td height="">
                            <table border="0" cellpadding="0" cellspacing="0" width="474" align="right">
                            <tr>
                                    <td height="1" colspan="2"></td>
                            </tr>
                            <tr>
                                    <td width="" height="32" colspan="2" class=" txt03 paddingLeft18">You have selected to buy HD version of</td>
                                </tr>
                                <tr>
                                    <td id="title" width="" height="32" colspan="2" class="txt01 paddingLeft18"></td>
                                </tr>
                                <tr>
                                    <td id="pricetab" width="310" height="32" class="txt02 paddingLeft18">Price:</td>
                                    <td id="price" width="164" height="32" class="txt01"></td>
                                </tr>
                                <tr>
                                    <td id="nowdollartab" width="310" height="32" class="txt02 paddingLeft18">now DOLLAR:</td>
                                    <td id="nowdollar" width="164" height="32" class="txt01"></td>
                                </tr>
                                <tr>
                                    <td width="310" height="84" colspan="2" class="txtInfo04 paddingLeft18 paddingRight50">The 48-hour viewing period begins after you purchase the program. You can have
unlimited viewing within this 48-hour period.</td>
                                </tr>
                                <tr>
                                    <td width="310" height="25" class="txt02 paddingLeft18">Current now DOLLAR:</td>
                                    <td id="currentnowdollar" width="164" height="25" class="txt01"></td>
                                </tr>
                                <tr>
                                    <td width="" height="1" colspan="2" class=""></td>
                                </tr>
                                <tr>
                                    <td width="" height="80" colspan="2" class="txtInvalid paddingLeft18 paddingRight50">Sorry, you have not registered for our HDTV service.<br> Please call our sales hotline at 2888 0008 (then press 1).</td>
                                </tr>
                            </table>    
                        </td>
                    </tr>
                    <tr height="">
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" align="right">
                                <tr>
                                    <td width="211" height="32" class="select01">Watch the program in SD</td>
                                    <td width="263" height="32" class="select02"></td>
                                </tr> 
                            </table>    
                        </td>
                    </tr>
                    <tr>
                    	<td height="14"></td>
                    </tr>
                    <tr>
                        <td height="48" class="txtInfo02 paddingLeft18 paddingRight50">Some programs are suitable for viewing by adults only. You are responsible for selecting and setting your own parental lock preference via the MENU page.</td>
                    </tr>
                    <!--tr>
                    	<td height="5" colspan="3"></td>
                    </tr-->
                </table>
            </td>

		<!-- footer -->
		<tr>
        	<td colspan="2" width="640" height="35" background="../../images/footer_class_tc_e.jpg">
			</td>
        </tr>
	</table>
</body>
</html>


