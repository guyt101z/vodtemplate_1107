function spendCashPointInit(){
	document.getElementById("body_content").innerHTML = spendCashPoint_body_content;
	if (!isNaN(cur_cash_point)) {
		document.getElementById("remaining_cash_point").innerHTML = purchase_txt_04+(parseFloat(cur_cash_point)-cashpoint);
	}
	else {
		document.getElementById("remaining_cash_point").innerHTML = cur_cash_point;
	}
	iptvRegisterKeyHandler(pinKeyEvent);
	pinInit();
	status = "spend_cash_point";
	next_status = "thankyou";
	prev_status = "select_plan";
}

var spendCashPoint_body_content = 
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
<td id='movieformattxt' width='' height='32' colspan='3' class=' txt03 paddingLeft18'></td>
</tr>
<tr>
<td id='title' width='' height='32' colspan='3' class='txt01 paddingLeft18'>Remember Me</td>
</tr>
<tr>
<td id='pricetab' colspan='2' width='310' height='32' class='txt02 paddingLeft18'>"+purchase_txt_06+"</td>
<td id='price' width='164' height='32' class='txt01'>$40</td>
</tr>
<tr>
<td colspan='2' width='310' height='32' class='txt02 paddingLeft18'>"+purchase_txt_07+"</td>
<td id='cash_point' width='164' height='32' class='txt01'></td>
</tr>
<tr>
<td width='310' height='54' colspan='3' class='txtInfo04 paddingLeft18 paddingRight50'>"+purchase_txt_08+"</td>
</tr>
<tr style='background-image:url(../../images/time_remain_bar_top.png);'>
<td colspan='2' width='310' height='32' class='txt02 paddingLeft18'>"+purchase_txt_03+"</td>
<td id='cur_cash_point' width='164' height='32' class='txt01'></td>
</tr>
<tr style='background-image:url(../../images/time_remain_bar_bottom.png);'>
<td width='295' height='32' class='txt02 paddingLeft18'>"+purchase_txt_17+"</td>
<td width='15' height='32' class='txt01'>-</td>
<td id='cash_point_to_be_deducted' width='164' height='32' class='txt01'></td>
</tr>
<tr style='background-image:url(../../images/time_remain_bar_bottom.png);'>
<td colspan='2' width='310' height='32' class='txt02 paddingLeft18'>"+purchase_txt_18+"</td>
<td id='remaining_cash_point' width='164' height='32' class='txt01'></td>
</tr>
<tr>
<td width='' height='34' colspan='2' class=''></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width='474' border='0' cellpadding='0' cellspacing='0' align='right'>
<tr>
<td height='25' colspan='2'><span class='paddingLeft18 txtInfo02'>"+purchase_txt_14+"</span></td>
</tr>
<tr>
<td height='44' width='268' class='paddingLeft18'>"+purchase_txt_15+"</td>
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
":