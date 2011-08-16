iptvRegisterKeyHandler(keyEvent);

var pinArray = new Array(4);
pinArray[0] = "";
pinArray[1] = "";
pinArray[2] = "";
pinArray[3] = "";
var pin_pos = 0;
var num_try = 0;
var seriesProductArrayKey = "";

function load() {
	document.getElementById("logo").src="/vodtemplate/data/"+catId+"/"+logo_file;
	if (seriesProductId != "" && seriesProductId != "null"){
		for (var i = 0; i < series_product_array.length ; i++){
			if (seriesProductId == series_product_array[i].id) {
				seriesProductArrayKey = i;
                                break;
                        }	
		}
	}
	if (series_product_array.length > 0){
                var current_selected_series_product = series_product_array[seriesProductArrayKey];
                duration = current_selected_series_product.duration;
                name_chi = current_selected_series_product.name_chi;
                name_eng = current_selected_series_product.name_eng;
                cast_chi = current_selected_series_product.cast_chi;
                cast_eng = current_selected_series_product.cast_eng;
                synopsis_chi = digestString(current_selected_series_product.synopsis_chi,135);
                synopsis_eng = digestString(current_selected_series_product.synopsis_eng,135);
                sd_image1_file = current_selected_series_product.sd_image1_file;
                is_sd = current_selected_series_product.is_sd;
                is_hd = current_selected_series_product.is_hd;
                language_eng = current_selected_series_product.language_eng;
                language_chi = current_selected_series_product.language_chi;
                classification = current_selected_series_product.classification;
        }
        if (language == "zh_tw"){
                document.getElementById("title").innerHTML = digestString(name_chi,27);
                if (duration == "" || duration == null) {
                        document.getElementById("duration").innerHTML = "--";
                } else {
                        document.getElementById("duration").innerHTML = duration+" 分鐘";
                }
                document.getElementById("language").innerHTML = language_chi;
                document.getElementById("cast").innerHTML = cast_chi;
                document.getElementById("synopsis").innerHTML = digestString(synopsis_chi,220)
                document.getElementById("poster").src = "/vod/poster/sd/cn/"+sd_image1_file;
                document.getElementById("disclaimer").innerHTML = disclaimer_chi;
        }
        else {
                document.getElementById("title").innerHTML = digestString(name_eng,27);
                if (duration == "" || duration == null) {
                        document.getElementById("duration").innerHTML = "--";
                } else {
                        document.getElementById("duration").innerHTML = duration+" mins";
                }
                document.getElementById("language").innerHTML = language_eng;
                document.getElementById("cast").innerHTML = cast_eng;
                document.getElementById("synopsis").innerHTML = digestString(synopsis_eng,150);
                document.getElementById("poster").src = "/vod/poster/sd/en/"+sd_image1_file;
                document.getElementById("disclaimer").innerHTML = disclaimer_eng;
        }
        if (is_sd && !is_hd) {
                document.getElementById("hdpic").src = "images/spacer.gif";
                document.getElementById("sdpic").src = "images/"+styleId+"/SD.png";
        } else if (!is_sd && is_hd) {
                document.getElementById("hdpic").src = "images/"+styleId+"/HD.png";
                document.getElementById("sdpic").src = "images/spacer.gif";
        } else if (is_sd && is_hd) {
                document.getElementById("hdpic").src = "images/"+styleId+"/HD.png";
                document.getElementById("sdpic").src = "images/"+styleId+"/SD.png";
        }
        if (classification != null && classification != ""){
                document.getElementById("classification").innerHTML = classification;
                //document.getElementById("classTable").style.background = "images/"+styleId+"/classicification_"+classification+".png";
                document.getElementById("classTable").style.background = "images/"+styleId+"/classicification.png";
        } else {
                document.getElementById("classification").innerHTML = "";
                document.getElementById("classTable").style.background = "images/spacer.gif";
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
						document.getElementById("errorMsg").innerHTML="密碼錯誤，請再輸入。";
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
  		window.parent.location.href="class.jsp?referrer="+backURL+"&"+ urlparam;
	}
	else if(keyCode == KEY_BLUE) {
  		window.parent.location.href="t_c.jsp?referrer="+backURL+"&"+urlparam;
	}
	else if(keyCode == KEY_BACK) {
		window.parent.location.href="detail.jsp?"+urlparam;
	}
}
