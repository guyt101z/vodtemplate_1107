<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper"
%>

<%@include file="../../ppv_header.jsp"%>
<%@include file="isHDProfile.jsp"%>
<%
	String errorCode = "";
	String productId = request.getParameter("productid");
	String cat = request.getParameter("cat");
	if(productId == null || productId.length() == 0){
		errorCode = "No product id";
	}
	QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();

	String backURL = request.getParameter("referrer");
	String [] cashPointPrice = new String [2];	// 0 - SD price
						// 1 - HD price
	String [] price = new String [2];	// 0 - SD price
						// 1 - HD price

	String [] priceTxt = new String [2];	// 0 - SD price text
						// 1 - HD price	text
	String detail_include = "../../data/"+ppvVersion+"/"+subcustcat+"/PPV_MH_"+productId+"_EN.js";
%>
<%@include file="../../ppv_subheader.jsp"%>
<%@include file="qapi/getVodProductRestrictedFlags.jsp"%>
<%@include file="qapi/getPrice.jsp"%>
<%@include file="qapi/getCashPointBalance.jsp"%>
<%@include file="qapi/existInMyPlaylist.jsp"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=big5" />
	<title> New Document </title>

	<link href="css/mh_style_e.css" rel="stylesheet" type="text/css">
	<script language="javascript" src="file:////javascript/iptv.js"></script>
	  <script language="javascript" src="../../js/common.js"></script>
	  <script language="javascript" src="js/top_up_menu/text.js"></script>
	<script language="javascript">
		var cur_cash_point = "<%=cashPointBalance%>";
		var errorCode = "<%=errorCode%>";
		var backURL = "<%=backURL%>";
		var urlparam = "cat=<%=cat%>&productid=<%=productId%>&referrer=detail.jsp&<%=urlParam%>";
		var SDpriceTxt = "<%=priceTxt[0]%>";
		var HDpriceTxt = "<%=priceTxt[1]%>";
		var SDprice = "<%=price[0]%>";
		var HDprice = "<%=price[1]%>";
		var SDcashpoint = "<%=cashPointPrice[0]%>";
		var HDcashpoint = "<%=cashPointPrice[1]%>";
		var SDexpdayval = "<%=expTimeVal[0]%>";
		var HDexpdayval = "<%=expTimeVal[1]%>";
		var movieDuration = "<%=movieDuration%>";
		var canGetCashPoint = <%=canGetCashPoint%>;
		
		<% if(isHDProfile) {%>
			var ishdprofile = "true";
		<% } else {%>
			var ishdprofile = "false";
		<% } %>
		var l_is_locked = "<%=isLocked%>";
		var l_is_restricted = "<%=isRestricted%>";
	</script>
		<script>
			<jsp:include page="<%=detail_include%>" />
	  </script>  
  	<script language="javascript" src="js/detail.js"></script>
</head>

<body bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e" onLoad="load()">
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
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10">Press <img align="absmiddle" src="../../images/up_down_button.png"> and ENTER to select</td>
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
                      <td height="254">
                            <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                    <td colspan="3" height="4"></td>
                            </tr>
                            <tr>
                                    <td width="120" height="32" class="title01">Title:</td>
                                    <td id="title" colspan="2" width="" height="32" class="title02"></td>
                                </tr>
                                <tr>
                                    <td width="120" height="32" class="duration01">Duration:</td>
                                    <td id="duration" width="91" height="32" class="duration02"></td>
                                    <td width="263" height="32" class="language01">Language:<span id="language" class="language02"></span></td>
                                </tr>
                                <tr>
                                    <td width="" height="50" class="casthost01">Starring:</td>
                                    <td id="cast" colspan="2" width="" height="50" class="casthost02"></td>
                                </tr>
                                <tr>
                                    <td width="" height="96" class="synopsis01">Synopsis:</td>
                                    <td id="synopsis" colspan="2" width="" height="96" class="synopsis02"></td>
                                </tr>
                                <tr>
                                    <td width="" height="32" class="offairdate01">Off-air date:</td>
                                    <td id="offAirDate" colspan="2" width="" height="32" class="offairdate02"></td>
                                </tr>
                                <tr>
                                    <td colspan="3" height="32" class="currentcashpoint01">Current now DOLLAR:<span id="cur_cash_point" class="currentcashpoint02"></span></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="112">
                            <table height="112" border="0" cellpadding="0" cellspacing="0" align="right">
                                <tr height="45">
                                    <td id="info" colspan="2" class="txtInfo02 paddingLeft18 paddingRight50"></td>
                                </tr>
                                <tr>
                                    <td width="125" height="3"></td>
                                    <td width="359" height="3"></td>
                                </tr>
                                <tr>
                                    <td id="type0" width="125" height="32" class="selectshorter01"></td>
                                    <td id="typePrice0" width="359" height="32" class="selectlonger02"></td>
                                </tr>
                                <tr>
                                    <td id="type1" width="125" height="32" class="unselectshorter01"></td>
                                    <td id="typePrice1" width="359" height="32" class="unselectlonger02"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                    	<td height="1"></td>
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
        	<td colspan="2" width="640" height="30" background="../../images/footer_acbalance_class_tc_e.jpg">
			</td>
        </tr>
	</table>
</body>
</html>


