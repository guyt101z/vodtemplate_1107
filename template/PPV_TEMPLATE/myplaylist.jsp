<%@page contentType="text/html" import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, java.util.List" %>
<%@include file="../../ppv_header.jsp"%>
<%
	String productId = request.getParameter("productid");
	if(productId == null || "null".equals(productId) || productId.length() == 0){
		productId = "No product id";
	}	 

	QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
	String detail_include = "../../data/"+ppvVersion+"/"+subcustcat+"/PPV_MH_CAT_EN.js";
%>
<%@include file="qapi/getplaylist.jsp"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title> New Document </title>
    <link href="css/mh_style_e.css" rel="stylesheet" type="text/css">
    		
		<script language="javascript" src="file:////javascript/iptv.js"></script>
	  <script language="javascript" src="../../js/common.js"></script>
		<script language="javascript">
			<%=jsBuf%>
			var urlparam = "<%=urlParam%>";
			
			var product_id = "";
			var k = -1;
			if("<%=productId%>" != "No product id"){
				for(k=0; k < playlist_arr.length; k++){
					if(playlist_arr[k].id == "<%=productId%>"){
						break;
					}
				}
			}
			else{
				product_id = "No product id";
			}
		</script>
		<script>
			<jsp:include page="<%=detail_include%>" />
		</script> 
		<script language="javascript" src="js/myplaylist.js"></script>


</head>
<body bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e" onLoad="load()">
	<table width="640" height="530" cellpadding="0" cellspacing="0" border="0">
		<!-- left table -->
		<tr>
        	<td width="175" height="495">
            	<table border="0" cellpadding="0" cellspacing="0">
                	<tr>
                    	<td width="175" height="70" class="logo"><img width="145" height="52" align="top" src="../../images/sd_video_express_e_ppv.png"></td>
                    </tr>
                    <tr>
                    	<td valign="top" width="175" height="330">
			<!-- left table - category -->
			<%@include file="ppv_cat.jsp"%>
                        </td>
                    </tr>
                    <tr>
                    	<td id="rightInstruction" width="175" height="90" class="txtInfo01 paddingLeft3">Press number to select category<br>Press <img align="absmiddle" src="../../images/up_down_button.png"> and ENTER<br>to select</td>
                    </tr>
                    <tr>
                    	<td width="175" height="5"></td>
                    </tr>
                </table>
            </td>

		<!-- right table -->
            <td width="465" height="495">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="36"><img width="465" height="36" border="0" src="../../images/back_exit_e.png"></td>                   
                    </tr>
                    <tr>
                      <td width="465" height="459">
                            <table id="playlistTable" width="474" border="0" cellpadding="0" cellspacing="0" align="right">
                                <tr>
                                        <td colspan="5" height="4"></td>
                                </tr>
                                <tr class="headerPlaylist">
                                        <td width="26" height="41"></td>
                                        <td width="161" height="41">Title</td>
                                        <td width="114" height="41" class="paddingLeft10">Type / Classification</td>
                                        <td width="138" height="41" class="paddingLeft10">Expiry date and time</td>
                                        <td width="15" height="41"></td>
                                </tr>
                                <tr id="rightslot0" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx0" border="0" src="../../images/"></td>
                                        <td width="161" height="46" class="paddingTop4" id="name0"></td>
                                        <td width="114" height="46" class="paddingLeft10 paddingTop4" id="typeClass0"></td>
                                        <td width="138" height="46" class="paddingLeft10 paddingTop4" id="expDate0"></td>
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot1" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx1" border="0" src="../../images/"></td>
                                        <td width="161" height="46" class="paddingTop4" id="name1"></td>
                                        <td width="114" height="46" class="paddingLeft10 paddingTop4" id="typeClass1"></td>
                                        <td width="138" height="46" class="paddingLeft10 paddingTop4" id="expDate1"></td>
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot2" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx2" border="0" src="../../images/"></td>
                                        <td width="161" height="46" class="paddingTop4" id="name2"></td>
                                        <td width="114" height="46" class="paddingLeft10 paddingTop4" id="typeClass2"></td>
                                        <td width="138" height="46" class="paddingLeft10 paddingTop4" id="expDate2"></td>
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot3" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx3" border="0" src="../../images/"></td>
                                        <td width="161" height="46" class="paddingTop4" id="name3"></td>
                                        <td width="114" height="46" class="paddingLeft10 paddingTop4" id="typeClass3"></td>
                                        <td width="138" height="46" class="paddingLeft10 paddingTop4" id="expDate3"></td>
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot4" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx4" border="0" src="../../images/"></td>
                                        <td width="161" height="46" class="paddingTop4" id="name4"></td>
                                        <td width="114" height="46" class="paddingLeft10 paddingTop4" id="typeClass4"></td>
                                        <td width="138" height="46" class="paddingLeft10 paddingTop4" id="expDate4"></td>
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot5" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx5" border="0" src="../../images/"></td>
                                        <td width="161" height="46" class="paddingTop4" id="name5"></td>
                                        <td width="114" height="46" class="paddingLeft10 paddingTop4" id="typeClass5"></td>
                                        <td width="138" height="46" class="paddingLeft10 paddingTop4" id="expDate5"></td>
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot6" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx6" border="0" src="../../images/"></td>
                                        <td width="161" height="46" class="paddingTop4" id="name6"></td>
                                        <td width="114" height="46" class="paddingLeft10 paddingTop4" id="typeClass6"></td>
                                        <td width="138" height="46" class="paddingLeft10 paddingTop4" id="expDate6"></td>
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot7" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx7" border="0" src="../../images/"></td>
                                        <td width="161" height="46" class="paddingTop4" id="name7"></td>
                                        <td width="114" height="46" class="paddingLeft10 paddingTop4" id="typeClass7"></td>
                                        <td width="138" height="46" class="paddingLeft10 paddingTop4" id="expDate7"></td>
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot8" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx8" border="0" src="../../images/"></td>
                                        <td width="161" height="46" class="paddingTop4" id="name8"></td>
                                        <td width="114" height="46" class="paddingLeft10 paddingTop4" id="typeClass8"></td>
                                        <td width="138" height="46" class="paddingLeft10 paddingTop4" id="expDate8"></td>
                                        <td width="15" height="46"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
	        </td>
        </tr>
        
		<!-- footer -->
		<tr>
        	<td id="footer_img" colspan="2" width="640" height="35" background="../../images/footer_acbalance_e.jpg">
		<!-- pages indicator -->
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="550"></td>
                        <td width="94">
                        	<table class="pageNumBg" width="94">
                        		<tr>
                        		<td id="pageNum" class="pageNum" width="94">
                        		</td>	
                        		</tr>
                        	</table>
                        </td>
                        <td width="13"></td>
                    </tr>
                </table>
			</td>
        </tr>
	</table>
</body>
</html>


