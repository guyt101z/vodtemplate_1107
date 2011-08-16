iptvRegisterKeyHandler(keyEvent);

var pinArray = new Array(4);
pinArray[0] = "";
pinArray[1] = "";
pinArray[2] = "";
pinArray[3] = "";
var pin_pos = 0;
var num_try = 0;

function pinToggle(pos){
	document.getElementById("pin").src="../../images/star_"+pos+".png";
}
function keyEvent(keyCode) {
	if(keyCode == KEY_ENTER) {
		var ppin = "" + pinArray[0] + pinArray[1] + pinArray[2] + pinArray[3];
		if(iptvVerifyPIN(ppin)){
			//purchase pin correct
			//do purchase
			//verified=true because it is not going to check parental lock AGAIN after purchasing lock
			window.parent.location.href="qapi/getppv.jsp?verified=true&playonly=false&price="+price+"&"+urlparam;
			//and check if there is parent lock
			//window.parent.location.href="thankyou.jsp?movieformat=HD&price="+price[1]+"&"+urlParam;
		}
		else{
			document.getElementById("errorMsg").innerHTML="Invalid PIN. Please try again.";
			if(num_try == 3){
				//game over
				window.parent.location.href="error.jsp?respcode=wrongpassword&price="+price+"&"+urlparam;
			}
			else{
				if(pin_pos == 4){
					num_try++;
					pin_pos = 0;
					pinToggle(pin_pos);
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
	else if(538 > keyCode && keyCode > 527) {
		if(4 > pin_pos){
			var in_num = keyCode-528;
			pinArray[pin_pos] = in_num;
			pin_pos++;
			pinToggle(pin_pos);
		}
	}
	else if(keyCode == KEY_GREEN){
		window.parent.location.href="class.jsp?"+ urlparam;
	}
	else if(keyCode == KEY_BLUE){
		window.parent.location.href="t_c.jsp?"+urlparam;
	}
	else if(keyCode == KEY_BACK){
		window.parent.location.href="detail.jsp?referrer=grid_view.jsp&"+urlparam;
	}
}

function load() {
	document.getElementById("title").innerHTML = digestString(p_title,27);
	document.getElementById("price").innerHTML = "$"+ price;

	if(movieformat=="HD"){
		document.getElementById("movieformattxt").innerHTML = "You have selected to buy HD version of";
	}
	else{
		document.getElementById("movieformattxt").innerHTML = "You have selected to buy SD version of";
	}
	document.getElementById("poster").src = "/vod/poster/sd/en/"+p_poster;

	if (p_support_type=="SD") {
		document.getElementById("hdpic").src = "../../images/spacer.gif";
		document.getElementById("sdpic").src = "../../images/SD.png";
	}
	else if (p_support_type=="HD") {
		document.getElementById("hdpic").src = "../../images/HD.png";
		document.getElementById("sdpic").src = "../../images/spacer.gif";
	}
	else if (p_support_type=="HSD") {
		document.getElementById("hdpic").src = "../../images/HD.png";
		document.getElementById("sdpic").src = "../../images/SD.png";
	}

	if(p_classification != null){
		document.getElementById("classification").innerHTML = p_classification;
		document.getElementById("classTable").style.background = "../../images/classicification.png";
	}
	else{
		document.getElementById("classification").innerHTML = "";
		document.getElementById("classTable").style.background = "../../images/spacer.gif";
	}
}
