function planInit(){
	document.getElementById("body_content").innerHTML = selectPlan_body_content;
	if (!isNaN(cur_cash_point)) {
		document.getElementById("cur_cash_point").innerHTML = top_up_menu_txt_04+cur_cash_point;
	}
	else {
		document.getElementById("cur_cash_point").innerHTML = cur_cash_point;
	}
	document.getElementById("expiry_date").innerHTML = expiry_date;
	document.getElementById("morePlanDown").className = "paddingLeft3"; //dummy class
	iptvRegisterKeyHandler(planKeyEvent);
	if(planlist_arr.length <= 3){
		num_option = planlist_arr.length;
	}
	else{
		num_option = 3;
		if(planlist_arr.length > 3){
			document.getElementById("morePlanDown").className = "morePlanDown";
		}
	}
	cur_option = 1;
	option_offset = 0;
	hightlight_class = "selectlonger01";
	unhightlight_class = "unselectlonger01";
	hightlight_class1 = "select02";
	unhightlight_class1 = "unselect02";
	hightlightOption(cur_option);
	loadPlan(option_offset);
}
function loadPlan(offset){
	for(var m=1; m < 4; m++){
		if(offset+m < planlist_arr.length+1){
			document.getElementById("option"+m).innerHTML = "now DOLLAR "+top_up_menu_txt_04+planlist_arr[offset+m-1].cashPoint;
			document.getElementById("option1"+m).innerHTML = "$"+planlist_arr[offset+m-1].price;
		}
		else {
			document.getElementById("option"+m).innerHTML = "";
			document.getElementById("option1"+m).innerHTML = "";
		}
	}
}
function planKeyEvent(keyCode) {
	if(keyCode == KEY_ENTER){
		loadLayout("pin");
	}
	else if(keyCode == KEY_BACK){
		loadLayout("entry");
	}
	else if(keyCode == KEY_BLUE){
			window.parent.location.href = "/vod/moviehouse/"+ui_lang+"n/ppv/t_c.jsp?"+urlParam;
	}
	else if(keyCode == KEY_UP){
		if(cur_option > 1){
			doUp();
		}
		else{
			if(option_offset > 0){
				option_offset = option_offset - 3;
				loadPlan(option_offset);
				cur_option = 3;
				hightlightOption(cur_option);
				if(option_offset + 3 < planlist_arr.length){
					document.getElementById("morePlanDown").className = "morePlanDown";
				}
			}
		}
	}
	else if(keyCode == KEY_DOWN){
		if(cur_option < num_option){
			if(option_offset + cur_option < planlist_arr.length){
				doDown();
			}
		}
		else{
			if(option_offset + 3 < planlist_arr.length){
				option_offset = option_offset + 3;
				loadPlan(option_offset);
				cur_option = 1;
				hightlightOption(cur_option);
				if(option_offset + 3 >= planlist_arr.length){
					document.getElementById("morePlanDown").className = "paddingLeft3"; //dummy class
				}
			}
		}
	}
	else{
	}
}
var selectPlan_body_content = 
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
<td width='173' class='paddingLeft25'></td>
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
<td width='165' height='90' class='txtInfo01 paddingLeft10'>"+top_up_menu_txt_01+"</td>
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
<td height='4' colspan='2'></td>
</tr>
<tr>
<td width='' height='32' colspan='2' class='txt01 paddingLeft18'>"+top_up_menu_txt_02+"</td>
</tr>
<tr>
<td width='310' height='32' class='txt02 paddingLeft18'>"+top_up_menu_txt_03+"</td>
<td id='cur_cash_point' width='164' height='32' class='txt01'></td>
</tr>
<tr>
<td width='310' height='32' class='txt02 paddingLeft18'>"+top_up_menu_txt_05+"</td>
<td id='expiry_date' width='164' height='32' class='txt01'></td>
</tr>
<tr>
<td width='' height='32' colspan='2' class=''></td>
</tr>
<tr>
<td width='310' height='54' colspan='2' class=''></td>
</tr>
<tr>
<td width='310' height='32' class=''></td>
<td width='164' height='32' class=''></td>
</tr>
<tr>
<td width='' height='17' colspan='2' class=''></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width='474' border='0' cellpadding='0' cellspacing='0' align='right'>
<tr>
<td width='310' height='34' class='headerlonger01'>"+top_up_menu_txt_09+"</td>
<td width='164' height='34' class='header02'></td>
</tr>
<tr>
<td id='option1' width='310' height='32' class='unselectlonger01'></td>
<td id='option11' width='164' height='32' class='unselect02'></td>
</tr>
<tr>
<td id='option2' width='310' height='32' class='unselectlonger01'></td>
<td id='option12' width='164' height='32' class='unselect02'></td>
</tr>
<tr>
<td id='option3' width='310' height='32' class='unselectlonger01'></td>
<td id='option13' width='164' height='32' class='unselect02'></td>
</tr> 
<tr id='morePlanDown' class='morePlanDown'>
    <td colspan='2' width='' height='32' class=''></td>
</tr>
</table>
</td>
</tr>
<tr>
<td height='14'></td>
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
"