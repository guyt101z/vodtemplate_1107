<%
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title> New Document </title>

    <link href="css/<%=styleId%>/mh_style_e.css" rel="stylesheet" type="text/css">
    
    <script language="javascript" src="file:////javascript/iptv.js"></script>
    <script language="javascript">
    	var catId = "<%=catId%>";
    	iptvRegisterKeyHandler(keyEvent);
    	function keyEvent(keyCode) {
    		if(keyCode == KEY_ENTER || keyCode == KEY_BACK){
					window.parent.location.href=document.referer;
    		}
    	}
    	function load() {
    		document.getElementById("logo").src="/vodtemplate/data/"+catId+"/"+logo_file;
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
                    	<td width="165" height="70" class="logo"><img width="145" height="52" align="top" src=""></td>
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
                        <td height="36">
                        	<img width="475" height="36" border="0" src="images/<%=language%>/back_exit.png"></td> 
                    </tr>
                    <tr>
                      <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="474" height="32" align="right">
                            <tr>
                                    <td height="4"></td>
                            </tr>
                            <tr>
                                    <td width="" height="109" class=" txt01 paddingLeft18"><%=new String(resource.getString("invalid_cust_cat.content").getBytes("8859_1"),"Big5")%></td>
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
        
		<!-- footer -->
		<tr>
        	<td colspan="2" width="640" height="35" background="images/footer.jpg">
			</td>
        </tr>
	</table>
</body>
</html>


