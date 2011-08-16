function selectPaymentMethodInit(){
	document.getElementById("body_content").innerHTML = selectPaymentMethod_body_content;

	iptvRegisterKeyHandler(selectPaymentMethodKeyEvent);
	num_option = 2;
	cur_option = 1;
	hightlight_class = "selectTopUp01";
	unhightlight_class = "unselectTopUp01";
	hightlightOption(cur_option);
	status = "select_payment_method";
	next_status = "spend_money";
	prev_status = "select_payment_method";
	
	if(price == "N/A"){
		document.getElementById("optionTable").innerHTML = optionTable;
		document.getElementById("not_enough_error_msg").innerHTML = purchase_txt_20;
		num_option = 1;
	}
}

function selectPaymentMethodKeyEvent(keyCode) {
	if(keyCode == KEY_ENTER){
		if(cur_option == 1){
			loadLayout("select_plan");
		}
		else{
			loadLayout("spend_money");
		}
	}
	else if(keyCode == KEY_BACK){
		window.parent.location.href="detail.jsp?referrer=grid_view.jsp&"+urlparam;
	}
	else if(keyCode == KEY_UP){
		doUp();
	}
	else if(keyCode == KEY_DOWN){
		doDown();
	}
	else if(keyCode == KEY_GREEN){
		window.parent.location.href="class.jsp?referrer=purchase_ph2.jsp&"+urlparam;
	}
	else if(keyCode == KEY_BLUE){
		window.parent.location.href="t_c.jsp?referrer=purchase_ph2.jsp&"+urlparam;
	}
	else{
	}
}

var optionTable = 
"
<tr>
<td colspan='2' height='1' bgcolor='#2e2640'></td>
</tr>
<tr>
<td id='option1' colspan='2' width='474' height='32' class='selectTopUp01'>"+purchase_txt_10+"</td>
</tr>
<tr>
<td id='no_option2' colspan='2' width='474' height='32'></td>
</tr>
";

var selectPaymentMethod_body_content = 
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
<td width='' height='17' colspan='2' class=''></td>
</tr>
<tr>
<td width='' id='not_enough_error_msg' height='91' colspan='2' class='txtInvalid paddingLeft18 paddingRight50'>"+purchase_txt_09+"</td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table id='optionTable' width='474' border='0' cellpadding='0' cellspacing='0' align='right'>
<tr>
<td colspan='2' height='1' bgcolor='#2e2640'></td>
</tr>
<tr>
<td id='option1' colspan='2' width='474' height='32' class='selectTopUp01'>"+purchase_txt_10+"</td>
</tr>
<tr>
<td id='option2' colspan='2' width='474' height='32' class='unselectTopUp01'>"+purchase_txt_11+"</td>
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