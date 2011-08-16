

<%@include file="../../ppv_header.jsp"%>
<%
	String cat = request.getParameter("cat");
	if(cat == null || "null".equals(cat) || cat.length() == 0){
		cat = "1";
	}
	String productId = request.getParameter("productid");
	if(productId == null || "null".equals(productId) || productId.length() == 0){
		productId = "No product id";
	}
	String cat_include = "../../data/"+ppvVersion+"/"+subcustcat+"/PPV_MH_CAT_EN.js";
	String cat_data_include = "../../data/"+ppvVersion+"/"+subcustcat+"/PPV_MH_CAT_"+cat+"_EN.js";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title> New Document </title>
		<link href="css/mh_style_e.css" rel="stylesheet" type="text/css">
    		
		<script language="javascript" src="file:////javascript/iptv.js"></script>
		<script language="javascript" src="../../js/common.js"></script>
		<script>
			<jsp:include page="<%=cat_include%>" />
			<jsp:include page="<%=cat_data_include%>" />
	  </script>
		<script language="javascript">
			var cat_pos = "<%=cat%>";
			var urlparam = "<%=urlParam%>";
			var grid_pos = 0;
			var grid_offset = 0;
			var page_pos = 1;
			
			var product_id = "";
			var k = -1;
			if("<%=productId%>" != "No product id"){
				for(k=0; k < product_array.length; k++){
					if(product_array[k].id == "<%=productId%>"){
						break;
					}
				}
			}
			else{
				product_id = "No product id";
			}
			if(cat_pos == cat_arr.length+1){
				window.parent.location.href="myplaylist.jsp?cat="+cat_pos+"&"+urlparam;
			}
		</script>
  	<script language="javascript" src="js/grid_view.js"></script>

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
			<!-- left table - category -->
                        <%@include file="ppv_cat.jsp"%>
                        
                        </td>
                    </tr>
                    <tr>
                    	<td width="165" height="90" class="txtInfo01 paddingLeft3">Press number to select category<br>Press <img align="absmiddle" src="../../images/up_down_left_right_button.png"> and ENTER<br>to select</td>
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
                        <td height="36"><img width="475" height="36" src="../../images/back_exit_e.png"></td>
                    </tr>
                    <tr>
                        <td height="459">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="155" height="230" align="right">
                                        <table id="rightslot0" width="145" height="229" cellpadding="0" cellspacing="0" border="0" class="movieUnSelect">
                                            <tr><td height="15"></td></tr>
                                            <tr><td height="173" align="center"><img id="rightgfx0" src="" width="115" height="173" border="0"></td></tr>
                                            <tr><td height="1"></td></tr>
                                            <tr><td height="40" align="center"><div id="name0" class="movieTxt"></div></td></tr>
                                        </table>
                                    </td>
                                    <td width="155" height="230" align="right">
                                        <table id="rightslot1" width="145" height="229" cellpadding="0" cellspacing="0" border="0" class="movieUnSelect">
                                            <tr><td height="15"></td></tr>
                                            <tr><td height="173" align="center"><img id="rightgfx1" src="" width="115" height="173" border="0"></td></tr>
                                            <tr><td height="1"></td></tr>
                                            <tr><td height="40" align="center"><div id="name1" class="movieTxt"></div></td></tr>
                                        </table>
                                    </td>
                                    <td width="155" height="230" align="right">
                                        <table id="rightslot2" width="145" height="229" cellpadding="0" cellspacing="0" border="0" class="movieUnSelect">
                                            <tr><td height="15"></td></tr>
                                            <tr><td height="173" align="center"><img id="rightgfx2" src="" width="115" height="173" border="0"></td></tr>
                                            <tr><td height="1"></td></tr>
                                            <tr><td height="40" align="center"><div id="name2" class="movieTxt"></div></td></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="155" align="right" height="229">
                                        <table id="rightslot3" width="145" height="229" cellpadding="0" cellspacing="0" border="0" class="movieUnSelect">
                                            <tr><td height="15"></td></tr>
                                            <tr><td height="173" align="center"><img id="rightgfx3" src="" width="115" height="173" border="0"></td></tr>
                                            <tr><td height="1"></td></tr>
                                            <tr><td height="40" align="center"><div id="name3" class="movieTxt"></div></td></tr>
                                        </table>
                                    </td>
                                    <td width="155" align="right" height="229">
                                        <table id="rightslot4" width="145" height="229" cellpadding="0" cellspacing="0" border="0" class="movieUnSelect">
                                            <tr><td height="15"></td></tr>
                                            <tr><td height="173" align="center"><img id="rightgfx4" src="" width="115" height="173" border="0"></td></tr>
                                            <tr><td height="1"></td></tr>
                                            <tr><td height="40" align="center"><div id="name4" class="movieTxt"></div></td></tr>
                                        </table>
                                    </td>
                                    <td width="155" align="right" height="229">
                                        <table id="rightslot5" width="145" height="229" cellpadding="0" cellspacing="0" border="0" class="movieUnSelect">
                                            <tr><td height="15"></td></tr>
                                            <tr><td height="173" align="center"><img id="rightgfx5" src="" width="115" height="173" border="0"></td></tr>
                                            <tr><td height="1"></td></tr>
                                            <tr><td height="40" align="center"><div id="name5" class="movieTxt"></div></td></tr>
                                        </table>
                                    </td>
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


