<%@page contentType="text/html; charset=big5" pageEncoding="big5" %>
<%@include file="svod_header.jsp"%>
<%

String productId = request.getParameter("productid");
String seriesId = request.getParameter("seriesid");
String seriesProductId = request.getParameter("seriesproductid");
String scheduleId = request.getParameter("scheduleid");
String backURL = request.getParameter("referrer");
String cat_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+".js";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=big5" />
	<title> New Document </title>
    <link href="css/<%=styleId%>/mh_style_e.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="file:////javascript/iptv.js"></script>
	<script>
		<jsp:include page="<%=cat_include%>" />
	</script>
    <script language="javascript">
    var language = "<%=language%>";
    var catId = "<%=catId%>";
	var item_per_page = parseInt("<%=resource.getString("class.item_per_page")%>");
	var classification_list=new Array();
	var classification_title=new Array();
	var classification_content=new Array();
	var current_page = 0;
	
	<%
		try {
			for (int i=0; i < 100 ; i++) {
					resource.getString("class."+i+".class");
	%>
					classification_list[<%=i%>] = '<%=new String(resource.getString("class."+i+".class").getBytes("8859_1"),"Big5")%>'; 
					classification_title[<%=i%>] = '<%=new String(resource.getString("class."+i+".title").getBytes("8859_1"),"Big5")%>';
					classification_content[<%=i%>] = '<%=new String(resource.getString("class."+i+".content").getBytes("8859_1"),"Big5")%>';
					
	<%
			}
		} catch (Exception e) {
		}
	%>
	
	
	function MM_preloadImages() {
	  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
		var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
	}
	
	MM_preloadImages(
		"images/<%=styleId%>/<%=language%>/footer_pre.jpg",
		"images/<%=styleId%>/<%=language%>/footer.jpg",
		"images/<%=styleId%>/<%=language%>/footer_pre_next.jpg",
		"images/<%=styleId%>/<%=language%>/footer_next.jpg"
	);
		
	var urlParam = "productid=<%=productId%>&scheduleid=<%=scheduleId%>&referrer=<%=backURL%>&<%=urlParam%>";    
	iptvRegisterKeyHandler(keyEvent);
	function keyEvent(keyCode) {
		if (keyCode == KEY_BACK){
			//window.parent.location.href="detail.jsp?"+urlParam;
			iPanel.back();
		} else if (keyCode == KEY_YELLOW || keyCode == KEY_DOWN) {
			if ((current_page+1)*item_per_page < classification_list.length) {
				current_page+=1;
				if ((current_page+1)*item_per_page < classification_list.length) {
					document.getElementById("footer_img").style.background="images/<%=styleId%>/<%=language%>/footer_pre_next.jpg";
				} else {
					document.getElementById("footer_img").style.background="images/<%=styleId%>/<%=language%>/footer_pre.jpg";
				}

				for (i = 0; i < item_per_page; i++) {
					if (current_page*item_per_page+i < classification_list.length) {
						document.getElementById("class"+i+"_logo").src='images/<%=styleId%>/classicification_'+classification_list[current_page*item_per_page+i]+'.png';
						document.getElementById("class"+i+"_title").innerHTML=classification_title[current_page*item_per_page+i];
						document.getElementById("class"+i+"_content").innerHTML=classification_content[current_page*item_per_page+i];
					}
					else {
						document.getElementById("class"+i+"_logo").src=null;
						document.getElementById("class"+i+"_title").innerHTML="";
						document.getElementById("class"+i+"_content").innerHTML="";
					}
				}
			}
		} else if (keyCode == KEY_BLUE || keyCode == KEY_UP) {
			if ((current_page+1)*item_per_page >= classification_list.length && classification_list.length > item_per_page) {
				if (current_page > 0) {
					current_page--; 
					for (i = 0; i < item_per_page; i++){
						document.getElementById("class"+i+"_logo").src='images/<%=styleId%>/classicification_'+classification_list[current_page*item_per_page+i]+'.png';
						document.getElementById("class"+i+"_title").innerHTML=classification_title[current_page*item_per_page+i];
						document.getElementById("class"+i+"_content").innerHTML=classification_content[current_page*item_per_page+i];	
					}
				}
				if (current_page != 0) {
					document.getElementById("footer_img").style.background="images/<%=styleId%>/<%=language%>/footer_pre_next.jpg";
				} else {
					document.getElementById("footer_img").style.background="images/<%=styleId%>/<%=language%>/footer_next.jpg";
				}
			}
		} 
	}    		
	
	function load() {
		document.getElementById("logo").src="/vodtemplate/data/"+catId+"/"+logo_file;
		
		for (i = 0; i < item_per_page; i++){
			document.getElementById("class"+i+"_logo").src='images/<%=styleId%>/classicification_'+classification_list[i]+'.png';
			document.getElementById("class"+i+"_title").innerHTML=classification_title[i];
			document.getElementById("class"+i+"_content").innerHTML=classification_content[i];
		}
		
		if (item_per_page < classification_list.length) {
			document.getElementById("footer_img").style.background="images/<%=styleId%>/<%=language%>/footer_next.jpg";
		} else {
			document.getElementById("footer_img").style.background="images/<%=styleId%>/<%=language%>/footer.jpg";
		}
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
                                	<td height="275" class="termConditionTxt paddingLeft13"><%=new String(resource.getString("class.tnc").getBytes("8859_1"),"Big5")%></td>
                                </tr>
                            </table>
                        
                        </td>
                    </tr>
                    <tr>
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10"><!--Press <img align="absmiddle" src="images/up_down_left_right_button.png"> and ENTER to select--></td>
                    </tr>
                    <tr>
                    	<td width="165" height="5"></td>
                    </tr>
                </table>
            </td>

		<!-- right table -->
            <td width="475" height="495" valign="top">
              <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="36"><img width="475" height="36" border="0" src="images/<%=styleId%>/<%=language%>/back_exit.png"></td>                   
                    </tr>
                    <tr>
						<td>
							<table id="class_content" border="0" cellpadding="0" cellspacing="0" width="474" height="424" align="right">
								<tr>
									<td width="" height="50" class="txt01 paddingLeft18"><%=new String(resource.getString("class.title").getBytes("8859_1"),"Big5")%></td>
                                </tr>
								<tr>
									<td width="" height="3"></td>
								</tr>
                                <tr>
                                    <td width="" height="" >
										<table width="474" height="">
											<tr>
												<td width="42" class="paddingLeft18"><img id="class0_logo" src="" width="44" height="23"></td>
												<td width="12"></td>
												<td id="class0_title" width="402" class="headClass"></td>
											</tr>
										</table>
									</td>
                                </tr>
								<tr>
									<td width="" height=""></td>
								</tr>
                                <tr>
                                    <td id="class0_content" width="" class="paddingLeft18 paddingRight50 txtClass"></td>
                                </tr>
                                <tr>
									<td width="" height=""></td>
								</tr>
                                <tr>
									<td height="">
										<table width="474" height="">
											<tr>
												<td width="42" class="paddingLeft18"><img id="class1_logo" src="" width="44" height="23"></td>
												<td width="12"></td>
												<td id="class1_title" width="402" class="headClass"></td>
											</tr>
										</table>
									</td>
                                </tr>
								<tr>
									<td width="" height=""></td>
								</tr>
                                <tr>
									<td id="class1_content" class="paddingLeft18 paddingRight50 txtClass"></td>
                                </tr>
                                <tr>
									<td width="" height=""></td>
								</tr>
                                <tr>
                                    <td height="">
										<table width="474" height="">
											<tr>
												<td width="42" class="paddingLeft18"><img id="class2_logo" src="" width="44" height="23"></td>
												<td width="12"></td>
												<td id="class2_title" width="402" class="headClass"></td>
											</tr>
										</table>
									</td>
                                </tr>
								<tr>
									<td width="" height=""></td>
								</tr>
                                <tr>
                                    <td id="class2_content" width="" class="paddingLeft18 paddingRight50 txtClass"></td>
                                </tr>
                                <tr>
                                  <td width="" height=""></td>
								</tr>
                                <tr>
									<td height="">
										<table width="474" height="">
											<tr>
												<td width="42" class="paddingLeft18"><img id="class3_logo" src="" width="44" height="23"></td>
												<td width="12"></td>
												<td id="class3_title" width="402" class="headClass"></td>
											</tr>
										</table>
									</td>
                                </tr>
								<tr>
									<td width="" height=""></td>
								</tr>
                                <tr>
									<td id="class3_content" class="paddingLeft18 paddingRight50 txtClass"></td>
                                </tr>
                                <tr>
									<td width="" height=""></td>
								</tr>
								<tr>
									<td height="">
										<table width="474" height="">
										<tr>
											<td width="42" class="paddingLeft18"><img id="class4_logo" src="" width="44" height="23"></td>
											<td width="12"></td>
											<td id="class4_title" width="402" class="headClass"></td>
										</tr>
										</table>
									</td>
                                </tr>
								<tr>
									<td width="" height=""></td>
								</tr>
                                <tr>
									<td	id="class4_content" class="paddingLeft18 paddingRight50 txtClass"></td>
                                </tr>
							</table>                        
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!-- footer -->
		<tr>
			<td id="footer_img" colspan="2" width="640" height="35" background=""></td>
		</tr>
	</table>
</body>
</html>


