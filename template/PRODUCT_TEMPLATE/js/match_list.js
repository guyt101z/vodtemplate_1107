iptvDisableDefaultKeyHandling(KEY_UP);
iptvDisableDefaultKeyHandling(KEY_DOWN);
iptvDisableDefaultKeyHandling(KEY_LEFT);
iptvDisableDefaultKeyHandling(KEY_RIGHT);

var pin_array;
var pin_pos;
var num_of_try;
var stbid = iptvGetSTBID();
var stbsid = iptvGetSTBSessionID();


function keyEvent(keycode)
{
	if(keycode == KEY_UP)
	{
		if(pin_bar == "false"){
			document.getElementById("row_"+bar_pos).style.background="url('')";
			if(bar_pos > 1){
				bar_pos -= 1;
			}
			else if(bar_pos == 1 && window_shift > 0){
				window_shift--;
				refresh_window(window_shift);
			}
			else{
				bar_pos = 10;
				window_shift = product_array_digested.length - 10;
				refresh_window(window_shift);
			}
			document.getElementById("row_"+bar_pos).style.background="url('images/"+styleId+"/highlight.gif')";
			window.parent.document.images["poster"].src = product_array_digested[window_shift+bar_pos-1].sd_image1_file;
		}
	}
	else if(keycode == KEY_DOWN)
	{
		if(pin_bar == "false"){
			document.getElementById("row_"+bar_pos).style.background="url('')";
			if(bar_pos < 10 && bar_pos + window_shift < product_array_digested.length){
				 bar_pos += 1;
			}
			else if(bar_pos == 10 && bar_pos + window_shift < product_array_digested.length){
				window_shift++;
				refresh_window(window_shift);
			}
			else{
				bar_pos = 1;
				window_shift = 0;
				refresh_window(window_shift);
			}
			document.getElementById("row_"+bar_pos).style.background="url('images/"+styleId+"/highlight.gif')";
			window.parent.document.images["poster"].src = product_array_digested[window_shift+bar_pos-1].sd_image1_file;
		}
	}
	else if(keycode == KEY_ENTER)
	{
		if(product_array_digested[window_shift+bar_pos-1].is_onair){
			if(pin_bar == "false"){
				window.parent.location.href="match_list.jsp?pressed_enter=true&productid="+product_array_digested[window_shift+bar_pos-1].id+"&scheduleid="+product_array_digested[window_shift+bar_pos-1].schedule_id+"&"+urlparam;
				/*
				document.getElementById("bottom_bar").style.background="url('images/"+styleId+"/"+language+"/enter_pin_password_bg.gif')";
				for(var i=1; i <= 4;i++){
					document.getElementById("pin_"+i).innerHTML="<img src='images/"+styleId+"/img-off.gif' width='36' height='42' border='0' alt=''>";
				}
				pin_bar = "true";
				*/
			}
			else{
				if(pin_pos==5){
					var pin_entered = "" + pin_array[0] + pin_array[1] + pin_array[2] + pin_array[3];
					var updateResult= iptvVerifyPIN(pin_entered);
					if (!updateResult){
						num_of_try++;
						pin_pos = 1;
						for(var k=1; k <= 4;k++){
							document.getElementById("pin_"+k).innerHTML="<img src='images/"+styleId+"/img-off.gif' width='36' height='42' border='0' alt=''>";
							pin_array[k-1] = "";
						}
						document.getElementById("bottom_bar").style.background="url('images/"+styleId+"/"+language+"/error_pin_password_bg.gif')";
						if(num_of_try == 3){
							 //go to error page
							 window.parent.location.href="error.jsp?respcode=wrongpassword&"+urlparam;
						}
					}
					else{
						//go to check subscription
						//window.parent.location.href="check_subscription.jsp?productid="+product_array_digested[window_shift+bar_pos-1].id+"&scheduleid="+product_array_digested[window_shift+bar_pos-1].schedule_id+"&"+urlparam;
						//window.parent.location.href="match_list.jsp?pressed_enter=true&productid="+product_array_digested[window_shift+bar_pos-1].id+"&scheduleid="+product_array_digested[window_shift+bar_pos-1].schedule_id+"&"+urlparam;
						window.parent.location.href="qapi/getsvod.jsp?productid="+product_array_digested[window_shift+bar_pos-1].id+"&scheduleid="+product_array_digested[window_shift+bar_pos-1].schedule_id+"&verified=true&playonly=true&"+urlparam;
					}
				}
			}
		}
	}
	else if(keycode >= KEY_0 && keycode <= KEY_9 ) {	
		if(pin_bar == "true"){
			if(pin_pos<=4){
				document.getElementById("pin_"+pin_pos).innerHTML="<img src='images/"+styleId+"/img-on.gif' width='36' height='42' border='0' alt=''>";
				pin_array[pin_pos-1] = keycode-KEY_0;
				pin_pos++;
			}
		}
	}
	else if(keycode == KEY_CLEAR)
	{
		if(pin_bar == "true"){
			if(pin_pos>1){
				clear_pos = pin_pos-1;
				document.getElementById("pin_"+clear_pos).innerHTML="<img src='images/"+styleId+"/img-off.gif' width='36' height='42' border='0' alt=''>";
				pin_array[clear_pos-1] = "";
				pin_pos--;
			}
		}
	}
	else if(keycode == KEY_YELLOW)
	{
		if(pin_bar == "false") window.parent.location.href="http://visvod.netvigator.com/jsp/en/now-select/select_svod.html?stbid="+stbid+"_"+stbsid;
	}
	else if(keycode == KEY_EXIT)
	{
	}
	else if(keycode == KEY_BACK)
	{
		if(pin_bar == "true"){
			for(var t=1; t <= 4;t++){
				document.getElementById("pin_"+t).innerHTML="<img src='' width='36' height='42' border='0' alt=''>";
				pin_array[t-1] = "";
			}
			num_of_try = 0;
			document.getElementById("bottom_bar").style.background="url('')";
			pin_bar = "false";
		}
		else{
			if (language == "zh_tw") {
				window.parent.location.href="http://visvod.netvigator.com/jsp/cn/svod/sd_landing.jsp?stbid="+stbid;
			}
			else {
				window.parent.location.href="http://visvod.netvigator.com/jsp/en/svod/sd_landing.jsp?stbid="+stbid;
			}
		}
	}
}

