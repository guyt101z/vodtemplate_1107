function selectPlanInit(){
	document.getElementById("body_content").innerHTML = selectPlan_body_content;
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
	status = "select_plan";
	next_status = "top_up_and_deduction";
	prev_status = "select_payment_method";
	loadPlan(option_offset);
}
function loadPlan(offset){
	var new_planlist_arr = new Array();
	var new_index = 0;
	for(var x=0; x < planlist_arr.length; x++){
		if(parseFloat(cur_cash_point)+parseFloat(planlist_arr[x].cashPoint)-cashpoint>=0){
			new_planlist_arr[new_index] = planlist_arr[x];
			new_index++;
		}
	}
	planlist_arr = new_planlist_arr;
	for(var m=1; m < 4; m++){
		if(offset+m < planlist_arr.length+1){
			document.getElementById("option"+m).innerHTML = "now DOLLAR "+purchase_txt_04+planlist_arr[offset+m-1].cashPoint;
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
		if(parseFloat(cur_cash_point)+parseFloat(planlist_arr[cur_option+option_offset-1].cashPoint)-cashpoint>=0){
			loadLayout(next_status);
		}
	}
	else if(keyCode == KEY_BACK){
		loadLayout(prev_status);
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
	else if(keyCode == KEY_GREEN){
		window.parent.location.href="class.jsp?referrer=purchase_ph2.jsp&status=select_plan&"+urlparam;
	}
	else if(keyCode == KEY_BLUE){
		window.parent.location.href="t_c.jsp?referrer=purchase_ph2.jsp&status=select_plan&"+urlparam;
	}
	else{
	}
}

var selectPlan_body_content = 
"
<table width='640' height='530' cellpadding='0' cellspacing='0' border='0'>
<!-- left table -->
<tr>
"
+
left_table
+
"

</td>
</tr>
<tr>
<td width='165' height='90' class='txtInfo01 paddingLeft10'>"+purchase_txt_01+"</td>
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
<td id='movieformattxt' width='' height='32' colspan='2' class=' txt03 paddingLeft18'></td>
</tr>
<tr>
<td id='title' width='' height='32' colspan='2' class='txt01 paddingLeft18'>Remember Me</td>
</tr>
<tr>
<td id='pricetab' width='310' height='32' class='txt02 paddingLeft18'>"+purchase_txt_06+"</td>
<td id='price' width='164' height='32' class='txt01'>$40</td>
</tr>
<tr>
<td width='310' height='32' class='txt02 paddingLeft18'>"+purchase_txt_07+"</td>
<td id='cash_point' width='164' height='32' class='txt01'></td>
</tr>
<tr>
<td width='310' height='54' colspan='2' class='txtInfo04 paddingLeft18 paddingRight50'>"+purchase_txt_08+"</td>
</tr>
<tr>
<td width='310' height='32' class='txt02 paddingLeft18'>"+purchase_txt_03+"</td>
<td id='cur_cash_point' width='164' height='32' class='txt01'></td>
</tr>
<tr>
<td width='' height='11' colspan='2' class=''></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width='474' border='0' cellpadding='0' cellspacing='0' align='right'>
<tr>
<td width='310' height='34' class='headerlonger01'>"+purchase_txt_13+"</td>
<td width='164' height='34' class='header02'></td>
</tr>
<tr>
<td id='option1' width='310' height='32' class='unselectlonger01'></td>
<td id='option11' width='164' height='32' class='unselect02'>$100</td>
</tr>
<tr>
<td id='option2' width='310' height='32' class='unselectlonger01'></td>
<td id='option12' width='164' height='32' class='select02'>$200</td>
</tr>
<tr>
<td id='option3' width='310' height='32' class='unselectlonger01'></td>
<td id='option13' width='164' height='32' class='unselect02'>$300</td>
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
<td height='48' class='txtInfo02 paddingLeft18 paddingRight50'>"+purchase_txt_12+"</td>
</tr>
</table>
</td>
</tr>
<!-- footer -->
<tr>
<!--td colspan='2' width='640' height='35' background='../../images/footer_class_tc_"+ui_lang+".jpg'-->
<td colspan='2' width='640' height='35' background='../../images/footer_class_tc_"+ui_lang+".jpg'>
</td>
</tr>
</table>
";