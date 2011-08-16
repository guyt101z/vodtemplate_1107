<%@page contentType="text/html; charset=big5" pageEncoding="big5"%>
<%@include file="svod_header.jsp"%>
<%
	String cat = request.getParameter("cat");
	if(cat == null || "null".equals(cat) || cat.length() == 0){
		cat = "1";
	}
	String productId = request.getParameter("productid");
	String seriesId = request.getParameter("seriesid");
	String cat_data_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+"_CAT_"+cat+".js";
	String cat_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+".js";
%>
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
	  	</script>
		<script language="javascript">
			var language = "<%=language%>";
			var catId = "<%=catId%>"
			var cat_pos = "<%=cat%>";
			var urlparam = "<%=urlParam%>";
			var styleId = "<%=styleId%>";
			var k = -1;
			var productId = "<%=productId%>";
			var seriesId = "<%=seriesId%>";
			if (productId != "" && productId != "null"){
				for(k=0; k < product_array.length; k++){
					if(product_array[k].id == productId){
						break;
					}
				}
			}
			if (k == -1 && seriesId != "" && seriesId != "null"){
				for (k= 0; k < series_array.length; k++){
					if (series_array[k].id == seriesId) {
						break;
					}
				}
				k += product_array.length;
			}
		</script>
  	<script language="javascript" src="js/grid_view.js"></script>
</head>

<body bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg_a body_e" onLoad="load()">
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
			<!-- left table - category -->
                        <%@include file="svod_cat.jsp"%>

                        </td>
                    </tr>
                    <tr>
						<td width="165" height="90" class="txtInfo01 paddingLeftSelect"><%=new String(resource.getString("grid.select").getBytes("8859_1"),"Big5")%></td>
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
                        <td height="36"><img width="475" height="36" src="images/<%=styleId%>/<%=language%>/back_exit.png"></td>
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
        	<td id="footer_img" colspan="2" width="640" height="35" background="">
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


