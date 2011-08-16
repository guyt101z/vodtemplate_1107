function isHDBox(stbid) {
	if(stbid.substr(0,7) == "0028203" || stbid.substr(0,7) == "0016911" || stbid.substr(0,7) == "0028206" || stbid.substr(0,7) == "0016916"){
		return true;
	}
	return false;
}

function showFrontPanelMsg(stbid) {
	if(stbid.substr(0,7) == "0028203" || stbid.substr(0,7) == "0016911" || stbid.substr(0,7) == "0016916"){
		return true;
	}
	return false;
}

function isHDProfile(serviceType) {
	if(serviceType=="MPEG4HD") {
		return true;
	}
	return false;
}

function isHDChannel(tvType) {
	return (tvType=="HD");
}