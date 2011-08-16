iptvRegisterKeyHandler(keyEvent);

var pinArray = new Array(4);
pinArray[0] = "";
pinArray[1] = "";
pinArray[2] = "";
pinArray[3] = "";
var pin_pos = 0;
var num_try = 0;
var bar_pos = 0;
var offset = 0;
var max_planlist_show=3;
function load() {
	document.getElementById("logo").src="/vodtemplate/data/"+catId+"/"+logo_file;
	if (language == "zh_tw") {	
		document.getElementById("disclaimer").innerHTML = bottom_disclaimer.replace(/<LIBRARY_NAME>/g,libname_chi);
		document.getElementById("planlist_disclaimer").innerHTML = planlist_disclaimer.replace(/<LIBRARY_NAME>/g,libname_chi);
	}
	else {
		document.getElementById("disclaimer").innerHTML = bottom_disclaimer.replace(/<LIBRARY_NAME>/g,libname_eng);
		document.getElementById("planlist_disclaimer").innerHTML = planlist_disclaimer.replace(/<LIBRARY_NAME>/g,libname_eng);
	}
	for(var k=0; k < PlanArray.length; k++){
		document.getElementById("plan"+k).innerHTML=PlanArray[k].desc;
		document.getElementById("price"+k).innerHTML=PlanArray[k].price;
		turnOffBar(k);
	}
	turnOnBar(bar_pos);
}

function generatePlanList(){
	for(var k=0; k < max_planlist_show; k++){
		if (PlanArray[k+offset] != null) {
	                document.getElementById("plan"+k).innerHTML=PlanArray[k+offset].desc;
        	        document.getElementById("price"+k).innerHTML=PlanArray[k+offset].price;
			document.getElementById("bar"+k).className="unselectPlaylist";
			document.getElementById("radio"+k).src="images/"+styleId+"/radio_btn_off.png";
			document.getElementById("arrow"+k).src=null;
			
		} else {
	                document.getElementById("plan"+k).innerHTML="";
        	        document.getElementById("price"+k).innerHTML="";
			document.getElementById("bar"+k).className="unselectPlaylist";
			document.getElementById("radio"+k).src=null;
			document.getElementById("arrow"+k).src=null;
		}
        }
}
function turnOnBar(pos) {
	document.getElementById("bar"+pos).className="selectPlaylist";
	document.getElementById("arrow"+pos).src="images/"+styleId+"/list_arrow_37.png";
	document.getElementById("radio"+pos).src="images/"+styleId+"/radio_btn_on.png";
}
function turnOffBar(pos) {
	document.getElementById("bar"+pos).className="unselectPlaylist";
	document.getElementById("arrow"+pos).src=null;
	document.getElementById("radio"+pos).src="images/"+styleId+"/radio_btn_off.png";
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
                                window.parent.location.href="qapi/subscribeplan.jsp?plancode="+PlanArray[bar_pos+offset].code+"&campaign="+PlanArray[bar_pos+offset].campaign+"&"+urlparam;
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
	else if(keyCode == KEY_BACK) {
		window.parent.location.href="match_list.jsp?"+urlparam;
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

	else if(keyCode == KEY_DOWN) {
		if (bar_pos+offset+1 < PlanArray.length) {
			if(bar_pos < max_planlist_show-1){
				turnOffBar(bar_pos);
				bar_pos++;
				turnOnBar(bar_pos);
			} else {
				turnOffBar(bar_pos);
				offset += max_planlist_show;	
				bar_pos = 0;
				generatePlanList();
				turnOnBar(bar_pos);
			}
		}
	}
	else if(keyCode == KEY_UP) {
		if (bar_pos > 0){
			turnOffBar(bar_pos);
			bar_pos--;
			turnOnBar(bar_pos);
		} else if (bar_pos + offset > 0){
			offset -= max_planlist_show;
			generatePlanList();
			turnOffBar(bar_pos);
			bar_pos = max_planlist_show-1;
			turnOnBar(bar_pos);
		}
  }
  else if(keyCode == KEY_GREEN) {
  	window.parent.location.href="class.jsp?scheduleid="+p_scheduleid+"&"+"referrer="+backURL+"&"+urlparam;
  } 
  else if(keyCode == KEY_BLUE) {
  	window.parent.location.href="class.jsp?scheduleid="+p_scheduleid+"&"+"referrer="+backURL+"&"+urlparam;
	}
}

