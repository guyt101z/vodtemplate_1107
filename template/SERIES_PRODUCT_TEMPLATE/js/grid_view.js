iptvUnsetNonVolatileData('epis');
var stbid = iptvGetSTBID();
var stbsid = iptvGetSTBSessionID();

var series_id = new Array();
var total = 0;

var url = document.URL;
var splitResult = url.split("fsa=");
var splitResult2 = splitResult[1].split("&subcustcat=");
var fsa = splitResult2[0];
var subcustcat = splitResult2[1];

var selectedSeries=0;
var underPinControl=false;

var ptrX = 0;
var ptrY = 0;
var startX = new Array(0,0);
var startY = new Array(0,0,0);
var MAX_X = 3;
var MAX_Y = 2;

var IMG_ID_PREFIX = "img_";
var calnum;

//unhighlight image
var imgBg = new Array();
var imgLnk = new Array();
var textVal = new Array();

imgBg[0] = new Array();
imgLnk[0] = new Array();
textVal[0] = new Array();

imgBg[1] = new Array();
imgLnk[1] = new Array();
textVal[1] = new Array();


//iptvAlert("cal ColNum#=3");
//Below is computed value

//below is Hardcore testing value
/*
imgBg[0][0] = "../../share/vodgif/S00244_1.jpg";
imgLnk[0][0] = "../seriesProgram/seriesProgramMain_L00481_" + series_id[0] + "_20090116.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
textVal[0][0] = "Record 0";

imgBg[1][0] = "../../share/vodgif/S00244_1.jpg";
imgLnk[1][0] = "../seriesProgram/seriesProgramMain_L00481_" + series_id[1] + "_20090116.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
textVal[1][0] = "Record 1";
imgBg[0][1] = "../../share/vodgif/S00244_1.jpg";
imgLnk[0][1] = "../seriesProgram/seriesProgramMain_L00481_" + series_id[2] + "_20090116.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
textVal[0][1] = "Record 2";
imgBg[1][1] = "../../share/vodgif/S00244_1.jpg";
imgLnk[1][1] = "../seriesProgram/seriesProgramMain_L00481_" + series_id[3] + "_20090116.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
textVal[1][1] = "Record 3";
imgBg[0][2] = "../../share/vodgif/S00244_1.jpg";
imgLnk[0][2] = "../seriesProgram/seriesProgramMain_L00481_" + series_id[4] + "_20090116.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
textVal[0][2] = "Record 4";

imgBg[1][2] = "../../share/vodgif/S00244_1.jpg";
imgLnk[1][2] = "../seriesProgram/seriesProgramMain_L00481_" + series_id[5] + "_20090116.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
textVal[1][2] = "Record 5";
imgBg[0][3] = "../../share/vodgif/S00244_1.jpg";
imgLnk[0][3] = "../seriesProgram/seriesProgramMain_L00481_" + series_id[6] + "_20090116.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
textVal[0][3] = "Record 6";
imgBg[1][3] = "../../share/vodgif/S00244_1.jpg";
imgLnk[1][3] = "../seriesProgram/seriesProgramMain_L00481_" + series_id[7] + "_20090116.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
textVal[1][3] = "Record 7";
imgBg[0][4] = "../../share/vodgif/S00244_1.jpg";
imgLnk[0][4] = "../seriesProgram/seriesProgramMain_L00481_" + series_id[8] + "_20090116.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
textVal[0][4] = "Record 8";
*/

function load()
{
	if (location.href.length > 0){
	 	//var seriesIdx=location.href.indexOf("selected_series");
	 	var seriesIdx=location.href.indexOf("selected_series=");
        if (seriesIdx > -1){
        	var selectedSeriesParam=location.href.substring(seriesIdx,location.href.length).split('&fsa=');
        	//location.href.substring(seriesIdx,location.href.length).split('=');

			//selectedSeries=eval(selectedSeriesParam[1]);
			selectedSeries=eval(selectedSeriesParam[0]);
			underPinControl=true;
		}
	}
	if (underPinControl==false){
       iPanel.highlightFrame('all_series');
       iPanel.toggleScrolling('all_series', 3);
    }

	iptvRegisterKeyHandler(keyEvent);
	showX(0, 0);
	highlightItem(0, 0);
	updateLRBtn();
}

