var all = false;

iptvRegisterKeyHandler(keyEvent);
var pin = new Array(4);

var retry = 1;
var canEnterPIN = true;
var updateResult = false;
var goFailURL = false;

function keyEvent(keyCode) {
	if(keyCode == KEY_UP) {
		up();
	}else if(keyCode == KEY_DOWN) {
	    down();
	}else if(keyCode == KEY_LEFT) {
		left();
	}else if(keyCode == KEY_RIGHT) {
	    right();
	}else if(keyCode == KEY_CLEAR) {
		if (canEnterPIN) del();
	}else if(keyCode == KEY_ENTER) {
	    go();
	}else if(keyCode == KEY_BACK) {
		back();
	}else if(keyCode >= KEY_0 && keyCode <= KEY_9 ) {	
		if (canEnterPIN) changepass(keyCode);
    }
    
}    

function go(){
	if(all){
		deactivate();
	}
	
	if (updateResult) {
		window.parent.location.href = e;
	}
	if (goFailURL) {
		window.parent.location.href = failPwdURL;
	} else if (!canEnterPIN) {
		goFailURL = true;
	}
	
}

function left()
{
//    alert("left!!");
	iPanel.highlightFrame("password");
}

function right()
{
	iPanel.highlightFrame("password");
}

function up()
{
	iPanel.highlightFrame("password");
}

function down()
{
	iPanel.highlightFrame("password");
}

function back()
{
	//window.parent.location.href="../gen/synopsis_option.jsp?" + getURLParameter();
	if (canEnterPIN) window.parent.location.href=b;
}

function changepass(key)
{
    var tmp0="pin10";
	var tmp1="pin11";
	var tmp2="pin12";
	var tmp3="pin13";
	var img0=document.images[tmp0].src;
	var img1=document.images[tmp1].src;
	var img2=document.images[tmp2].src;
	var img3=document.images[tmp3].src;
	if(img0=='images/img-off.gif'){
			document.images[tmp0].src='images/img-on.gif';
		pin[0] = key-KEY_0;    
    }else{
	  if(img1=='images/img-off.gif'){
			document.images[tmp1].src='images/img-on.gif';
		pin[1] = key-KEY_0;    
	  }else{
	    if(img2=='images/img-off.gif'){
		 	document.images[tmp2].src='images/img-on.gif';
		  pin[2] = key-KEY_0;    
		}else{
			document.images[tmp3].src='images/img-on.gif';
		  if(img3=='images/img-off.gif'){
		    
		    pin[3] = key-KEY_0;    
			//window.parent.frames['purchased-pin'].location.href='../p2-pin/p2-finished.htm';
			//deactivate();
			all = true;
		  } 
		}
	  }
	}
}



function deactivate(){

	//window.parent.frames['purchased-pin'].location.href='p2-finished.htm';
	var ppin = "" + pin[0] + pin[1] + pin[2] + pin[3];
	//window.parent.frames['purchased-pin'].location.href=ppin + 'htm';
	updateResult= iptvVerifyPIN(ppin);

   // window.parent.frames['password'].location.href= updateResult + '.htm';
   	if (!updateResult)
   	{ 
   		if (retry == 3)
   		{
				invisibleButton();
				iPanel.scrollFrame("bottom", "down", 60);
				return;
			
			}
			else
			{			
				if (retry == 1) iPanel.scrollFrame("bottom", "down", 60);
				retry++;
				clearAll();
				return;
			}
		}

}

function getURLParameter() {
    var tmpParam    = location.href;
    var indParam    = tmpParam.indexOf( "?" );	
    var para;
    if ( indParam != -1 ) {
    	 para= tmpParam.substring( indParam + 1, tmpParam.length );
    }
    return para;
}

function del()
{
	all = false();
	var tmp0="pin10";
	var tmp1="pin11";
	var tmp2="pin12";
	var tmp3="pin13";
	var img0=document.images[tmp0].src;
	var img1=document.images[tmp1].src;
	var img2=document.images[tmp2].src;
	var img3=document.images[tmp3].src;
	if(img3=='images/img-on.gif'){
		document.images[tmp3].src='images/img-off.gif';
		pin[3] = "";
    }else{
	  if(img2=='images/img-on.gif'){
		document.images[tmp2].src='images/img-off.gif';
		pin[2] = "";
	  }else{
	    if(img1=='images/img-on.gif'){
		 document.images[tmp1].src='images/img-off.gif';
		  pin[1] = "";
		}else{
		  if(img0=='images/img-on.gif'){
		    document.images[tmp0].src='images/img-off.gif';
		    pin[0] = "";
		  } 
		}
	  }
	}
}
function clearAll()
{
	all = false();
	var tmp0="pin10";
	var tmp1="pin11";
	var tmp2="pin12";
	var tmp3="pin13";
	var img0=document.images[tmp0].src;
	var img1=document.images[tmp1].src;
	var img2=document.images[tmp2].src;
	var img3=document.images[tmp3].src;
	document.images[tmp3].src='images/img-off.gif';
	pin[3] = "";
	document.images[tmp2].src='images/img-off.gif';
	pin[2] = "";
	document.images[tmp1].src='images/img-off.gif';
	pin[1] = "";
	document.images[tmp0].src='images/img-off.gif';
	pin[0] = "";
}

function invisibleButton()
{
	all = false();
	var tmp0="pin10";
	var tmp1="pin11";
	var tmp2="pin12";
	var tmp3="pin13";
	var img0=document.images[tmp0].src;
	var img1=document.images[tmp1].src;
	var img2=document.images[tmp2].src;
	var img3=document.images[tmp3].src;
	document.images[tmp3].src='images/none.gif';
	pin[3] = "";
	document.images[tmp2].src='images/none.gif';
	pin[2] = "";
	document.images[tmp1].src='images/none.gif';
	pin[1] = "";
	document.images[tmp0].src='images/none.gif';
	pin[0] = "";
	
	document.images["back"].src='images/none.gif';
	
	canEnterPIN = false;
}