function init()
{ 
	if(pin_bar == "true"){
		document.getElementById("bottom_bar").style.background="url('images/"+styleId+"/"+language+"/enter_pin_password_bg.gif')";
		for(var i=1; i <= 4;i++){
			document.getElementById("pin_"+i).innerHTML="<img src='images/"+styleId+"/img-off.gif' width='36' height='42' border='0' alt=''>";
		}
	}
	else{
	}
	pin_array = new Array(4);
	pin_pos = 1;
	num_of_try = 0;
	refresh_window(window_shift);
	iptvRegisterKeyHandler(keyEvent);
	document.getElementById("row_"+bar_pos).style.background="url('images/"+styleId+"/highlight.gif')";
	window.parent.document.images["poster"].src = product_array_digested[window_shift+bar_pos-1].sd_image1_file;
}

function unload() {
	iptvEnableAllDefaultKeyHandlings();
}

function refresh_window(shift_pos)
{
	var product_name = "";
	for(var x=1; x <= product_array_digested.length && x <= 10; x++){
		//iptvAlert(product_array_digested[x-1].is_onair.toString());
		if(language == "en_us") product_name = digestString(product_array_digested[shift_pos+x-1].name_eng,50);
		else product_name = digestString(product_array_digested[shift_pos+x-1].name_chi,50);
			//iptvAlert("onair?"+product_array_digested[shift_pos+x-1].is_onair.valueOf());
		if(product_array_digested[shift_pos+x-1].is_onair){
			document.getElementById("row_"+x).innerHTML="<td width=539 height=32 align='left' valign='middle'><font id='color_1' color='#000000'>&nbsp;&nbsp;&nbsp;&nbsp;"+product_name+"</font></td>";	
		}
		else{
			document.getElementById("row_"+x).innerHTML="<td width=539 height=32 align='left' valign='middle'><font id='color_1' color='#888888'>&nbsp;&nbsp;&nbsp;&nbsp;"+product_name+"</font></td>";	
		}
	}
}
