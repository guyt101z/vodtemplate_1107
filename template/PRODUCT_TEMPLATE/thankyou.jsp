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
<%@include file="qapi/getVodProductRestrictedFlags.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=big5" />
    <title> New Document </title>

    <link href="css/<%=styleId%>/mh_style_e.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="file:////javascript/iptv.js"></script>
		<script>
			<jsp:include page="<%=detail_include%>" />
			<jsp:include page="<%=cat_include%>" />
		</script>
  	<script language="javascript">
		var catId = "<%=catId%>";
		var language = "<%=language%>";
  		var urlparam = "<%=urlParam%>";
  		var l_is_locked = "<%=isLocked%>";
  		var l_is_restricted = "<%=isRestricted%>";
		var thankyou_content = "<%=new String(resource.getString("thankyou.content").getBytes("8859_1"),"Big5")%>";
  		var urlparamAppend = "";
		var productId = "<%=productId%>";
		var seriesId = "<%=seriesId%>";
		var seriesProductId = "<%=seriesProductId%>";
		if (seriesId != "" && seriesId != "null") {
                        urlparamAppend="&seriesid="+seriesId+"&seriesproductid="+seriesProductId;
                } else {
			urlparamAppend="&productid="+productId;
		}
  		var globalSVODLock = iptvGetNonVolatileData("g_svl");
			var restrictedSVODLock = iptvGetNonVolatileData("r_svl");
			if (l_is_locked == "true" || (restrictedSVODLock != "N" && l_is_restricted == "true") || globalSVODLock == "Y") {
				window.parent.location.href="thankyouwithpin.jsp?verified=false&playonly=false&cat=<%=cat%>&scheduleid=<%=scheduleId%>&<%=urlParam%>"+urlparamAppend;
			}
		iptvRegisterKeyHandler(keyEvent);
		function keyEvent(keyCode) {
			if(keyCode == KEY_ENTER){
				if(globalSVODLock == "Y"){
					window.parent.location.href="thankyouwithpin.jsp?verified=false&playonly=false&cat=<%=cat%>&scheduleid=<%=scheduleId%>&<%=urlParam%>"+urlparamAppend;
				} else {
					window.parent.location.href="qapi/getsvod.jsp?verified=true&playonly=false&cat=<%=cat%>&scheduleid=<%=scheduleId%>&<%=urlParam%>"+urlparamAppend;
				}
			} else if(keyCode == KEY_BACK){
				window.parent.location.href="detail.jsp?playonly=false&cat=<%=cat%>&scheduleid=<%=scheduleId%>&<%=urlParam%>"+urlparamAppend;
			} else if(keyCode == KEY_GREEN){
				window.parent.location.href="class.jsp?playonly=false&cat=<%=cat%>&scheduleid=<%=scheduleId%>&"+ urlparam+urlparamAppend;
			} else if(keyCode == KEY_BLUE){
				window.parent.location.href="t_c.jsp?playonly=false&cat=<%=cat%>&scheduleid=<%=scheduleId%>&"+urlparam+urlparamAppend;
			}
		}  	
		function load() {
			document.getElementById("logo").src="/vodtemplate/data/"+catId+"/"+logo_file;
			if (language == "zh_tw") {
				document.getElementById("thankyou_content").innerHTML = thankyou_content.replace(/<LIBRARY_NAME>/g,libname_chi);
			}
			else{
				document.getElementById("thankyou_content").innerHTML = thankyou_content.replace(/<LIBRARY_NAME>/g,libname_eng);
			}
		}
  	</script>    
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
							<!-- left table - poster and icon -->
                        	<table border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td height="25"></td>
                                </tr>
                                <tr>
                                	<td class="paddingLeft25"><!--img width="115" height="173" src="images/poster01.jpg"--></td>
                                </tr>
                                <tr>
                                	<td height="10"></td>
                                </tr>
                                <tr>
                                	<td><!--img class="paddingLeft25" src="images/classicification_PG.png"><img class="paddingLeft6" src="images/HD.png"><img class="paddingLeft6" src="images/SD.png"--></td>
                                </tr>
                            </table>
                        
                        </td>
                    </tr>
                    <tr>
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10"><!--<%=new String(resource.getString("common.continue").getBytes("8859_1"),"Big5")%>--></td>
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
                      <td height="254">
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
                                    <td width="" height="186" class=""></td>
                                </tr>
                            </table>    
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table height="143" border="0" cellpadding="0" cellspacing="0" align="right">
                            	<tr>
                                	<td colspan="2" height="66"></td>
                                </tr>
                                <tr>
                                    <td height="45" colspan="2" class="txtInfo02 paddingLeft18 paddingRight50"><!--You can also watch this on the internet for FREE.<br>
            For details, please visit moviehouse.now.com--></td>
                                </tr>
                                <tr>
                                    <td width="211" height="32" class="select01"><%=new String(resource.getString("movie.watch").getBytes("8859_1"),"Big5")%></td>
                                    <td width="263" height="32" class="select02"></td>
                                </tr> 
                            </table>    
                        </td>
                    </tr>
                    <tr>
                    	<td height="14"></td>
                    </tr>
                    <tr>
                        <td height="48" class="txtInfo02 paddingLeft18 paddingRight50"><!--This library may provide content not suitable for viewers under 18 and that the subscriber is responsible for selling own parental lock preference.--></td>
                    </tr>
                    <!--tr>
                    	<td height="5" colspan="3"></td>
                    </tr-->
                </table>
            </td>

		<!-- footer -->
		<tr>
        	<td colspan="2" width="640" height="35" background="images/<%=styleId%>/<%=language%>/footer_class_tc.jpg"></td>
        </tr>
	</table>
</body>
</html>



