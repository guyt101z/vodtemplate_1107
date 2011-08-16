<%@include file="../../ppv_header.jsp"%>
<%
String cur_option = request.getParameter("cur_option");
String option_offset = request.getParameter("option_offset");
String status = request.getParameter("status");
String productId = request.getParameter("productid");
String backURL = request.getParameter("referrer");
String param = request.getHeader("referer");
//String param = request.getQueryString();
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title> New Document </title>

    <link href="css/mh_style_e.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="file:////javascript/iptv.js"></script>
    <script language="javascript">
		function MM_preloadImages() {
		  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
		    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
		}
		MM_preloadImages(
		'../../images/footer_pre_e.jpg',
		'../../images/footer_next_e.jpg'
		);
		
        var urlParam = "productid=<%=productId%>&referrer=<%=backURL%>&<%=urlParam%>";

	iptvRegisterKeyHandler(keyEvent);
	var first_page = "
                            <tr>
                                    <td height='2'></td>
                            </tr>
                            <tr>
                                    <!--<td width='' height='32' class=' txt01 paddingLeft18'>Classification</td>-->
                                    <td width='' height='50' class=' txt01 paddingLeft18'>Classification</td>
                                </tr>
                                 <tr>
                                  <td width=''  height='3'></td>
                              </tr>
                                <tr>
                                    <td width='' height='23' ><table width='474' height='23'border='0' cellpadding='0' cellspacing='0'>
                                      <tr>
                                        <td width='42' class='paddingLeft18'><img src='../../images/classicification_R18.png' width='44' height='23'></div></td>
                                        <td width='12'></td>
                                        <td width='402' class='headClass'>Restricted to viewers aged 18 and over</td>
                                      </tr>
                                    </table></td>
                                </tr>
                              <tr>
                                  <td width=''  height='3'></td>
                              </tr>
                                <tr>
                                    <td width=''   class='paddingLeft18 paddingRight50 txtClass'>This program is restricted to viewers aged 18 and over. The program may contain disturbing materials, violence, gore, horror, strong language, drug references, undesirable behaviour, adult elements, nudity and strong sexuality.</td>
                                </tr>
                                <tr>
                                  <td width=''  height='25'></td>
                              </tr>
                                <tr>
                                  <td  height='23'>
                                  <table width='474' height='23'border='0' cellpadding='0' cellspacing='0'>
                                      <tr>
                                        <td width='42' class='paddingLeft18'><img src='../../images/classicification_M.png' width='44' height='23'></div></td>
                                        <td width='12'></td>
                                        <td width='402' class='headClass'>Suitable only for mature audience</td>
                                      </tr>
                                    </table>                                  </td>
                                </tr>
                                  <tr>
                                  <td width=''  height='3'></td>
                              </tr>
                                <tr>
                                  <td    class='paddingLeft18 paddingRight50 txtClass'>This program is not suitable for viewers under 18 years old. The program may contain disturbing scenes, violence, gore, horror, strong language, drug references, undesirable behaviour, nudity, sexual content and adult elements.</td>
                                </tr>
                                <tr>
                                  <td width=''  height='5'></td>
                              </tr>
	";
	var second_page = "
                            <tr>
                                    <td height='2'></td>
                            </tr>
                            <tr>
                                    <!--<td width='' height='32' class=' txt01 paddingLeft18'>Classification</td>-->
                                    <td width='' height='50' class=' txt01 paddingLeft18'>Classification</td>
                                </tr>
                                 <tr>
                                  <td width=''  height='3'></td>
                              </tr>
                                <tr>
                                  <td  height='23'>
                                  
                                    <table width='474' height='23'border='0' cellpadding='0' cellspacing='0'>
                                      <tr>
                                        <td width='42' class='paddingLeft18'><img src='../../images/classicification_PG.png' width='44' height='23'></div></td>
                                        <td width='12'></td>
                                        <td width='402' class='headClass'>Parental guidance is recommended</td>
                                      </tr>
                                    </table>                                  </td>
                                </tr>
                                  <tr>
                                  <td width=''  height='3'></td>
                              </tr>
                                <tr>
                                  <td   class='paddingLeft18 paddingRight50 txtClass'>This program requires the guidance of parents or guardians. The program may contain violence, horror, disturbing materials, dangerous acts, coarse language, undesirable behaviour, nudity and adult elements.  </td>
                                </tr>
                                 <tr>
                                  <td width=''  height='25'></td>
                              </tr>
                                <tr>
                                  <td  height='23'>
                                    <table width='474' height='23'border='0' cellpadding='0' cellspacing='0'>
                                      <tr>
                                        <td width='42' class='paddingLeft18'><img src='../../images/classicification_G.png' width='44' height='23'></div></td>
                                        <td width='12'></td>
                                        <td width='402' class='headClass'>General</td>
                                      </tr>
                                    </table>                                  </td>
                                </tr>
                                  <tr>
                                  <td width=''  height='3'></td>
                              </tr>
                                <tr>
                                  <td    class='paddingLeft18 paddingRight50 txtClass'>Suitable for general viewers.</td>
                                </tr>
                                 <tr>
                                  <td width=''  height='5'></td>
                              </tr>
	";

	function keyEvent(keyCode) {
		if(keyCode == KEY_BACK){
			//window.parent.location.href="detail.jsp?"+urlParam;
			
			if("select_plan"=="<%=status%>"){
				window.parent.location.href="<%=param%>&status=<%=status%>";
			}
			else if("top_up_and_deduction"=="<%=status%>"){
				window.parent.location.href="<%=param%>&status=<%=status%>&init_cur_option=<%=cur_option%>&init_option_offset=<%=option_offset%>";
			}
			else{
				iPanel.back();
			}
		} else if(keyCode == KEY_BLUE || keyCode == KEY_UP){
			document.getElementById("class_content").innerHTML = first_page;
			document.getElementById("footer_img").style.background="../../images/footer_next_e.jpg";
		} else if(keyCode == KEY_YELLOW || keyCode == KEY_DOWN){
			document.getElementById("class_content").innerHTML = second_page;
			document.getElementById("footer_img").style.background="../../images/footer_pre_e.jpg";
		}
	}    		
	
	function load(){
		document.getElementById("class_content").innerHTML = first_page;
		document.getElementById("footer_img").style.background="../../images/footer_next_e.jpg";
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
                    	<td width="165" height="70" class="logo"><img width="145" height="52" align="top" src="../../images/sd_video_express_e_ppv.png"></td>
                    </tr>
                    <tr>
                    	<td valign="top" width="165" height="330">
							<!-- left table text -->
                        	<table border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td height="55"></td>
                                </tr>
                            	<tr>
                                	<td height="275" class="termConditionTxt paddingLeft13">You may choose to activate 'Parental Control' under MENU to prevent children's access to programs that are restricted to adults.<!--The now Select service Terms & Conditions (press MENU and select INFODESK to view) shall apply to your subscription of now Drama - Disney ABC (HD). Please press ENTER to confirm your acceptance of these Terms and Conditions and to subscribe to now Drama - Disney ABC.--></td>
                                </tr>
                            </table>
                        
                        </td>
                    </tr>
                    <tr>
                    	<td width="165" height="90" class="txtInfo01 paddingLeft10"><!--Press <img align="absmiddle" src="../../images/up_down_left_right_button.png"> and ENTER to select--></td>
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
                        <td height="36"><img width="475" height="36" border="0" src="../../images/back_exit_e.png"></td>                   
                    </tr>
                    <tr>
                      <td>
                            <table id="class_content" border="0" cellpadding="0" cellspacing="0" width="474"  align="right">
                            </table>                        
                      <!--This library may provide content not suitable for viewers under 18 and that the subscriber is responsible for selling own parental lock preference.--></td>
                    </tr>
                    
                    <!--tr>
                    	<td height="5" colspan="3"></td>
                    </tr-->
                </table>
	        </td>
      </tr>
        
		<!-- footer -->
		<tr>
        	<td id="footer_img" colspan="2" width="640" height="35" background="../../images/footer_next_e.jpg">
			</td>
        </tr>
	</table>
</body>
</html>


