var pinArray = new Array(4);
pinArray[0] = "";
pinArray[1] = "";
pinArray[2] = "";
pinArray[3] = "";
var pin_pos = 0;
var num_try = 0;
function pinInit(){
	document.getElementById("body_content").innerHTML = pin_body_content;
	if (!isNaN(cur_cash_point)) {
		document.getElementById("cur_cash_point").innerHTML = top_up_menu_txt_04+cur_cash_point;
		document.getElementById("total_point").innerHTML = top_up_menu_txt_04+(parseFloat(cur_cash_point)+parseFloat(planlist_arr[cur_option+option_offset-1].cashPoint));
	}
	else {
		document.getElementById("cur_cash_point").innerHTML = cur_cash_point;
		document.getElementById("total_point").innerHTML = cur_cash_point;
	}
	
	document.getElementById("selected_plan").innerHTML = top_up_menu_txt_04+planlist_arr[cur_option+option_offset-1].cashPoint;
	iptvRegisterKeyHandler(pinKeyEvent);
	pinArray[0] = "";
	pinArray[1] = "";
	pinArray[2] = "";
	pinArray[3] = "";
	pin_pos = 0;
	num_try = 0;
}
function pinToggle(pos){
	for(var p=1; p < 5; p++){
		if(p < pos+1){
			document.getElementById("pin"+p).innerHTML="<img width='19' height='17' src='../../images/star_01.png'>";
		}
		else{
			document.getElementById("pin"+p).innerHTML="<img width='19' height='17' src='../../images/spacer.png'>";
		}
  }
}
function pinKeyEvent(keyCode) {
	if(keyCode == KEY_ENTER){
		if(pin_pos == 4){
			var ppin = "" + pinArray[0] + pinArray[1] + pinArray[2] + pinArray[3];
			if(iptvVerifyPIN(ppin)){
				//ok no problem
				window.parent.location.href="top_up_thankyou.jsp?cat="+cat+"&productid="+productid+"&rereferrer="+referrer+"&addval="+planlist_arr[cur_option+option_offset-1].cashPoint+"&dotopup=true&stbid="+stbid+"&stbsid="+stbsid+"&topupoffercode="+planlist_arr[cur_option+option_offset-1].offerCode+"&balance="+cur_cash_point;
			}
			else{
				if(pin_pos == 4){
					num_try++;
					pin_pos = 0;
					pinToggle(pin_pos);
					document.getElementById("errorMsg").innerHTML=top_up_menu_txt_14;
					if(num_try == 3){
						//game over
						window.parent.location.href="error.jsp?respcode=wrongpassword&price="+price+"&"+urlparam;
					}
				}
			}
		}
	}
	else if(keyCode == KEY_CLEAR) {
		if(pin_pos > 0){
			pin_pos--;
			pinToggle(pin_pos);
		}
	}
	else if(keyCode == KEY_BLUE){
			window.parent.location.href = "/vod/moviehouse/"+ui_lang+"n/ppv/t_c.jsp?"+urlParam;
	}
	else if(keyCode == KEY_BACK){
		loadLayout("plan");
	}
	else if(538 > keyCode && keyCode > 527) {
		if(4 > pin_pos){
			var in_num = keyCode-528;
			pinArray[pin_pos] = in_num;
			pin_pos++;
			pinToggle(pin_pos);
		}
  }
	else{
	}
}
var pin_body_content = 
"
<table width='640' height='530' cellpadding='0' cellspacing='0' border='0'>
<!-- left table -->
<tr>
<td width='165' height='495'>
<table border='0' cellpadding='0' cellspacing='0'>
<tr>
<td width='165' height='70' class='logo'><img width='145' height='52' align='top' src='../../images/sd_video_express_"+ui_lang+"_ppv.png'></td>
</tr>
<tr>
<td valign='top' width='165' height='330'>
<!-- left table - poster and icon -->
<table width='165' height='330' border='0' cellpadding='0' cellspacing='0'>
<tr>
<td height='25'></td>
</tr>
<tr>
<td height='173' class='paddingLeft25'></td>
</tr>
<tr>
<td height='10'></td>
</tr>
<tr>
<td height='24'></td>
</tr>
<tr>
<td height='98'></td>
</tr>
</table>