function keyEvent(keycode)
{
	if(keycode == KEY_ENTER)
	{
		//window.parent.location.href="../seriesDetail/seriesDetail_L00481_" + series_id[sd] + "_20110727.html";
		enter();
	}
	else if(keycode ==KEY_LEFT)
	{
		left();
	}
	else if(keycode == KEY_RIGHT)
	{
		right();
	}
	else if (keycode == KEY_UP) 
	{
        up();
    }
    else if (keycode == KEY_DOWN) 
    {
        down();
    }
	else if (keycode == KEY_BACK || keycode == KEY_EXIT)
	{
		//window.parent.location.href="../../svod/sd_landing.jsp";		
		//window.parent.location.href="../checkSTB.jsp?stbid=" + stbid + "_" + stbsid;
		//iPanel.back();
		if (subcustcat.indexOf("BUS") > -1 ) {
			window.parent.location.href="../../svodGolf/main_landing_cvi.jsp";
		} else {
			window.parent.location.href="../../svod/sd_landing.jsp";
		}
	}
	else if(keycode == KEY_YELLOW)
	{
		window.parent.location.href="../static/classificationcodepage.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
	}
	/*
	else if(keycode == KEY_RED)
	{
		window.parent.location.href="../promo-page.jsp?fsa="+fsa+"&stbid="+stbid+"_"+stbsid;
	}
	*/
}

function enter()
{
	calnum = (startX[ptrY]+ptrX)*2+startY[ptrX]+ptrY;
	
	//iptvAlert("Record No.="+calnum);
	//iptvAlert("Record Value="+textVal[startY[ptrX]+ptrY][(startX[ptrY]+ptrX)]);
	//iptvAlert("Ln="+imgLnk[startY[ptrX]+ptrY][(startX[ptrY]+ptrX)]);
	
	//if (series_Allow_Episode_Select[sd]=="Y" || series_Allow_Episode_Select[sd]=="y" ) {
	if (series_id[calnum]=="S00861") {
	
		//window.parent.location.href="../seriesProgram/seriesProgramMain_L00481_" + series_id[calnum] + "_20110727.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
		iptvSetNonVolatileData('epis', calnum);

		window.parent.location.href="../subscription/check_subscription.jsp?stbid=" + stbid + "_" + stbsid
					+ "&vod_product_id="
					+ "&vod_library_id=L00481&stime=20110727"
					+ "&moviepage=../svod_landing.jsp"
					+ "&selected_series="+calnum;
	} 
	//else if (series_Allow_Episode_Select[sd]=="N" || series_Allow_Episode_Select[sd]=="n" ) 
	else 
	{
		//window.parent.location.href="../seriesProgram/seriesProgramMain_L00481_" + series_id[calnum] + "_20110727.html?fsa="+fsa+"&stbid="+stbid + "_" + stbsid;
		window.parent.location.href=imgLnk[startY[ptrX]+ptrY][(startX[ptrY]+ptrX)];
	}
}

function left()
{
	var nextX=ptrX;
	if(ptrX-1<0) {
		if(startX[ptrY]==0) {	//current position is already zero
			if (ptrY==0) startX[1]=0;
			if (ptrY==1) startX[0]=0;
		} else {	//shift left position
			showX(ptrY, --startX[ptrY]);
			if (ptrY==0) --startX[1];
			if (ptrY==1) --startX[0];
		}
	} else {
		nextX--;
		unHighlightItem(ptrY, ptrX);
		highlightItem(ptrY, nextX);
		ptrX=nextX;
	}
	updateLRBtn();
	
	//calnum = (startX[ptrY]+ptrX)*2+startY[ptrX]+ptrY;
	//iptvAlert("Record No.="+calnum);
}

function right()
{
	var nextX=ptrX;
	var maxLen=imgBg[0].length;  //imgBg[ptrY].length
	var tmpVal=startX[ptrY]+ptrX+1;
	
	if(imgBg[ptrY].length>3 && startX[ptrY]+ptrX+1 == maxLen) {	//over the array, go back to zero position
		//ptrX = 0;
		//nextX = 0;
		//startX[ptrY] = 0;
		//if (ptrY==0) startX[1] = 0;
		//if (ptrY==1) startX[0] = 0;
		//showX(0,0);
		//unHighlightItem(ptrY, 2);
		//highlightItem(ptrY, 0);
	} else if ((imgBg[ptrY].length>3 || (ptrY==1 && imgBg[1].length==3 && imgBg[0].length>3)) && nextX + 1 >= MAX_X) {	//over the screen
		++startX[0];
		++startX[1];
		showX(ptrY, startX[ptrY]);
		if (ptrY==1 && typeof textVal[ptrY][tmpVal] == "undefined") {
			ptrY=0;
			unHighlightItem(1, 2);
			highlightItem(0, 2);
		}
	} else {
		//iptvAlert("ptrY="+ptrY+":tmpVal="+tmpVal+":ptrX="+ptrX);
		if (typeof imgBg[ptrY][tmpVal] != "undefined") {
			nextX++;
			unHighlightItem(ptrY, ptrX);
			highlightItem(ptrY, nextX);
			ptrX=nextX;
		} else if (imgBg[ptrY].length>3 || (ptrY==1 && imgBg[ptrY].length==3 && imgBg[0].length>3)){
			ptrY=0;
			nextX++;
			unHighlightItem(1, 1);
			highlightItem(0, 2);
			ptrX=nextX;
		}
	}
	updateLRBtn();
	
	//calnum = (startX[ptrY]+ptrX)*2+startY[ptrX]+ptrY;
	//iptvAlert("Record No.="+calnum);
}

