iptvRegisterKeyHandler(keyEvent);

function load(){
	document.getElementById("title").innerHTML = "You have successfully purchased "+p_title+".";
	document.getElementById("poster").src = "/vod/poster/sd/en/"+p_poster;
	
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
	/*
	if(isPassedOffairdate(p_offair)=="true"){
		window.parent.location.href = "/vod/moviehouse/en/ppv/expire.jsp?"+urlparam;
	}
	*/
	if(keyCode == KEY_ENTER) {
		//window.parent.location.href="qapi/getppv.jsp?verified=false&playonly=true&price="+price+"&"+urlParam;
		//window.parent.location.href="play-movie.jsp?"+urlparam;
		//if (movieExpiryTime < current)
		//	window.parent.location.href="expire.jsp?"+urlparam;
		window.parent.location.href="play-movie.jsp?"+urlparam;
		//parent.video.location.href="play-movie.jsp?"+parent.urlparam;
  } else if(keyCode == KEY_GREEN){
          window.parent.location.href="class.jsp?referrer="+backURL+"&"+ urlparam;
          //parent.video.location.href="class.jsp?"+parent.urlparam;
  } else if(keyCode == KEY_BLUE){
          window.parent.location.href="t_c.jsp?referrer="+backURL+"&"+urlparam;
          //parent.video.location.href="t_c.jsp?"+parent.urlparam;
	}
	else if(keyCode == KEY_BACK){
		window.parent.location.href="detail.jsp?"+urlparam;
		//parent.video.location.href="detail.jsp?"+parent.urlparam;
	}
}
