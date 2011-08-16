<%@page contentType="text/html; charset=big5"%>
<%@include file="svod_header.jsp"%>

<%
String productId = request.getParameter("productid");
String seriesId = request.getParameter("seriesid");
String seriesProductId = request.getParameter("seriesproductid");
String scheduleId = request.getParameter("scheduleid");
String cat = request.getParameter("cat");
String detail_include = "";
String cat_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+".js";
if (productId == null || "".equals(productId)){
	detail_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+seriesId+".js";
} else {
	detail_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+productId+".js";
}
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
		</script>
		<script language="javascript">
			var language = "<%=language%>";
			var catId = "<%=catId%>";
			var urlparam = "cat=<%=cat%>&scheduleid=<%=scheduleId%>&<%=urlParam%>";
			var styleId = "<%=styleId%>";
			var productId = "<%=productId%>";
			var seriesId = "<%=seriesId%>";
			var seriesProductId = "<%=seriesProductId%>";
			if (productId != "" && productId != "null") {
				urlparam += "&productid="+productId;
			} else {
				urlparam += "&seriesid="+seriesId+"&seriesproductid="+seriesProductId;
			}
			var thankyou_content = "<%=new String(resource.getString("thankyou.content").getBytes("8859_1"),"Big5")%>";
		</script>
  	<script language="javascript" src="js/thankyouwithpin.js"></script>
  	
</head>

<body bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e" onload="load()">
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
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10"><!--Press <img align="absmiddle" src="../images/up_down_left_right_button.png"> and ENTER to select--></td>
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
                      <td height="183">
                            <table border="0" cellpadding="0" cellspacing="0" width="474" align="right">
                            <tr>
                                    <td height="4"></td>
                            </tr>
                            <tr>
                                    <td width="" height="32" class=" txt01 paddingLeft18"><%=new String(resource.getString("thankyou.title").getBytes("8859_1"),"Big5")%></td>
                                </tr>
                                <tr>
                                    <td id="thankyou_content" width="" height="32" class="txt02 paddingLeft18"></td>
                                </tr>
                                <tr>
                                    <td width="" height="115" class=""></td>
                                </tr>
                            </table>    
                        </td>
                    </tr>
                    <tr height="224">
                    	<td>
                            <table width="474" border="0" cellpadding="0" cellspacing="0" align="right">
                                <tr>
                                    <td height="133" colspan="2"> </td>
                                </tr>
                                <tr>
                                    <td height="32" colspan="2" class="paddingLeft18"></td>
                                </tr>
                                <tr>
                                    <td height="44" width="268" class="paddingLeft18 txtInfo05"><%=new String(resource.getString("pin.continue").getBytes("8859_1"),"Big5")%></td>
                                    <td width="206">
										<!--<img id="pin" width="181" height="38" src="images/star_0.png">-->
										<table border="0" cellpadding="0" cellspacing="0" width="206" height="44" class="inputBox">
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
                        <td height="48" class="txtInfo02 paddingLeft18 paddingRight50"><!--This library may provide content not suitable for viewers under 18 and that the subscriber is responsible for selling own parental lock preference.--></td>
                    </tr>
                    <!--tr>
                    	<td height="5" colspan="3"></td>
                    </tr-->
                </table>
	        </td>
        </tr>
        
		<!-- footer -->
		<tr>
			<td colspan="2" width="640" height="35" background="images/<%=styleId%>/<%=language%>/footer_class_tc.jpg"></td>
        </tr>
	</table>
</body>
</html>


