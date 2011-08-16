<%@page contentType="text/html; charset=big5" pageEncoding="big5"%>
<%@include file="svod_header.jsp"%>
<%
String seriesId = request.getParameter("seriesid");
String cat_data_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+"_CAT_1.js";
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=big5">
		<script language='JavaScript' src='file:////javascript/iptv.js'></script>
		<script language="javascript" src="js/common.js"></script>
		<script>
			<jsp:include page="<%=cat_data_include%>" />
		</script>
		<script language="javascript">
			var language = "<%=language%>";
			var catId = "<%=catId%>"
			var urlparam = "<%=urlParam%>";
			var styleId = "<%=styleId%>";
			var k = -1;
			var seriesId = "<%=seriesId%>";
			if (k == -1 && seriesId != "" && seriesId != "null"){
				for (k= 0; k < series_array.length; k++){
					if (series_array[k].id == seriesId) {
						break;
					}
				}
				k += product_array.length;
			}
			iptvUnsetNonVolatileData('epis');
			var stbid = iptvGetSTBID();
			var stbsid = iptvGetSTBSessionID();
			var series_id = new Array();
			for (var i = 0; i < series_array.length; i++){
				series_id[i] = series_array[i].id;
			} 
			var total = series_array.length;

			var url = document.URL;
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

			for (var i = 0; i < series_array.length;i++){
				if (i < 3 || (i/3)%2 ==0 ){
					imgBg[0].push("/vod/poster/sd/en/"+series_array[i].sd_image1_file);
					imgLnk[0].push("seriesProgramMain.jsp?"+urlparam+"seriesid="+series_array[i].id+"&seriesindex="+i);
					if (language == "zh_tw") {
						textVal[0].push(digestString(series_array[i].name_chi,28));
					} else {
						textVal[0].push(digestString(series_array[i].name_eng,19));
					}
				}
				else {
					imgBg[1].push("/vod/poster/sd/en/"+series_array[i].sd_image1_file);
					imgLnk[1].push("seriesProgramMain.jsp?"+urlparam+"seriesid="+series_array[i].id+"&seriesindex="+i);
					if (language == "zh_tw") {
						textVal[1].push(digestString(series_array[i].name_chi,28));
					} else {
						textVal[1].push(digestString(series_array[i].name_eng,19));
					}
				}
			}

			function load()
			{
				if (location.href.length > 0){
					var seriesIdx=location.href.indexOf("selected_series=");
					if (seriesIdx > -1){
						var selectedSeriesParam=location.href.substring(seriesIdx,location.href.length).split('&fsa=');
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
					if (language == "zh_tw") {
			                        window.parent.location.href="http://visvod.netvigator.com/jsp/cn/svod/sd_landing.jsp?stbid="+stbid;
			                }	
			                else {
                        			window.parent.location.href="http://visvod.netvigator.com/jsp/en/svod/sd_landing.jsp?stbid="+stbid;
			                }
				}
				else if(keycode == KEY_YELLOW)
				{
					window.parent.location.href="class.jsp?"+urlparam;
				}
			}

			function enter()
			{
				window.parent.location.href=imgLnk[startY[ptrX]+ptrY][(startX[ptrY]+ptrX)];
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
			}

			function right()
			{
				var nextX=ptrX;
				var maxLen=imgBg[0].length;  //imgBg[ptrY].length
				var tmpVal=startX[ptrY]+ptrX+1;

				if(imgBg[ptrY].length>3 && startX[ptrY]+ptrX+1 == maxLen) {	//over the array, go back to zero position
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
			}

			function up()
			{
				var nextY=ptrY;
				if(nextY-1<0) {
				} else {
					nextY--;
				}
				unHighlightItem(ptrY, ptrX);
				highlightItem(nextY, ptrX);
				ptrY=nextY;

				updateLRBtn();
			}

			function down()
			{
				var nextY=ptrY;

				if (typeof imgBg[nextY+1][startX[ptrY]+ptrX] == "undefined") {
				} else {
					nextY++;
				}
				unHighlightItem(ptrY, ptrX);
				highlightItem(nextY, ptrX);
				ptrY=nextY;
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
				if (document.images["arrow_left"].src != "images/<%=styleId%>/arrowleft_on.gif") {
					document.images["arrow_left"].src = "images/<%=styleId%>/arrowleft_on.gif";
				}
			}

			function noShowLBtn() {
				if (document.images["arrow_left"].src != "images/<%=styleId%>/arrowleft_off.gif") {
					document.images["arrow_left"].src = "images/<%=styleId%>/arrowleft_off.gif";
				}
			}

			function showRBtn() {
				if (document.images["arrow_right"].src != "images/<%=styleId%>/arrowright_on.gif") {
					document.images["arrow_right"].src = "images/<%=styleId%>/arrowright_on.gif";
				}
			}

			function noShowRBtn() {
				if (document.images["arrow_right"].src != "images/<%=styleId%>/arrowright_off.gif") {
					document.images["arrow_right"].src = "images/<%=styleId%>/arrowright_off.gif";
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
						if (typeof textVal[y][startX+i] != "undefined") {
							document.images[IMG_ID_PREFIX+y+"_"+i].src = imgBg[y][startX+i];
							document.getElementById("text_"+y+"_"+i).innerHTML = textVal[y][startX+i];
						} else {
							document.images[IMG_ID_PREFIX+y+"_"+i].src = "images/<%=styleId%>/null.gif";
							document.getElementById("text_"+y+"_"+i).innerHTML = "";
						}

						if (typeof textVal[sum][startX+i] != "undefined") {
							document.images[IMG_ID_PREFIX+sum+"_"+i].src = imgBg[sum][startX+i];
							document.getElementById("text_"+sum+"_"+i).innerHTML = textVal[sum][startX+i];
						} else {
							document.images[IMG_ID_PREFIX+sum+"_"+i].src = "images/<%=styleId%>/null.gif";
							document.getElementById("text_"+sum+"_"+i).innerHTML = "";
						}
					} else {
						document.images[IMG_ID_PREFIX+y+"_"+i].src = "images/<%=styleId%>/null.gif";
						document.getElementById("text_"+y+"_"+i).innerHTML = "";
						document.getElementById("text_"+sum+"_"+i).innerHTML = "";
					}
				}
			}

			function highlightItem(y, x) {
				document.getElementById("cell_"+y+"_"+x).style.background="images/<%=styleId%>/sr_select_background.jpg";
				document.getElementById("cell_"+y+"_"+x).style.color="#FFFFFF";
			}

			function unHighlightItem(y, x) {
				document.getElementById("cell_"+y+"_"+x).style.background="images/<%=styleId%>/null.gif";
				document.getElementById("cell_"+y+"_"+x).style.color="#000000";
			}

		</script>
		<style type="text/css">
			td {
				font-size: 18;
			}
			.name {
				word-wrap:break-word;
			}
		</style>
	</head>
	<body bgcolor="transparent" text="#000000"  leftmargin="0" topmargin="0" onLoad="load()">
		<table width="638" height="336" border="0" cellspacing="0" cellpadding="0" align="left">
			<tr colspan="2">
				<td rowspan="4" width="18">
					<!--img src="images/<%=styleId%>/null.gif" width="16"-->
					<img src="images/<%=styleId%>/null.gif" width="2" height="183">
					<img id="arrow_left" src="images/<%=styleId%>/arrowleft_off.gif" valign="top" width="15" height="183">
					<img src="images/<%=styleId%>/null.gif" width="1" height="183">
				</td>

				<td id="cell_0_0" width="194" height="164" align="center" valign="top">
					<table width="182" border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td height="5"><img src="images/<%=styleId%>/null.gif" height="5"></td>
						</tr>
						<tr>
							<td valign="top" align="center" width="182" height="108">
								<img id="img_0_0" src="images/<%=styleId%>/null.gif" width="182" height="108" >
							</td>
						</tr>
						<tr>
							<td id="name_0" align="center" width="182" height="48">
								<font class="name" id="text_0_0"></font>
							</td>
						</tr>
					</table>
				</td>

				<td width="11"><img src="images/<%=styleId%>/null.gif" width="11"></td>

				<td id="cell_0_1" width="194" height="164" align="center" valign="top">
					<table width="182" border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td height="5"><img src="images/<%=styleId%>/null.gif" height="5"></td>
						</tr>
						<tr>
							<td valign="top" align="center" width="182" height="108">
								<img id="img_0_1" src="images/<%=styleId%>/null.gif" width="182" height="108" >
							</td>
						</tr>
						<tr>
							<td id="name_1" align="center" width="182" height="48">
								<font class="name" id="text_0_1"></font>
							</td>
						</tr>
					</table>
				</td>

				<td width="11"><img src="images/<%=styleId%>/null.gif" width="11"></td>

				<td id="cell_0_2" width="194" height="164" align="center" valign="top">
					<table width="182" border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td height="5"><img src="images/<%=styleId%>/null.gif" height="5"></td>
						</tr>
						<tr>
							<td valign="top" align="center" width="182" height="108">
								<img id="img_0_2" src="images/<%=styleId%>/null.gif" width="182" height="108" >
							</td>
						</tr>
						<tr>
							<td id="name_2" align="center" width="182" height="48">
								<font class="name" id="text_0_2"></font>
							</td>
						</tr>
					</table>
				</td>

				<td rowspan="4" width="15">
					<!--img src="images/<%=styleId%>/null.gif" width="16"-->
					<!--img id="arrow_0" src="images/<%=styleId%>/null.gif" width="17" height="164"-->
					<img id="arrow_right" src="images/<%=styleId%>/arrowright_off.gif" valign="top" width="15" height="183">
				</td>

			</tr>
			<tr>
				<td height="8" colspan="5"><img src="images/<%=styleId%>/null.gif" height="8"></td>
			</tr>
			<tr>

				<td id="cell_1_0" width="194" height="164" align="center" valign="top">
					<table width="182" border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td height="5"><img src="images/<%=styleId%>/null.gif" height="5"></td>
						</tr>
						<tr>
							<td valign="top" align="center" width="182" height="108">
								<img id="img_1_0" src="images/<%=styleId%>/null.gif" width="182" height="108" >
							</td>
						</tr>
						<tr>
							<td id="name_3" align="center" width="182" height="48">
								<font class="name" id="text_1_0"></font>
							</td>
						</tr>
					</table>
				</td>

				<td width="11"><img src="images/<%=styleId%>/null.gif" width="11"></td>

				<td id="cell_1_1" width="194" height="164" align="center" valign="top">
					<table width="182" border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td height="5"><img src="images/<%=styleId%>/null.gif" height="5"></td>
						</tr>
						<tr>
							<td valign="top" align="center" width="182" height="108">
								<img id="img_1_1" src="images/<%=styleId%>/null.gif" width="182" height="108" >
							</td>
						</tr>
						<tr>
							<td id="name_4" align="center" width="182" height="48">
								<font class="name" id="text_1_1"></font>
							</td>
						</tr>
					</table>
				</td>

				<td width="11"><img src="images/<%=styleId%>/null.gif" width="11"></td>

				<td id="cell_1_2" width="194" height="164" align="center" valign="top">
					<table width="182" border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td height="5"><img src="images/<%=styleId%>/null.gif" height="5"></td>
						</tr>
						<tr>
							<td valign="top" align="center" width="182" height="108">
								<img id="img_1_2" src="images/<%=styleId%>/null.gif" width="182" height="108" >
							</td>
						</tr>
						<tr>
							<td id="name_5" align="center" width="182" height="48">
								<font class="name" id="text_1_2"></font>
							</td>
						</tr>
					</table>
				</td>

			</tr>
			<tr>
				<td height="8" colspan="5"><img src="images/<%=styleId%>/null.gif" height="8"></td>
			</tr>
		</table>
	</body>
</html>
