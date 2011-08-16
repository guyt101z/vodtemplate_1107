<%@page contentType="text/html; charset=big5"%>
<%@include file="qapi/islibrarysubscribed.jsp"%>
<%
	String productId = request.getParameter("productid");
	String seriesId = request.getParameter("seriesid");
	String seriesProductId = request.getParameter("seriesproductid");
	String cat = request.getParameter("cat");
	String backURL = request.getParameter("referrer");
	String detail_include = "";
	if (productId == null || "".equals(productId) || "null".equals(productId)){
		detail_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+seriesId+".js";
	} else {
		detail_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+productId+".js";
	}
	String cat_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+".js";
	String cat_data_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+"_CAT_"+cat+".js";
%>
<%@include file="qapi/getVodProductRestrictedFlags.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=big5" />
	<title> New Document </title>
	<link href="css/<%=styleId%>/mh_style_e.css" rel="stylesheet" type="text/css">
	<script language="javascript" src="file:////javascript/iptv.js"></script>
	<script language="javascript" src="js/common.js"></script>
	<script>
		<jsp:include page="<%=cat_include%>" />
		<jsp:include page="<%=cat_data_include%>" />
		<jsp:include page="<%=detail_include%>" />
	</script>
	<script language="javascript">
		var language = "<%=language%>";
		var catId = "<%=catId%>";
		var styleId = "<%=styleId%>";
    		var backURL = "<%=backURL%>";
    		var urlparam = "cat=<%=cat%>&<%=urlParam%>";
		var productId = "<%=productId%>";
		var seriesId = "<%=seriesId%>";
		var seriesProductId = "<%=seriesProductId%>";
		if (productId != "" && productId != "null") {
			urlparam+="&productid="+productId+"&scheduleid="+scheduleid;
		}
		if (seriesId != "" && seriesId != "null") {
			urlparam+="&seriesid="+seriesId;
		}
		//bug fix for I_Panel abnormal HTML behavior
    		var libsubscribed = "<%=libSubscribed%>";
    		var l_is_locked = "<%=isLocked%>";
    		var l_is_restricted = "<%=isRestricted%>";
		window.onload = function() {
			if (seriesId != "" && seriesId != "null"){
				document.getElementById("continue").innerHTML='<%=new String(resource.getString("detail.episode.continue").getBytes("8859_1"),"Big5")%>';
				document.getElementById("titleName").innerHTML='<%=new String(resource.getString("series.title").getBytes("8859_1"),"Big5")%>';
				document.getElementById("synopsisName").innerHTML='<%=new String(resource.getString("series.synopsis").getBytes("8859_1"),"Big5")%>';
			}
			else {
				document.getElementById("continue").innerHTML='<%=new String(resource.getString("common.continue").getBytes("8859_1"),"Big5")%>';
				document.getElementById("titleName").innerHTML='<%=new String(resource.getString("product.title").getBytes("8859_1"),"Big5")%>';
				document.getElementById("synopsisName").innerHTML='<%=new String(resource.getString("product.synopsis").getBytes("8859_1"),"Big5")%>';
			}
			// For handling the bug 7391
			iptvRegisterKeyHandler(keyEvent);
		}
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
                    	<td width="165" height="70" class="logo"><img id="logo" width="145" height="52" align="top" src=""></td>
                    </tr>
                    <tr>
                    	<td valign="top" width="165" height="330">
							<!-- left table - poster and icon -->
                        	<table border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td height="25"></td>
                                </tr>
                                <tr>
                                	<td class="paddingLeft25"><img id="poster" width="115" height="173" src="images/spacer.gif"></td>
                                </tr>
                                <tr>
                                	<td height="10"></td>
                                </tr>
                                <tr>
                                	<td>
                                		<table border="0" cellpadding="0" cellspacing="0">
                                			<tr>
                                				<td width="27" height="24"><img class="paddingLeft6" width="27" height="24" src="images/spacer.gif"></td>
                                				<td width="43" height="23">
                                					<table id="classTable" width="43" height="23" border="0" cellpadding="0" cellspacing="0" background="images/spacer.gif">
                                						<tr>
                                							<td class="paddingTop3" id="classification" align="middle" valign="middle">
                                							</td>
                                						</tr>
                                					</table>
                                				</td>
                                				<td width="27" height="24"><img id="hdpic" class="paddingLeft6" width="27" height="24" src="images/spacer.gif"></td>
                                				<td width="27" height="24"><img id="sdpic" class="paddingLeft6" width="27" height="24" src="images/spacer.gif"></td>
                                			</tr>
	                                	<!--img id="classification" class="paddingLeft25" width="44" height="23" src="images/spacer.gif"-->
	                                	</table>
                                	</td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                    <tr>
                    	<td width="165" height="90" style="position: absolute;" class="txtInfo01 paddingLeft10" id="continue"></td>
                    </tr>
                    <tr>
                    	<td width="165" height="5"></td>
                    </tr>
                </table>
            </td>

		<!-- right table -->
            <td width="475" height="495">
                <table border="0" cellpadding="0" cellspacing="0" width="474" align="right">
                    <tr>
                        <td height="36"><img width="475" height="36" border="0" src="images/<%=styleId%>/<%=language%>/back_exit.png"></td>
                    </tr>
                        <!-- product Or Series start -->
		<% if (seriesId == null || "".equals(seriesId) || "null".equals(seriesId)) { %>
                    <tr>
                      <td height="267">
                            <table border="0" cellpadding="0" cellspacing="0" align="right" width="474" height="267">
                            <tr>
                                    <td colspan="3" height="4"></td>
                            </tr>
                            <tr>
                                    <td width="120" height="32" class="title01" id="titleName"></td>
                                    <td id="title" colspan="2" width="" height="32" class="title02"></td>
                                </tr>
                                <tr>
                                    <td width="120" height="32" class="duration01"><%=new String(resource.getString("product.duration").getBytes("8859_1"),"Big5")%></td>
                                    <td id="duration" width="91" height="32" class="duration02"></td>
                                    <td width="263" height="32" class="language01"><%=new String(resource.getString("product.language").getBytes("8859_1"),"Big5")%><span id="language" class="language02"></span></td>
                                </tr>
                                <tr>
                                    <td width="" height="53" class="casthost01"><%=new String(resource.getString("product.cast").getBytes("8859_1"),"Big5")%></td>
                                    <td id="cast" colspan="2" width="" height="53" class="casthost02"></td>
                                </tr>
                                <tr>
                                    <td width="" height="134" class="synopsis01" id="synopsisName"></td>
                                    <td id="synopsis" colspan="2" width="" height="134" class="synopsis02"></td>
                                </tr>
                                <tr>
                                    <td width="" height="12" class="offairdate01"></td>
                                    <td colspan="2" width="" height="12" class="offairdate02"></td>
                                </tr>
<!--
                                <tr>
                                    <td colspan="3" height="2" class="currentcashpoint01">Current cash point:<span class="currentcashpoint02">45pt</span></td>
                                </tr>
-->
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="144">
                            <table height="123" border="0" cellpadding="0" cellspacing="0" align="right">
                                <tr>
                                        <td colspan="2" height="46"></td>
                                </tr>
                                <tr>
                                    <td height="45" colspan="2" class="txtInfo02 paddingLeft18 paddingRight50"></td>
                                </tr>
                                <tr>
                                    <td width="211" height="32" class="select01"><%=new String(resource.getString("movie.watch").getBytes("8859_1"),"Big5")%></td>
                                    <td width="263" height="32" class="select02"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
		<% } else { %>
                    <tr>
                      <td>
                            <table border="0" cellpadding="0" cellspacing="0" align="right" width="474">
                            <tr>
                                    <td colspan="3" height="4"></td>
                            </tr>
                            <tr>
                                    <td width="120" height="32" class="title01" id="titleName"></td>
                                    <td id="title" colspan="2" width="" height="32" class="title02"></td>
                                </tr>
                                <tr>
                                    <td width="120" height="32" class="duration01"><%=new String(resource.getString("product.duration").getBytes("8859_1"),"Big5")%></td>
                                    <td id="duration" width="91" height="32" class="duration02"></td>
                                    <td width="263" height="32" class="language01"><%=new String(resource.getString("product.language").getBytes("8859_1"),"Big5")%><span id="language" class="language02"></span></td>
                                </tr>
                                <tr>
                                    <td width="" height="53" class="casthost01"><%=new String(resource.getString("product.cast").getBytes("8859_1"),"Big5")%></td>
                                    <td id="cast" colspan="2" width="" height="53" class="casthost02"></td>
                                </tr>
                                <tr>
                                    <td width="" height="92" class="synopsis01" id="synopsisName"></td>
                                    <td id="synopsis" colspan="2" width="400" height="92" class="synopsis02"></td>
                                </tr>
                                <tr>
                                    <td width="" height="4" class="offairdate01"></td>
                                    <td colspan="2" width="" height="4" class="offairdate02"></td>
                                </tr>
<!--
                                <tr>
                                    <td colspan="3" height="2" class="currentcashpoint01">Current cash point:<span class="currentcashpoint02">45pt</span></td>
                                </tr>
-->
                            </table>
                        </td>
                    </tr>
                    <tr id="LIST_TEMPLATE" class="series_list_hide">
                        <td height="194">
                            <table id="episodeList" width="474" border="0" cellpadding="0" cellspacing="0" align="right">
                                <tr>
                                    <td width="" height="34" class="header01" colspan="2"><%=new String(resource.getString("detail.episode.header").getBytes("8859_1"),"Big5")%></td>
                                </tr>
                                <tr id="morePlanUp">
                                    <td width="474" colspan="2"><div id="morePlanUp_row1"></div></td>
                                </tr>
                                <tr id="item0" class="morePlan_show">
                                    <td id="item0_row1" width="40" class="unselect01"></td>
                                    <td id="item0_row2" width="434" class="unselect02"></td>
                                </tr>
                                <tr id="item1" class="morePlan_show">
                                    <td id="item1_row1" width="" class="unselect01"></td>
                                    <td id="item1_row2" width="" class="unselect02"></td>
                                </tr>
                                <tr id="item2" class="morePlan_show">
                                    <td id="item2_row1" width="" class="unselect01"></td>
                                    <td id="item2_row2" width="" class="unselect02"></td>
                                </tr>
                                <tr id="item3" class="morePlan_show">
                                    <td id="item3_row1" width="" class="unselect01"></td>
                                    <td id="item3_row2" width="" class="unselect02"></td>
                                </tr>
                                <tr id="item4" class="morePlan_show">
                                    <td id="item4_row1" width="" class="unselect01"></td>
                                    <td id="item4_row2" width="" class="unselect02"></td>
                                </tr>
                                <tr id="morePlanDown">
                                    <td width="474" colspan="2"><div id="morePlanDown_row1"></div></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
		 <% } %>
			<!-- product Or Series start -->
			<!-- product Or Series end -->
                    <tr>
                        <td id="disclaimer" height="48" class="txtInfo02 paddingLeft18 paddingRight50"></td>
                    </tr>
                </table>
            </td>

		<!-- footer -->
		<tr id="footer">
        	<td colspan="2" width="640" height="23" background="images/<%=styleId%>/<%=language%>/footer_class_tc.jpg"></td>
        </tr>
	</table>
</body>
</html>


