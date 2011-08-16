<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, java.net.URLEncoder"
%>
<%@include file="../../ppv_header.jsp"%>
<%	
	String [] price = new String [2];	// 0 - SD price
						// 1 - HD price	
						
	String [] priceTxt = new String [2];	// 0 - SD price text
						// 1 - HD price	text
							
	String productId = request.getParameter("productid");
	String cat = request.getParameter("cat");
	String movieFormat = request.getParameter("movieformat");
	
	String inRTSP = request.getParameter("inrtsp");
	String bitRate = request.getParameter("bitrate");
	String purchaseType = request.getParameter("purchasetype");
	
	QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
%>
<%@include file="../../ppv_subheader.jsp"%>
<%@include file="qapi/existInMyPlaylist.jsp"%>
<%@include file="qapi/getCashPointBalance.jsp"%>
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
	
String detail_include = "../../data/"+ppvVersion+"/"+subcustcat+"/PPV_MH_"+productId+"_EN.js";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title> New Document </title>

    <link href="css/mh_style_e.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="file:////javascript/iptv.js"></script>      
		<script language="javascript" src="../../js/common.js"></script>
		<script>
			<jsp:include page="<%=detail_include%>" />
		</script> 
    <script language="javascript">
<%
inRTSP = URLEncoder.encode(inRTSP, "US-ASCII");
%>
    	var urlparam = "movieDuration=<%=movieDuration%>&expdayval=<%=expDayVal%>&inrtsp=<%=inRTSP%>&bitrate=<%=bitRate%>&cat=<%=cat%>&productid=<%=productId%>&movieformat=<%=movieFormat%>&<%=urlParam%>";
    </script>
    <script language="javascript" src="js/thankyou.js"></script>
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
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10">Press ENTER to watch the program</td>
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
                    <% if("POSTPAID".equals(purchaseType)) { %>      
                    <tr>
                      <td height="183">
                            <table border="0" cellpadding="0" cellspacing="0" width="474" align="right">
                            <tr>
                                    <td height="4"></td>
                            </tr>
                            <tr>
                                    <td width="474" height="32" class="txt01 paddingLeft18">Thank You</td>
                                </tr>
                                <tr>
                                    <td width="474" valign="top" height="40" class="txt02 paddingLeft18 paddingRight13"><div id="title"></div></td>
                                </tr>
                                <tr>
                                    <td width="474" height="110" class=""></td>
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
                     <% } else { %>
                     <tr>
                      <td>
                            <table height="80" border="0" cellpadding="0" cellspacing="0" width="474" align="right">
                            <tr>
                            	<td width="474" height="32" class=" txt01 paddingLeft18">Thank You</td>
                            </tr>
                            <tr>
                              <td width="474" height="35" class="txt02 paddingLeft18" valign="top"><div id="title"></div></td>
                            </tr>
                            <tr>
                    					<td height="34">
                        				<table height="34" border="0" cellpadding="0" cellspacing="0" align="right">
                            			<tr>
                                		<td width="310" class="txt02 paddingLeft18" valign="top">Expiry date and time:</td>
                                		<td width="164" class="txt01" valign="top"><%=expDay%></td>
                                	</tr>
                            		</table>
                        		</td>
                    				</tr>    
                     				</table>    
                        </td>
                    </tr>
                     <tr>
                      	<td height="65"></td>
                      </tr>
                      <tr>
                    		<td height="64">
                        	<table width="474" cellspacing="0" cellpadding="0" border="0" align="right">
                            	<tr style="background-image: url('../../images/time_remain_bar_top.png');">
                                	<td height="32" width="310" class="txt02 paddingLeft18">Current now DOLLAR:</td>
                                	<td height="32" width="164" class="txt01">$<%=cashPointBalance%></td>
                                </tr>
                            	<tr style="background-image: url('../../images/time_remain_bar_bottom.png');">
                                	<td height="32" width="310" class="txt02 paddingLeft18">Expiry date : <%=expiryDateString%></td>
                                	<td height="32" width="164" class="txt01"></td>
                                </tr>
                            </table>
                        
                        </td>
                    </tr>
                     <% } %>
                    <tr>
                    	<td>
                            <table border="0" cellpadding="0" cellspacing="0" align="right">
                            	<tr>
                                	<td colspan="2" height="90"></td>
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
                        <td height="80" class="txtInfo02 paddingLeft18 paddingRight50">Some programs are suitable for viewing by adults only. You are responsible for selecting and setting your own parental lock preference via the MENU page.</td>
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
	</frame>
</body>
</html>


