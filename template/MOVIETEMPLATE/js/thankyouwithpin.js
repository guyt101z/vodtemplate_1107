iptvRegisterKeyHandler(keyEvent);

var pinArray = new Array(4);
pinArray[0] = "";
pinArray[1] = "";
pinArray[2] = "";
pinArray[3] = "";
var pin_pos = 0;
var num_try = 0;

function load(){
	document.getElementById("logo").src="/vodtemplate/data/"+catId+"/"+logo_file;
	if (language == "zh_tw") {
		document.getElementById("thankyou_content").innerHTML = thankyou_content.replace(/<LIBRARY_NAME>/g,libname_chi);
	}
	else{
		document.getElementById("thankyou_content").innerHTML = thankyou_content.replace(/<LIBRARY_NAME>/g,libname_eng);
	}
}

function pinToggle(pos){
	document.getElementById("pin"+pos).src="images/"+styleId+"/star_01.png";
}
function clearPin(pos){
	document.getElementById("pin"+pos).src= null ;
}

function keyEvent(keyCode) {
	if(keyCode == KEY_ENTER) {
                if(pin_pos == 4){
                        var ppin = "" + pinArray[0] + pinArray[1] + pinArray[2] + pinArray[3];
                        if(iptvVerifyPIN(ppin)){
                                //ok no problem
                                window.parent.location.href="qapi/getsvod.jsp?verified=true&"+urlparam;
                                //parent.video.location.href="play-movie.jsp?"+parent.urlparam;
                        }
                        else{
                                if(pin_pos == 4){
                                        num_try++;
                                        pin_pos = 0;
                                        for (var i = 1;i<5;i++) {
                                                clearPin(i);
                                        }
                                        if (language == "zh_tw") {
						document.getElementById("errorMsg").innerHTML="±K½X¿ù»~¡A½Ð¦A¿é¤J¡C";
                                        } else {
                                                document.getElementById("errorMsg").innerHTML="Invalid PIN. Please try again.";
                                        }
                                        if(num_try == 3){
                                            //game over
                                            window.parent.location.href="error.jsp?respcode=wrongpassword&"+urlparam;
                                        }
                                }
                        }
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
        else if(keyCode == KEY_CLEAR) {
                if(pin_pos > 0){
                        clearPin(pin_pos);
                        pin_pos--;
                        pinArray[pin_pos] = null;
                }
        }
  	else if(keyCode == KEY_GREEN) {
        	window.parent.location.href="class.jsp?"+urlparam;
	}
	else if(keyCode == KEY_BLUE) {
        	window.parent.location.href="t_c.jsp?"+urlparam;
	}
	else if(keyCode == KEY_BACK) {
        	window.parent.location.href="detail.jsp?"+urlparam;
	}
}
