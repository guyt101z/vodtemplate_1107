function entryInit(){
	document.getElementById("body_content").innerHTML = entry_body_content;
	if (!isNaN(cur_cash_point)) {
		document.getElementById("cur_cash_point").innerHTML = top_up_menu_txt_04+cur_cash_point;
	}
	else {
		document.getElementById("cur_cash_point").innerHTML = cur_cash_point;
	}
	document.getElementById("expiry_date").innerHTML = expiry_date;
	iptvRegisterKeyHandler(entryKeyEvent);
	num_option = 2;
	cur_option = 1;
	hightlight_class = "selectTopUp01";
	unhightlight_class = "unselectTopUp01";
	hightlightOption(cur_option);
}
function doBack(){
	var lang;
	if(ui_lang == "e"){
		lang = "en_us";
	}
	else {
		lang = "zh_tw";
	}
	if(referrer == "detail.jsp"){
		window.parent.location.href = "/vod/moviehouse/"+ui_lang+"n/ppv/detail.jsp?lang="+lang+"&cat="+cat+"&productid="+productid;
	}
	else if(referrer == "MENU"){
		var style = iptvGetSystemNonVolatileData(SYSTEMDATA_UISTYLEID);
    				window.parent.location.href="http://vitvportal.netvigator.com/jsp/en/menu/menu.jsp?stbid="+iptvGetSTBID()+"_"+iptvGetSTBSessionID()+"&styleid="+style;
	}
	else if(referrer == "ONELINK"){
		window.parent.location.href = goBack;
	}
	else {
		//window.parent.location.href = "/vod/moviehouse/"+ui_lang+"n/ppv/index.jsp";
		window.parent.location.href = "/vod/moviehouse/"+ui_lang+"n/ppv/"+referrer+"?lang="+lang+"&cat="+cat+"&productid="+productid;
	}
}
function entryKeyEvent(keyCode) {
	if(keyCode == KEY_ENTER){
		if(cur_option == 1){
		loadLayout("select_plan");
		}
		else {
			//doBack();
			window.parent.location.href = "/vod/moviehouse/"+ui_lang+"n/ppv/index.jsp";
		}
	}
	else if(keyCode == KEY_BLUE){
			window.parent.location.href = "/vod/moviehouse/"+ui_lang+"n/ppv/t_c.jsp?"+urlParam;
	}
	else if(keyCode == KEY_BACK){
		doBack();
	}
	else if(keyCode == KEY_UP){
		doUp();
	}
	else if(keyCode == KEY_DOWN){
		doDown();
	}
	else{
	}
}
var entry_body_content = 
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
<td width='' height='32' colspan='2' class='txt01 paddingLeft18 acbalance'>"+top_up_menu_txt_02+"</td>
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
<tr>
<td width='' height='97' colspan='2' class=''></td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<table width='474' border='0' cellpadding='0' cellspacing='0' align='right'>
<tr>
<td colspan='2' height='1' bgcolor='#2e2640'></td>
</tr>
<tr>
<td id='option1' colspan='2' width='474' height='32' class='unselectTopUp01'>"+top_up_menu_txt_06+"</td>
</tr>
<tr>
<td id='option2' colspan='2' width='474' height='32' class='unselectTopUp01'>"+top_up_menu_txt_07+"</td>
</tr>
</table>
</td>
</tr>
<tr>
<td height='14'></td>
</tr>
<tr>
<td height='48' class='txtInfo02 paddingLeft18 paddingRight50'>"+top_up_menu_txt_08+"</td>
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