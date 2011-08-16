<%@page contentType="text/html; charset=big5" pageEncoding="big5"%>
<%@include file="qapi/isViewableProduct.jsp"%>
<%
	String cat_data_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+"_CAT_1.js";
%>
<html>
<head>
<title>EPL Match List</title>
<meta http-equiv='Content-Type' content='text/html; charset=big5'>
<script language='JavaScript' src='file:////javascript/iptv.js'></script>
<script>
			<jsp:include page="<%=cat_data_include%>" />
</script>
<script language='JavaScript' src='js/common.js'></script>
<script language='JavaScript' src='js/match_list.js'></script>
<script language="JavaScript">
var bar_pos = 1;
var window_shift = 0;
var styleId = "<%=styleId%>";
var language = "<%=language%>";
var urlparam = "<%=urlParam%>";
var today = new Date();
var product_id = "<%=productId%>";
<%if("true".equals(pressed_enter)){
%>
var pin_bar = "true";
<%
}else{
%>
var pin_bar = "false";
<%}%>

var product_array_digested = new Array();
var z = 0;
var previous_position = 0;
var founded = false;
for(var q=0; q < product_array.length; q++){
	if(!isPassed(product_array[q])){
		product_array_digested[z] = product_array[q];
		if(product_id == product_array_digested[z].id){
			previous_position = z;
			if(previous_position >= 10){
				window_shift = previous_position-9;
			}
			else{
				window_shift = 0;
			}
			founded = true;
		}
		z++;
	}
}
if(founded) bar_pos = previous_position - window_shift + 1;

function isPassed(the_date){
var end_time = 
	new Date(
	the_date.end_time.substring(0,4),
	parseInt(the_date.end_time.substring(4,6))-1,
	the_date.end_time.substring(6,8),
	the_date.end_time.substring(8,10),
	the_date.end_time.substring(10,12),
	the_date.end_time.substring(12,14));
return (end_time<today);
}

</script>

<style type="text/css">
body 	{color:#FFFFFF; }
td		{ font-size: 15px;}
</style>

</head>
<body  background="images/<%=styleId%>/<%=language%>/match_list_bg.gif" onload="init();" onunload="unload();">
	<table width="640" height="530" cellspacing="0" cellpadding="0" border="0" >
		<tr>
			<td colspan="3" height="105">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3" height="50">
				<table width="640" height="50" cellspacing="0" cellpadding="0" border="0" >
					<tr>
						<td width="80" align="top">&nbsp;</td>
						<img src="../../share/vodgif/" width="98" height="37" name="poster">
						<td width="352" align="top">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="50" align="top">&nbsp;</td>
			<td width="539" height="320" align="top">
<table cellspacing=0 cellpadding=0 border=0 width=539 >
								<tr id="row_1">
										<td width=539 height=32 align="left" valign="middle"><font id="color_1" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
								</tr>
								<tr id="row_2">
										<td width=539 height=32 align="left" valign="middle"><font id="color_2" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
								</tr>
								<tr id="row_3">
										<td width=539 height=32 align="left" valign="middle"><font id="color_3" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
								</tr>
								<tr id="row_4">
										<td width=539 height=32 align="left" valign="middle"><font id="color_4" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
								</tr>
								<tr id="row_5">
										<td width=539 height=32 align="left" valign="middle"><font id="color_5" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
								</tr>
								<tr id="row_6">
										<td width=539 height=32 align="left" valign="middle"><font id="color_6" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
								</tr>
								<tr id="row_7">
										<td width=539 height=32 align="left" valign="middle"><font id="color_7" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
								</tr>
								<tr id="row_8">
										<td width=539 height=32 align="left" valign="middle"><font id="color_8" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
								</tr>
								<tr id="row_9">
										<td width=539 height=32 align="left" valign="middle"><font id="color_9" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
								</tr>
								<tr id="row_10">
										<td width=539 height=32 align="left" valign="middle"><font id="color_10" color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
								</tr>
								
							</table>
			</td>
			<td width="51" align="top">&nbsp;			
					<form action="dummy.html" method="post" name="form1" target="change_page" ></form>
			</td>
		</tr>
		
		<tr id="bottom_bar">
			<td colspan="3" height="42" width="640">
				<table height="42" width="640">
				  <tr>
				   <td><img src="" width="481" height="42" border="0" alt=""></td>
				   <td id="pin_1"><img src="" width="36" height="42" border="0" alt=""></td>
				   <td id="pin_2"><img src="" width="36" height="42" border="0" alt=""></td>
				   <td id="pin_3"><img src="" width="36" height="42" border="0" alt=""></td>
				   <td id="pin_4"><img src="" width="36" height="42" border="0" alt=""></td>
				   <td><img src="" width="15" height="42" border="0" alt=""></td>
				  </tr>
				</table>
			</td>
		</tr>
		
	</table>

</body>
</html>
