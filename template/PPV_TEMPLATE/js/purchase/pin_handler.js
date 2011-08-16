var pinArray = new Array(4);
pinArray[0] = "";
pinArray[1] = "";
pinArray[2] = "";
pinArray[3] = "";
var pin_pos = 0;
var num_try = 0;

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

function pinInit(){
	for(var p=0; p < 4; p++){
		pinArray[p] = "";
	}
	pin_pos = 0;
	num_try = 0;
}

function pinKeyEvent(keyCode) {
	if(keyCode == KEY_ENTER){
		if(pin_pos == 4){
			var ppin = "" + pinArray[0] + pinArray[1] + pinArray[2] + pinArray[3];
			if(iptvVerifyPIN(ppin)){
				//ok no problem
				//loadLayout(next_status);
				//parent.video.location.href="play-movie.jsp?"+parent.urlparam;
				if(status == "spend_cash_point"){
					window.parent.location.href="qapi/getppv.jsp?verified=true&playonly=false&purchasetype=PREPAID&cashpointbalance="+cur_cash_point+"&price="+cashpoint+"&"+urlparam;
				}
				else if(status == "spend_money"){
					window.parent.location.href="qapi/getppv.jsp?verified=true&playonly=false&purchasetype=POSTPAID&cashpointbalance=null&price="+price+"&"+urlparam;
				}
				else if(status == "top_up_and_deduction"){
					window.parent.location.href="qapi/getppv.jsp?dotopup=true&balance="+cur_cash_point+"&topupoffercode="+planlist_arr[cur_option+option_offset-1].offerCode+"&verified=true&playonly=false&purchasetype=PREPAID&cashpointbalance="+cur_cash_point+"&price="+cashpoint+"&"+urlparam;
				}
				else{
				}
			}
			else{
				if(pin_pos == 4){
					num_try++;
					pin_pos = 0;
					pinToggle(pin_pos);
					document.getElementById("errorMsg").innerHTML=purchase_txt_19;
					if(num_try == 3){
						//game over
						window.parent.location.href="error.jsp?respcode=wrongpassword&price="+price+"&"+urlparam;
						//document.getElementById("errorMsg").innerHTML="Game over man, game over!";
					}
				}
			}
		}
	}
	else if(keyCode == KEY_CLEAR) {
		if(pin_pos > 0){
			pinArray[pin_pos] = -1;
			pin_pos--;
			pinToggle(pin_pos);
		}
	}
	else if(keyCode == KEY_BACK){
		if(status == "spend_cash_point"||cashpoint == -1){
			window.parent.location.href="detail.jsp?referrer=grid_view.jsp&"+urlparam;
		}
		else {
			loadLayout(prev_status);
		}
	}
	else if(538 > keyCode && keyCode > 527) {
		if(4 > pin_pos){
			var in_num = keyCode-528;
			pinArray[pin_pos] = in_num;
			pin_pos++;
			pinToggle(pin_pos);
		}
  }
	else if(keyCode == KEY_GREEN){
		if(status == "top_up_and_deduction"){
			window.parent.location.href="class.jsp?referrer=purchase_ph2.jsp&cur_option="+cur_option+"&option_offset="+option_offset+"&status=top_up_and_deduction&"+urlparam;
			//window.parent.location.href="class.jsp?referrer=purchase_ph2.jsp&"+urlparam;
		}
		else{
			window.parent.location.href="class.jsp?referrer=purchase_ph2.jsp&"+urlparam;
		}
	}
	else if(keyCode == KEY_BLUE){
		if(status == "top_up_and_deduction"){
			window.parent.location.href="t_c.jsp?referrer=purchase_ph2.jsp&cur_option="+cur_option+"&option_offset="+option_offset+"&status=top_up_and_deduction&"+urlparam;
			//window.parent.location.href="t_c.jsp?referrer=purchase_ph2.jsp&"+urlparam;
		}
		else{
			window.parent.location.href="t_c.jsp?referrer=purchase_ph2.jsp&"+urlparam;
		}
	}
	else{
	}
}


