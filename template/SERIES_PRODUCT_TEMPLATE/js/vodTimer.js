function isUndefined(a) {
	return typeof a == 'undefined';
} 
function VODTimer(){
	this.currentPlayTime = 0;
	this.SEPARATOR = "I";

	this.initialize = function(){
		//this.updateVODCurrentPlayTime();
	}
	this.finalize = function(){
		
	}
	this.getVODCurrentPlayTime = function() {
		return this.currentPlayTime;
	}
	this.setVODCurrentPlayTime = function(sec) {
		this.currentPlayTime = sec;
	}
	this.getVODCurrentPlayTimeDisplay = function() {
		var totalMin = this.currentPlayTime/60;
		var hr = parseInt(totalMin/60);
		var min = parseInt(totalMin%60);
		return "VOD"+(hr>99?hr:(hr<10?" 0"+hr:" "+hr))+":"+(min<10?"0"+min:min);;
	}
	this.updateVODCurrentPlayTime = function() {
		this.currentPlayTime = iptvVODGetCurrentPosition();
	}
	this.isCurrentPlayTimeUpdate = function() {
		var t = iptvVODGetCurrentPosition();
		return t == this.currentPlayTime;
	}
	
}

function addLeadingZero(value, noOfDigit) {
	var display = ""+value;
	while (display.length < noOfDigit) {
		display = "0"+display;
	}
	return display;
}