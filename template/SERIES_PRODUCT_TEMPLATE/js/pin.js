var all = false;

iPanel.highlightFrame("password");
iptvRegisterKeyHandler(keyEvent);
var pin = new Array(4);

var retry = 1;

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
		del();
	}else if(keyCode == KEY_ENTER) {
	    go();
	}else if(keyCode == KEY_BACK) {
		back();
	}else if(keyCode >= KEY_0 && keyCode <= KEY_9 ) {	
		changepass(keyCode);
    }
    
}    

function go(){
	if(all){
		deactivate();
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
	window.parent.location.href="seriesProgramMain.jsp?"+urlparam+"seriesid="+seriesid+"&seriesindex="+seriesindex;
	return;
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
	if(img0=='images/'+styleId+'/img-off.gif'){
			document.images[tmp0].src='images/'+styleId+'/img-on.gif';
		pin[0] = key-KEY_0;    
    }else{
	  if(img1=='images/'+styleId+'/img-off.gif'){
			document.images[tmp1].src='images/'+styleId+'/img-on.gif';
		pin[1] = key-KEY_0;    
	  }else{
	    if(img2=='images/'+styleId+'/img-off.gif'){
		 	document.images[tmp2].src='images/'+styleId+'/img-on.gif';
		  pin[2] = key-KEY_0;    
		}else{
			document.images[tmp3].src='images/'+styleId+'/img-on.gif';
		  if(img3=='images/'+styleId+'/img-off.gif'){
		    
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
	var updateResult= iptvVerifyPIN(ppin);

   // window.parent.frames['password'].location.href= updateResult + '.htm';
   	all = false;
   	
   	if (!updateResult)
   	{ 
   		if (retry == 3)
   		{
			window.parent.location.href="../error-page.jsp?errorCode=VOD006";
			return;
		}
		else
		{			
			retry++;
			document.images['txt'].src = 'images/'+styleId+'/'+language+'/error_pin_password_txt.gif';
			//document.body.background='images/'+styleId+'/error_pin_password_txt_wp.gif';
			//window.parent.body.background='images/'+styleId+'/error_pin_password_txt_wp.gif';
			//window.parent.document.body.background='images/'+styleId+'/error_pin_password_txt_wp.gif';

			clearAll();
			return;
		}
	}
	window.parent.location.href="qapi/getsvod.jsp?verified=true&"+urlparam+"&seriesindex="+seriesindex+"&seriesid="+seriesid+"&seriesproductid="+seriesproductid+"&scheduleid="+scheduleid;
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
	if(img3=='images/'+styleId+'/img-on.gif'){
		document.images[tmp3].src='images/'+styleId+'/img-off.gif';
		pin[3] = "";
    }else{
	  if(img2=='images/'+styleId+'/img-on.gif'){
		document.images[tmp2].src='images/'+styleId+'/img-off.gif';
		pin[2] = "";
	  }else{
	    if(img1=='images/'+styleId+'/img-on.gif'){
		 document.images[tmp1].src='images/'+styleId+'/img-off.gif';
		  pin[1] = "";
		}else{
		  if(img0=='images/'+styleId+'/img-on.gif'){
		    document.images[tmp0].src='images/'+styleId+'/img-off.gif';
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
	document.images[tmp3].src='images/'+styleId+'/img-off.gif';
	pin[3] = "";
	document.images[tmp2].src='images/'+styleId+'/img-off.gif';
	pin[2] = "";
	document.images[tmp1].src='images/'+styleId+'/img-off.gif';
	pin[1] = "";
	document.images[tmp0].src='images/'+styleId+'/img-off.gif';
	pin[0] = "";
}
