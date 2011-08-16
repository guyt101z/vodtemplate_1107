var globalSVODLock = iptvGetNonVolatileData("g_svl");
var restrictedSVODLock = iptvGetNonVolatileData("r_svl");
iptvRegisterKeyHandler(keyEvent);

function load(){
	document.getElementById("title").innerHTML = p_title;
	document.getElementById("poster").src = "/vod/poster/sd/en/"+p_poster;
	if(HDprice == "null"){
				HDprice = "N/A";
	}
	if(HDcashpoint == "null"){
				HDcashpoint = "N/A";
	}
	document.getElementById("price").innerHTML = "$"+HDprice;
	document.getElementById("nowdollar").innerHTML = "$"+HDcashpoint;
	if(HDprice == "N/A"){
		document.getElementById("price").innerHTML = " ";
		document.getElementById("pricetab").innerHTML = " ";
	}
	if(HDcashpoint == "N/A"){
		document.getElementById("nowdollar").innerHTML = " ";
		document.getElementById("nowdollartab").innerHTML = " ";
	}
	document.getElementById("currentnowdollar").innerHTML = "$"+cashpointbalance;
	
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
}

function keyEvent(keyCode) {
	if (keyCode == KEY_ENTER) {
		if(SDpriceTxt.substring(0,1) != "P"){
			window.parent.location.href="purchase_ph2.jsp?movieformat=SD&purchaseother=false&cashpoint="+SDcashpoint+"&price="+SDprice+"&"+urlparam;
		} else {
				if(l_is_locked == "true"){
					window.parent.location.href="pin.jsp?movieformat=SD&purchaseother=false&cashpoint="+SDcashpoint+"&price="+SDprice+"&"+urlparam;
				} else {
					if (globalSVODLock == "Y") {
						window.parent.location.href="pin.jsp?movieformat=SD&purchaseother=false&cashpoint="+SDcashpoint+"&price="+SDprice+"&"+urlparam;
					} else if (restrictedSVODLock != "N") {
						if(l_is_restricted == "true") {
							window.parent.location.href="pin.jsp?movieformat=SD&purchaseother=false&cashpoint="+SDcashpoint+"&price="+SDprice+"&"+urlparam;
						} else {
							window.parent.location.href="qapi/getppv.jsp?movieformat=SD&verified=false&playonly=true&cashpoint="+SDcashpoint+"&price="+SDprice+"&"+urlparam;
						}
					} else if (globalSVODLock == "N"){
						window.parent.location.href="qapi/getppv.jsp?movieformat=SD&verified=true&playonly=true&cashpoint="+SDcashpoint+"&price="+SDprice+"&"+urlparam;
					} else {
						window.parent.location.href="pin.jsp?movieformat=SD&purchaseother=false&cashpoint="+SDcashpoint+"&price="+SDprice+"&"+urlparam;
					}
				}
		}
	} else if(keyCode == KEY_BACK){
		window.parent.location.href="detail.jsp?referrer=grid_view.jsp&"+urlparam;
	} else if(keyCode == KEY_GREEN){
		window.parent.location.href="class.jsp?"+urlparam;
	} else if(keyCode == KEY_BLUE){
		window.parent.location.href="t_c.jsp?"+urlparam;
	}
}
