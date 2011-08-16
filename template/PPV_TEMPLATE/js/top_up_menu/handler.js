var status = "entry";
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
		else{
			// do nothing
		}
}
function doDown(){
		if(cur_option < num_option){
			cur_option++;
			hightlightOption(cur_option);
		}
		else{
			// do nothing
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
function load() {
	loadLayout("entry");
}
function loadLayout(in_status){
	if(in_status == "entry"){
		entryInit();
	}
	else if(in_status == "select_plan"){
		planInit();
	}
	else if(in_status == "pin"){
		pinInit();
	}
	else{
		entryInit();
	}
	status = in_status;
};