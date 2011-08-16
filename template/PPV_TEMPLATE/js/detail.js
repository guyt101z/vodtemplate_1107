iptvRegisterKeyHandler(keyEvent);
var type = "";
var price = "";
var cashpoint = "";
var expdayval = "";
var purchaseOther = "";
var warning = "";
var num_type = 0;
var globalSVODLock = iptvGetNonVolatileData("g_svl");
var restrictedSVODLock = iptvGetNonVolatileData("r_svl");
var urlPin = "pin.jsp?para=Para&";
var urlGetppv = "qapi/getppv.jsp?para=Para&";
var urlPurchase = "purchase_ph2.jsp?para=Para&";
var urlExpire = "/vod/moviehouse/en/ppv/expire.jsp?para=Para&";
var urlNoHd = "no_hd.jsp?para=Para&";
var urlError = "error.jsp?para=Para&";
var hdWarningMsg = "You have already purchased SD version of this program.<br>You can either purchase HD version of this program or watch the program in SD version.";
var sdWarningMsg = "You have already purchased HD version of this program.<br>You can either purchase SD version of this program or watch the program in HD version.";

function load() {
	if(HDpriceTxt != "null"){
		type = "HD";
		price = HDprice;
		cashpoint = HDcashpoint;
		expdayval = HDexpdayval;
		document.getElementById("type0").innerHTML = "HD";
		document.getElementById("typePrice0").innerHTML = HDpriceTxt;
		num_type++;
		if(SDpriceTxt != "null"){
			document.getElementById("type1").innerHTML = "SD";
			document.getElementById("typePrice1").innerHTML = SDpriceTxt;
			num_type++;
		}
		else{
			document.getElementById("type1").className = " ";
			document.getElementById("typePrice1").className = " ";
		}
	}
	else{
		if(SDpriceTxt != "null"){
			type = "SD";
			price = SDprice;
			cashpoint = SDcashpoint;
			expdayval = SDexpdayval;
			document.getElementById("type0").innerHTML = "SD";
			document.getElementById("typePrice0").innerHTML = SDpriceTxt;
			num_type++;
		}
		else{
			document.getElementById("type0").className = " ";
			document.getElementById("typePrice0").className = " ";
		}
		document.getElementById("type1").className = " ";
		document.getElementById("typePrice1").className = " ";
	}

	document.getElementById("title").innerHTML = digestString(p_title,27);
	document.getElementById("duration").innerHTML = p_duration+" mins";
	document.getElementById("language").innerHTML = p_language;
	document.getElementById("cast").innerHTML = p_cast;
	document.getElementById("synopsis").innerHTML = digestString(p_synopsis,135);
	document.getElementById("offAirDate").innerHTML = p_offair;
	document.getElementById("poster").src = "/vod/poster/sd/en/"+p_poster;
	if (!isNaN(cur_cash_point)) {
		document.getElementById("cur_cash_point").innerHTML = top_up_menu_txt_04+cur_cash_point;
	}
	else {
		document.getElementById("cur_cash_point").innerHTML = cur_cash_point;
	}
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
function select(pos){
	document.getElementById("type"+pos).className = "selectshorter01";
	document.getElementById("typePrice"+pos).className = "selectlonger02";
}
function unSelect(pos){
	document.getElementById("type"+pos).className = "unselectshorter01";
	document.getElementById("typePrice"+pos).className = "unselectlonger02";
}

function accessAlreadyPurchasedItem(){
	purchaseOther="false";
	if(l_is_locked == "true"){
		window.parent.location.href=urlPin+"movieformat="+type+"&purchaseother="+purchaseOther+"&price="+price+"&cashpoint="+cashpoint+"&"+urlparam;
	}
	else {
		if (globalSVODLock == "Y") {
			window.parent.location.href=urlPin+"movieformat="+type+"&purchaseother="+purchaseOther+"&price="+price+"&cashpoint="+cashpoint+"&"+urlparam;
		}
		else if (restrictedSVODLock != "N") {
			if(l_is_restricted == "true") {
				window.parent.location.href=urlPin+"movieformat="+type+"&purchaseother="+purchaseOther+"&price="+price+"&cashpoint="+cashpoint+"&"+urlparam;
			}
			else {
					window.parent.location.href=urlGetppv+"movieDuration="+movieDuration+"&expdayval="+expdayval+"&movieformat="+type+"&verified=false&playonly=true&price="+price+"&"+urlparam;
			}
		}
		else if (globalSVODLock == "N") {
				window.parent.location.href=urlGetppv+"movieDuration="+movieDuration+"&expdayval="+expdayval+"&movieformat="+type+"&verified=true&playonly=true&price="+price+"&"+urlparam;
		}
		else {
			window.parent.location.href=urlPin+"movieformat="+type+"&purchaseother="+purchaseOther+"&price="+price+"&cashpoint="+cashpoint+"&"+urlparam;
		}
	}
}
function purchaseAnotherFormat(){
	if(warning != "warned"){
		if(type == "HD"){
			document.getElementById("info").innerHTML = hdWarningMsg;
		}
		else{
			document.getElementById("info").innerHTML = sdWarningMsg;
		}
		warning = "warned";
	}
	else{
		purchaseOther="true";
		/*
		if(isPassedOffairdate(p_offair)=="true"){
			window.parent.location.href = urlExpire+urlparam;
		}
		*/
		//else{
			window.parent.location.href=urlPurchase+"movieformat="+type+"&purchaseother="+purchaseOther+"&price="+price+"&cashpoint="+cashpoint+"&"+urlparam;
		//}
	}
}
function brandNewPurchase(){
	purchaseOther="false";
	/*
	if(isPassedOffairdate(p_offair)=="true"){
		window.parent.location.href = urlExpire+urlparam;
	}
	*/
	//else{
		window.parent.location.href=urlPurchase+"movieformat="+type+"&purchaseother="+purchaseOther+"&price="+price+"&cashpoint="+cashpoint+"&"+urlparam;
	//}
}
function keyEvent(keyCode) {
	if(keyCode == KEY_ENTER){
		if (!canGetCashPoint){
			window.parent.location.href=urlError+urlparam;
		}
		else { 
			if(type == "HD" && "true" != ishdprofile){
				purchaseOther="false";
				window.parent.location.href=urlNoHd+"movieformat="+type+"&purchaseother="+purchaseOther+"&price="+price+"&cashpoint="+cashpoint+"&"+urlparam;
			}
			else{
				if(type == "HD") {
					if(HDpriceTxt.substring(0,1) != "P"){
						if(SDpriceTxt.substring(0,1) == "P"){ //sd version paid jor
							purchaseAnotherFormat();
						}
						else{
							brandNewPurchase();
						}
					}
					else{
						accessAlreadyPurchasedItem();
					}
				}
				else { // user select sd
					if(SDpriceTxt.substring(0,1) != "P"){
						if(HDpriceTxt.substring(0,1) == "P"){ //hd version paid jor
							purchaseAnotherFormat();
						}
						else {
							brandNewPurchase();
						}
					}
					else {
						accessAlreadyPurchasedItem();
					}
				}
			}
		}
	}
	else if(keyCode == KEY_BACK){
		if(backURL == null||backURL == ""||backURL == "null"){
			backURL = "grid_view.jsp";
		}
		//window.parent.location.href=backURL+"?"+urlparam;
		window.parent.location.href="grid_view.jsp?"+urlparam;
	}
	else if(keyCode == KEY_DOWN){
		if(num_type>1){
			unSelect(0);
			select(1);

			if(document.getElementById("type1").innerHTML == "HD"){
				type = "HD";
				price = HDprice;
				cashpoint = HDcashpoint;
				expdayval = HDexpdayval;
			}
			else if(document.getElementById("type1").innerHTML == "SD"){
				type = "SD";
				price = SDprice;
				cashpoint = SDcashpoint;
				expdayval = SDexpdayval;
			}
		}
	}
	else if(keyCode == KEY_UP){

		if(num_type>1){
			unSelect(1);
			select(0);

			if(document.getElementById("type0").innerHTML == "HD"){
				type = "HD";
				price = HDprice;
				cashpoint = HDcashpoint;
				expdayval = HDexpdayval;
			}
			else if(document.getElementById("type0").innerHTML == "SD"){
				type = "SD";
				price = SDprice;
				cashpoint = SDcashpoint;
				expdayval = SDexpdayval;
			}
		}
	}
	else if(keyCode == KEY_GREEN){
		window.parent.location.href="class.jsp?"+urlparam;
	}
	else if(keyCode == KEY_BLUE){
		window.parent.location.href="t_c.jsp?"+urlparam;
	}
	else if(keyCode == KEY_RED){
		window.parent.location.href="top_up_menu.jsp?"+urlparam;
	}
}
