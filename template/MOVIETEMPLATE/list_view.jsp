<%@page contentType="text/html; charset=big5" pageEncoding="big5" %>
<%@include file="svod_header.jsp"%>
<%
	String cat = request.getParameter("cat");
	String seriesId = request.getParameter("seriesid");
	String productId = request.getParameter("productid");
	if(cat == null || "null".equals(cat) || "".equals(cat)){
		cat = "1";
	}
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
                        if(productId != "" && productId != "null"){
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
  	<script language="javascript" src="js/list_view.js"></script>

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
                    	<td width="165" height="90" class="txtInfo01 paddingLeftSelect"><%=new String(resource.getString("list.select").getBytes("8859_1"),"Big5")%></td>
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
                        <td height="36"><img width="475" height="36" border="0" src="images/<%=styleId%>/<%=language%>/back_exit.png"></td>                   
                    </tr>
                    <tr>
                      <td width="475" height="459">
                            <table width="474" border="0" cellpadding="0" cellspacing="0" align="right">
                                <tr>
                                        <td colspan="5" height="4"></td>
                                </tr>
                                <tr class="headerPlaylist">
                                        <td width="26" height="41"></td>
                                        <td width="161" height="41"><%=new String(resource.getString("list.title").getBytes("8859_1"),"Big5")%></td>
                                        <td width="252" height="41" class="paddingLeft10"><%=new String(resource.getString("list.cast").getBytes("8859_1"),"Big5")%></td>
                                        <!--td width="87" height="41" class="paddingLeft10">Off-air date</td-->
                                        <td width="15" height="41"></td>
                                </tr>
                                <tr id="rightslot0" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx0" width="26" src=""></td>
                                        <td width="161" height="46" class="paddingTop4" id="name0"></td>
                                        <td width="252" height="46" class="paddingLeft10 paddingTop4" id="cast0"></td>
                                        <!--td width="87" height="46" class="paddingLeft10 paddingTop4" id="offAirDate0"></td-->
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot1" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx1" width="26" src=""></td>
                                        <td width="161" height="46" class="paddingTop4" id="name1"></td>
                                        <td width="252" height="46" class="paddingLeft10 paddingTop4" id="cast1"></td>
                                        <!--td width="87" height="46" class="paddingLeft10 paddingTop4" id="offAirDate1"></td-->
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot2" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx2" width="26" src=""></td>
                                        <td width="161" height="46" class="paddingTop4" id="name2"></td>
                                        <td width="252" height="46" class="paddingLeft10 paddingTop4" id="cast2"></td>
                                        <!--td width="887" height="46" class="paddingLeft10 paddingTop4" id="offAirDate2"></td-->
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot3" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx3" width="26" src=""></td>
                                        <td width="161" height="46" class="paddingTop4" id="name3"></td>
                                        <td width="252" height="46" class="paddingLeft10 paddingTop4" id="cast3"></td>
                                        <!--td width="87" height="46" class="paddingLeft10 paddingTop4" id="offAirDate3"></td-->
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot4" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx4" width="26" src=""></td>
                                        <td width="161" height="46" class="paddingTop4" id="name4"></td>
                                        <td width="252" height="46" class="paddingLeft10 paddingTop4" id="cast4"></td>
                                        <!--td width="87" height="46" class="paddingLeft10 paddingTop4" id="offAirDate4"></td-->
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot5" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx5" width="26" src=""></td>
                                        <td width="161" height="46" class="paddingTop4" id="name5"></td>
                                        <td width="252" height="46" class="paddingLeft10 paddingTop4" id="cast5"></td>
                                        <!--td width="87" height="46" class="paddingLeft10 paddingTop4" id="offAirDate5"></td-->
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot6" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx6" width="26" src=""></td>
                                        <td width="161" height="46" class="paddingTop4" id="name6"></td>
                                        <td width="252" height="46" class="paddingLeft10 paddingTop4" id="cast6"></td>
                                        <!--td width="87" height="46" class="paddingLeft10 paddingTop4" id="offAirDate6"></td-->
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot7" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx7" width="26" src=""></td>
                                        <td width="161" height="46" class="paddingTop4" id="name7"></td>
                                        <td width="252" height="46" class="paddingLeft10 paddingTop4" id="cast7"></td>
                                        <!--td width="87" height="46" class="paddingLeft10 paddingTop4" id="offAirDate7"></td-->
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="rightslot8" class="unselectPlaylist">
                                        <td width="26" height="46"><img id="rightgfx8" width="26" src=""></td>
                                        <td width="161" height="46" class="paddingTop4" id="name8"></td>
                                        <td width="252" height="46" class="paddingLeft10 paddingTop4" id="cast8"></td>
                                        <!--td width="87" height="46" class="paddingLeft10 paddingTop4" id="offAirDate8"></td-->
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