function up()
{
    var nextY=ptrY;
	if(nextY-1<0) {
		//for(nextY = imgBg.length-1; nextY > 0 && (typeof imgBg[nextY][ptrX] == "undefined"); nextY--) {	}
	} else {
		nextY--;
	}
	unHighlightItem(ptrY, ptrX);
	highlightItem(nextY, ptrX);
	ptrY=nextY;
	
	updateLRBtn();
	
	//calnum = (startX[ptrY]+ptrX)*2+startY[ptrX]+ptrY;
	//iptvAlert("Record No.="+calnum);
}

function down()
{
	var nextY=ptrY;
	
	if (typeof imgBg[nextY+1][startX[ptrY]+ptrX] == "undefined") {
		//nextY = 0;
	} else {
		nextY++;
	}
	unHighlightItem(ptrY, ptrX);
	highlightItem(nextY, ptrX);
	ptrY=nextY;
	
	//calnum = (startX[ptrY]+ptrX)*2+startY[ptrX]+ptrY;
	//iptvAlert("Record No.="+calnum);
}

//update Left/Right Button
function updateLRBtn() {
	
	if(imgBg[0].length > MAX_X) {
		if(startX[0]!=0 && startX[1]!=0) {
			showLBtn();
		} else {
			noShowLBtn();
		}
		if(startX[ptrY]+MAX_X<imgBg[0].length) {
			showRBtn();
		} else {
			noShowRBtn();
		}
	} else {
		noShowLBtn();
		noShowRBtn();
	}
}

function showLBtn() {
	if (document.images["arrow_left"].src != "../gif/arrowleft_on.gif") {
		document.images["arrow_left"].src = "../gif/arrowleft_on.gif";
	}
}

function noShowLBtn() {
	if (document.images["arrow_left"].src != "../gif/arrowleft_off.gif") {
		document.images["arrow_left"].src = "../gif/arrowleft_off.gif";
	}
}

function showRBtn() {
	if (document.images["arrow_right"].src != "../gif/arrowright_on.gif") {
		document.images["arrow_right"].src = "../gif/arrowright_on.gif";
	}
}

function noShowRBtn() {
	if (document.images["arrow_right"].src != "../gif/arrowright_off.gif") {
		document.images["arrow_right"].src = "../gif/arrowright_off.gif";
	}
}

//refresh image from startX
function showX(y, startX) {
	
	var sum;
	if (y == 0) {
		sum = y+1;
	} else {
		sum = y-1;
	}
	
	for(var i=0; i<MAX_X; i++) {
		if (startX+i < imgBg[0].length) {
			//if (i == ptrX) 
			//	document.images[IMG_ID_PREFIX+y+"_"+i].src = imgBg[y][startX+i];
			//	document.getElementById("text_"+y+"_"+i).innerHTML = textVal[y][startX+i];
			//	document.images[IMG_ID_PREFIX+sum+"_"+i].src = imgBg[sum][startX+i];
			//	document.getElementById("text_"+sum+"_"+i).innerHTML = textVal[sum][startX+i];
			
			//document.images[IMG_ID_PREFIX+y+"_"+i].src = imgBg[y][startX+i];
			//document.getElementById("text_"+y+"_"+i).innerHTML = textVal[y][startX+i];
			if (typeof textVal[y][startX+i] != "undefined") {
				document.images[IMG_ID_PREFIX+y+"_"+i].src = imgBg[y][startX+i];
				document.getElementById("text_"+y+"_"+i).innerHTML = textVal[y][startX+i];
			} else {
				document.images[IMG_ID_PREFIX+y+"_"+i].src = "../gif/null.gif";
				document.getElementById("text_"+y+"_"+i).innerHTML = "";
			}
			
			if (typeof textVal[sum][startX+i] != "undefined") {
				document.images[IMG_ID_PREFIX+sum+"_"+i].src = imgBg[sum][startX+i];
				document.getElementById("text_"+sum+"_"+i).innerHTML = textVal[sum][startX+i];
			} else {
				document.images[IMG_ID_PREFIX+sum+"_"+i].src = "../gif/null.gif";
				document.getElementById("text_"+sum+"_"+i).innerHTML = "";
			}
		} else {
			document.images[IMG_ID_PREFIX+y+"_"+i].src = "../gif/null.gif";
			document.getElementById("text_"+y+"_"+i).innerHTML = "";
			document.getElementById("text_"+sum+"_"+i).innerHTML = "";
		}
	}
}

function highlightItem(y, x) {
	document.getElementById("cell_"+y+"_"+x).style.background="../gif/sr_select_background.jpg";
	document.getElementById("cell_"+y+"_"+x).style.color="#FFFFFF";
}

function unHighlightItem(y, x) {
	document.getElementById("cell_"+y+"_"+x).style.background="../gif/null.gif";
	document.getElementById("cell_"+y+"_"+x).style.color="#000000";
}
