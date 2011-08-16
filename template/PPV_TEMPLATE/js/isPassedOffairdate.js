function isPassedOffairdate(in_offair) {
	if(in_offair == null||in_offair == "null"){
		return "true";
	}
	var offairdate = new Date();
	var YYYY = parseInt(in_offair.substring(6,10));
	var MM = parseInt(parseFloat(in_offair.substring(3,5))-1);
	var DD = parseInt(in_offair.substring(0,2));
	offairdate.setFullYear(YYYY,MM,DD);
	var today = new Date();
	if(today <= offairdate){
		return "false";
	}
	else{
		return "true";
	}
}
