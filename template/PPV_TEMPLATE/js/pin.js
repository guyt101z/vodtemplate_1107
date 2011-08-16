iptvRegisterKeyHandler(keyEvent);

var pinArray = new Array(4);
pinArray[0] = "";
pinArray[1] = "";
pinArray[2] = "";
pinArray[3] = "";
var pin_pos = 0;
var num_try = 0;

function load(){
	/*
	if(isPassedOffairdate(p_offair)=="true"){
		window.parent.location.href = "/vod/moviehouse/en/ppv/expire.jsp?"+urlparam;
	}
	*/
	//else{
	document.getElementById("title").innerHTML = p_title;
	document.getElementById("poster").src = "/vod/poster/sd/en/"+p_poster;
        if (p_support_type=="SD") {
                document.getElementById("hdpic").src = "../../images/spacer.gif";
                document.getElementById("sdpic").src = "../../images/SD.png";
        } else if (p_support_type=="HD") {
                document.getElementById("hdpic").src = "../../images/HD.png";
                document.getElementById("sdpic").src = "../../images/spacer.gif";
        } else if (p_support_type=="HSD") {
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
	//}
}
function pinToggle(pos){
	document.getElementById("pin").src="../../images/star_"+pos+".png";
}
function keyEvent(keyCode) {
	if(keyCode == KEY_ENTER) {
		if(pin_pos == 4){
		var ppin = "" + pinArray[0] + pinArray[1] + pinArray[2] + pinArray[3];
			if(iptvVerifyPIN(ppin)){
				//ok no problem
				window.parent.location.href="qapi/getppv.jsp?verified=true&playonly=true&price="+price+"&"+urlparam;
				//parent.video.location.href="play-movie.jsp?"+parent.urlparam;
			}
			else{
				if(pin_pos == 4){
					num_try++;
					pin_pos = 0;
					pinToggle(pin_pos);
					document.getElementById("errorMsg").innerHTML="Invalid PIN. Please try again.";
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
	else if(538 > keyCode && keyCode > 527) {
		if(4 > pin_pos){
			var in_num = keyCode-528;
			pinArray[pin_pos] = in_num;
			pin_pos++;
			pinToggle(pin_pos);
		}
  }
  else if(keyCode == KEY_GREEN){
          window.parent.location.href="class.jsp?referrer="+backURL+"&"+ urlparam;
  }
  else if(keyCode == KEY_BLUE){
          window.parent.location.href="t_c.jsp?referrer="+backURL+"&"+urlparam;
	}
	else if(keyCode == KEY_BACK){
		if(backURL == "myplaylist.jsp"){
			window.parent.location.href="myplaylist.jsp?"+urlparam;
		} else {
			window.parent.location.href="detail.jsp?"+urlparam;
		}
	}
}
