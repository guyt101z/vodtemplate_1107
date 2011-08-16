<%@page contentType="text/html; charset=big5" pageEncoding="big5" 
import="java.util.Arrays"%>
<%@include file="svod_header.jsp"%>
<%

String productId = request.getParameter("productid");
String scheduleId = request.getParameter("scheduleid");
String backURL = request.getParameter("referrer");
String cat_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+".js";
String tnc_group = "";
try {
	tnc_group = common_resource.getString("tandc."+subcustcat);
} catch (Exception e){
	tnc_group = "1";
}

%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=big5"/>
	<title> New Document </title>

    <link href="css/<%=styleId%>/mh_style_e.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="file:////javascript/iptv.js"></script>
	<script>
		<jsp:include page="<%=cat_include%>" />
	</script>
    <script language="javascript">
		var page_num = 0;
		var t_c_text = '<%=new String(common_resource.getString("tandc.tnc"+tnc_group).getBytes("8859_1"),"Big5")%>';
		t_c_text = t_c_text.split(/\|\|/);
		var language = "<%=language%>";
		var catId = "<%=catId%>";
		function MM_preloadImages() {
		  var d=document; if(d.images/<%=styleId%>){ if(!d.MM_p) d.MM_p=new Array();
		    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
		}
		MM_preloadImages(
		"images/<%=styleId%>/<%=language%>/footer_pre_next.jpg",
		"images/<%=styleId%>/<%=language%>/footer_next.jpg"
		"images/<%=styleId%>/<%=language%>/footer_pre.jpg"
		"images/<%=styleId%>/<%=language%>/footer.jpg"
		);
		
		var urlParam = "productid=<%=productId%>&scheduleid=<%=scheduleId%>&referrer=<%=backURL%>&<%=urlParam%>";


	iptvRegisterKeyHandler(keyEvent);

	function keyEvent(keyCode) {
		if (keyCode == KEY_BLUE || keyCode == KEY_UP) {
			if(page_num > 0){
				page_num--;
				if(page_num == 0){
					document.getElementById("footer_img").style.background="images/<%=styleId%>/<%=language%>/footer_next.jpg";
				}
				else {
					document.getElementById("footer_img").style.background="images/<%=styleId%>/<%=language%>/footer_pre_next.jpg";
				}
				document.getElementById("tc").innerHTML = t_c_text[page_num];
			}
		} else if (keyCode == KEY_YELLOW || keyCode == KEY_DOWN) {
			if(page_num < t_c_text.length-1){
				page_num++;
				if(page_num == t_c_text.length-1){
					document.getElementById("footer_img").style.background="images/<%=styleId%>/<%=language%>/footer_pre.jpg";
				}
				else {
					document.getElementById("footer_img").style.background="images/<%=styleId%>/<%=language%>/footer_pre_next.jpg";
				}
				document.getElementById("tc").innerHTML = t_c_text[page_num];
			}
		} else if(keyCode == KEY_BACK) {
			//window.parent.location.href="detail.jsp?"+urlParam;
			iPanel.back();
		}  
	}
	
	function load(){
		document.getElementById("logo").src="/vodtemplate/data/"+catId+"/"+logo_file;
		document.getElementById("tc_title").innerHTML = '<%=new String(common_resource.getString("tandc.title"+tnc_group).getBytes("8859_1"),"Big5")%>';
		document.getElementById("tc").innerHTML = t_c_text[0]; 
		document.getElementById("footer_img").style.background="images/<%=styleId%>/<%=language%>/footer_next.jpg";
    	}
    </script>
    
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
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10"><!--Press <img align="absmiddle" src="images/<%=styleId%>/up_down_left_right_button.png"> and ENTER to select--></td>
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
                      <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="474" height="32" align="right">
                            <tr>
                                    <td height="4"></td>
                            </tr>
                            <tr>
                                    <td id="tc_title" width="" height="32" class=" txt01 paddingLeft18"></td>
                                </tr>
                                <tr>
                                    <td width="" height="17" ></td>
                                </tr>
                                <tr>
                                    <td id="tc" width="" height="406" class="paddingLeft18 paddingRight50 txtTC">
                                    	
                                    </td>
                                </tr>
                            </table>                        
                            <!--This library may provide content not suitable for viewers under 18 and that the subscriber is responsible for selling own parental lock preference.--></td>
                    </tr>
                    
                    <!--tr>
                    	<td height="5" colspan="3"></td>
                    </tr-->
                </table>
	        </td>
        </tr>
        
		<!-- "footer -->
		<tr>
        	<td id="footer_img" colspan="2" width="640" height="35" background=""></td>
        </tr>
	</table>
</body>
</html>



