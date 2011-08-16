var status = "select_payment_method";
var next_status = "select_payment_method";
var prev_status = "select_payment_method";
var num_option = 0;
var hightlight_class = "";
var unhightlight_class = "";
var hightlight_class1 = "";
var unhightlight_class1 = "";
var cur_option = 0;
var option_offset = 0;

function doUp(){
		if(cur_option > 1){
			cur_option--;
			hightlightOption(cur_option);
		}
}

function doDown(){
		if(cur_option < num_option){
			cur_option++;
			hightlightOption(cur_option);
		}
}

function hightlightOption(in_option){
	for(var m=1; m < num_option+1; m++){
		if(in_option == m){
			document.getElementById("option"+m).className = hightlight_class;
			document.getElementById("option1"+m).className = hightlight_class1;
		}
		else{
			document.getElementById("option"+m).className = unhightlight_class;
			document.getElementById("option1"+m).className = unhightlight_class1;
		}
	}
}

function loadLayoutValue(){
	if (!isNaN(cur_cash_point)) {
		document.getElementById("cur_cash_point").innerHTML = purchase_txt_04+cur_cash_point;
	}
	else {
		document.getElementById("cur_cash_point").innerHTML = cur_cash_point;
	}
	document.getElementById("cash_point").innerHTML = purchase_txt_04+cashpoint;
	document.getElementById("cash_point_to_be_deducted").innerHTML = purchase_txt_04+cashpoint;
	document.getElementById("selected_plan").innerHTML = purchase_txt_04+planlist_arr[cur_option+option_offset-1].cashPoint;
	document.getElementById("title").innerHTML = digestString(p_title,27);
	if(price == "N/A"){
		document.getElementById("pricetab").innerHTML = " ";
		document.getElementById("price").innerHTML = " ";
	}else{
		document.getElementById("pricetab").innerHTML = purchase_txt_06;
		document.getElementById("price").innerHTML = "$"+ price;
	}
	document.getElementById("selected_plan").innerHTML = purchase_txt_04+planlist_arr[cur_option+option_offset-1].cashPoint;

	if(movieformat=="HD"){
		document.getElementById("movieformattxt").innerHTML = purchase_txt_02;
	}
	else{
		document.getElementById("movieformattxt").innerHTML = purchase_txt_05;
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

function load() {
	if(init_stat=="select_plan"){
		loadLayout("select_plan");
	}
	else if(init_stat=="top_up_and_deduction"){
		cur_option = init_cur_option;
		option_offset = init_option_offset;
		loadLayout("top_up_and_deduction");
	}
	else{
		if(cashpoint == -1){
			loadLayout("spend_money");
		}
		else{
			if(cur_cash_point < cashpoint){
				loadLayout("select_payment_method");
			}
			else{
				loadLayout("spend_cash_point");
			}
		}
	}
}

function loadLayout(in_status){
	if(in_status == "select_payment_method"){
		selectPaymentMethodInit();
	}
	else if(in_status == "spend_cash_point"){
		spendCashPointInit();
	}
	else if(in_status == "spend_money"){
		spendMoneyInit();
	}
	else if(in_status == "select_plan"){
		selectPlanInit();
	}
	else if(in_status == "top_up_and_deduction"){
		topUpAndDeductionInit();
	}
	else{
		selectPaymentMethodInit();
	}
	status = in_status;
	loadLayoutValue();
};