</td>
</tr>
<tr>
<td width='165' height='90' class='txtInfo01 paddingLeft10'></td>
</tr>
<tr>
<td width='165' height='5'></td>
</tr>
</table>
</td>

<!-- right table -->
<td width='475' height='495'>
<table width='474' border='0' cellpadding='0' cellspacing='0' align='right'>
<tr>
<td height='36'><img width='475' height='36' border='0' src='../../images/back_exit_"+ui_lang+".png'></td>
</tr>
<tr>
<td>
<table border='0' cellpadding='0' cellspacing='0' width='474' align='right'>
<tr>
<td height='4' colspan='3'></td>
</tr>
<tr>
<td width='' height='32' colspan='3' class='txt01 paddingLeft18'>"+top_up_menu_txt_02+"</td>
</tr>
<tr>
<td colspan='2' width='310' height='32' class='txt02 paddingLeft18'>"+top_up_menu_txt_03+"</td>
<td id='cur_cash_point' width='164' height='32' class='txt01'></td>
</tr>
<tr>
<td width='295' height='32' class='txt02 paddingLeft18'>"+top_up_menu_txt_10+"</td>
<td width='15' height='32' class='txt01'>+</td>
<td id='selected_plan' width='164' height='32' class='txt01'></td>
</tr>
<tr>
<td colspan='3' height='1' bgcolor='#2e2640'></td>
</tr>
<tr>
<td colspan='2' width='310' height='32' class='txt01' style='text-align:right; padding-right:10px;'>"+top_up_menu_txt_11+"</td>
<td id='total_point' width='164' height='32' class='txt01'><span style='font-size:18px;'></span></td>
</tr>
<tr>
<td width='310' height='53' colspan='3' class='txtInfo04 paddingLeft18 paddingRight50'></td>
</tr>
<tr>
<td colspan='2' width='310' height='32' class=''></td>
<td width='164' height='32' class='txt01'></td>
</tr>
<tr>
<td width='295' height='32' class=''></td>
<td width='15' height='32' class='txt01'></td>
<td width='164' height='32' class='txt01'></td>
</tr>
<tr>
<td colspan='2' width='310' height='32' class=''></td>
<td width='164' height='32' class='txt01'></td>
</tr>
<tr>
<td width='' height='34' colspan='3' class=''></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width='474' border='0' cellpadding='0' cellspacing='0' align='right'>
<tr>
<td height='32' colspan='2'><span class='paddingLeft18 txtInfo02'>"+top_up_menu_txt_12+"
</span></td>
</tr>
<tr>
<td height='44' width='268' class='paddingLeft18'>"+top_up_menu_txt_13+"</td>
<td height='44' width='206'>
<table border='0' cellpadding='0' cellspacing='0'  width='206' height='44' class='inputBox'>
<tr>
<td width='22'></td>
<td id='pin1' width='39'></td>
<td id='pin2' width='39'></td>
<td id='pin3' width='39'></td>
<td id='pin4' width='39'></td>
<td width='28'></td>
</tr>
</table>
</td>
</tr>
<tr>
<td id='errorMsg' height='19' colspan='2' class='paddingLeft18 txtInvalid'></td>
</tr>
</table>
</td>
</tr>
<tr>
<td height='48' class='txtInfo02 paddingLeft18 paddingRight50'></td>
</tr>
</table>
</td>

<!-- footer -->
<tr>
<td colspan='2' width='640' height='35' background='../../images/footer_tc_"+ui_lang+".jpg'>
</td>
</tr>
</table>
";