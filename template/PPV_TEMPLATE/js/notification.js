iptvRegisterKeyHandler(keyEvent);
var t;
function load(){
	t = setTimeout("playMovie()",5000);
}

function keyEvent(keyCode) {
				clearTimeout(t);
        if(keyCode == KEY_ENTER) {
                //window.parent.location.href="qapi/getppv.jsp?verified=false&playonly=true&price="+price+"&"+urlParam;
                window.parent.location.href="play-movie.jsp?"+urlparam;
                //parent.video.location.href="play-movie.jsp?"+parent.urlparam;
        }
        else if(keyCode == KEY_BACK){
                window.parent.location.href="index.jsp";
                //parent.video.location.href="detail.jsp?"+parent.urlparam;
        }
        else if(keyCode == KEY_EXIT){
        				window.parent.location.href="index.jsp";
								//parent.video.location.href="detail.jsp?"+parent.urlparam;				
				}
}

function playMovie() {
	window.parent.location.href="play-movie.jsp?"+urlparam;
}
