<%@page contentType="text/html; charset=big5" pageEncoding="big5"%>
<%@include file="svod_header.jsp"%>
<%
	String errorCode = "";
	String productId = request.getParameter("productid");
	String seriesId = request.getParameter("seriesid");
	String seriesProductId = request.getParameter("seriesproductid");
	String scheduleId = request.getParameter("scheduleid");
	String detail_include = "";
	if (productId == null || "".equals(productId)){
                detail_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+seriesId+".js";
        } else {
                detail_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+productId+".js";
        }
	String backURL = request.getParameter("referrer");
	String cat_pos = request.getParameter("cat_pos");
	String cat = request.getParameter("cat");
	String cat_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+".js";
	String cat_data_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+"_CAT_"+cat+".js";
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=big5" />
	<title> New Document </title>
	<link href="css/<%=styleId%>/mh_style_e.css" rel="stylesheet" type="text/css">

	<script language="javascript" src="file:////javascript/iptv.js"></script>
	<script language="javascript" src="js/common.js"></script>
	<script>
		<jsp:include page="<%=detail_include%>" />
		<jsp:include page="<%=cat_include%>" />
		<jsp:include page="<%=cat_data_include%>" />
  </script>
  	<script language="javascript">
		var language = "<%=language%>";
  		var catId = "<%=catId%>";
		var backURL = "<%=backURL%>";
		var urlparam = "cat=<%=cat%>&scheduleid=<%=scheduleId%>&<%=urlParam%>";
		var styleId = "<%=styleId%>";
		var seriesId = "<%=seriesId%>";
		var productId = "<%=productId%>";
		var seriesProductId = "<%=seriesProductId%>";
                if (productId != "" && productId != "null") {
                        urlparam+="&productid="+productId;
                }
                else {
                        urlparam+="&seriesid="+seriesId+"&seriesproductid="+seriesProductId;
                }
		window.onload = function() {
                        if (seriesId != "" && seriesId != "null"){
                                document.getElementById("titleName").innerHTML='<%=new String(resource.getString("series.title").getBytes("8859_1"),"Big5")%>';
                                document.getElementById("synopsisName").innerHTML='<%=new String(resource.getString("series.synopsis").getBytes("8859_1"),"Big5")%>';
                        }
                        else {
                                document.getElementById("titleName").innerHTML='<%=new String(resource.getString("product.title").getBytes("8859_1"),"Big5")%>';
                                document.getElementById("synopsisName").innerHTML='<%=new String(resource.getString("product.synopsis").getBytes("8859_1"),"Big5")%>';
                        }
                        document.getElementById("continue").innerHTML='<%=new String(resource.getString("common.continue").getBytes("8859_1"),"Big5")%>';
                }
    </script>
    <script language="javascript" src="js/pin.js"></script>
</head>

<body bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e" onLoad="load();">
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
					<td width="165" height="90" class="txtInfo01 paddingLeft10" id="continue"></td>
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
						<td height="36">
							<img width="475" height="36" border="0" src="images/<%=styleId%>/<%=language%>/back_exit.png">
						</td>
					</tr>
					<tr>
						<td height="271">
							<table border="0" cellpadding="0" cellspacing="0">
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
									<td width="" height="133" class="synopsis01" id="synopsisName"></td>
									<td id="synopsis" colspan="2" width="" height="133" class="synopsis02"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table height="88" width="474" border="0" cellpadding="0" cellspacing="0" align="right">
								<tr>
									<td height="41" colspan="2"> </td>
								</tr>
								<tr>
									<td height="32" colspan="2"><!--span class="paddingLeft18 txtInfo02">(non-refundable after subscription confirmation)</span--></td>
								</tr>
								<tr>
									<td height="44" width="268" class="paddingLeft18 txtInfo05"><%=new String(resource.getString("pin.continue").getBytes("8859_1"),"Big5")%></td>
									<td height="44" width="206">
									<!--<img id="pin" width="181" height="38" src="images/star_0.png">-->
										<table border="0" cellpadding="0" cellspacing="0"  width="206" height="44" class="inputBox">
											<tr>
												<td width="22"></td>
												<td width="39"><img id="pin1" style="z-index:1" width="19" height="17" src=""></td>
												<td width="39"><img id="pin2" style="z-index:1" width="19" height="17" src=""></td>
												<td width="39"><img id="pin3" style="z-index:1" width="19" height="17" src=""></td>
												<td width="39"><img id="pin4" style="z-index:1" width="19" height="17" src=""></td>
												<td width="28"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td id="errorMsg" height="19" colspan="2" class="paddingLeft18 txtInvalid"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td id="disclaimer" height="48" class="txtInfo02 paddingLeft18 paddingRight50"></td>
					</tr>
				<!--tr>
					<td height="5" colspan="3"></td>
				</tr-->
				</table>
			</td>
		</tr>

		<!-- footer -->
		<tr>
			<td colspan="2" width="640" height="33" background="images/<%=styleId%>/<%=language%>/footer_class_tc.jpg">
		</tr>
	</table>
</body>
</html>


