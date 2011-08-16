<%@page contentType="text/html; charset=big5" pageEncoding="big5"%>
<%@include file="qapi/isViewableProduct.jsp"%>
<%
String seriesId = request.getParameter("seriesid");
String seriesIndex = request.getParameter("seriesindex");
String backURL = request.getParameter("referrer");
String detail_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+seriesId+".js";
String cat_data_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+"_CAT_1.js";
%>
<html>
	<head>
		<title></title>
		<meta http-equiv="Content-Type" content="text/html; charset=big5">
		<script language='JavaScript' src='file:////javascript/iptv.js'></script>
		<script language="javascript" src="js/common.js"></script>
		<script>
			<jsp:include page="<%=cat_data_include%>" />
			<jsp:include page="<%=detail_include%>" />
		</script>
		<script language='JavaScript'>
			var language = "<%=language%>";
			var seriesindex = "<%=seriesIndex%>";
			var series_id = "<%=seriesId%>";
			var urlparam = "<%=urlParam%>";
			var libsubscribed = "<%=libSubscribed%>";
			var product_id = new Array();
			var img_id = new Array();
			var classification_list = new Array();
			var prev_id = 0;
			for (var i = 0;i < series_product_array.length; i++) {
				product_id[i]=series_product_array[i].id;
				img_id[i]=series_product_array[i].sd_image1_file;
				classification_list[i]=series_product_array[i].classification;
			}

			var total = series_product_array.length - 1;
			var eachDownPix = 30;
			var totalScroll = total * eachDownPix;
			var rowsEachDisplay = 7;

			var noOfRow=0;
			var setRow =0;

			var endpt = 0;
			var currentpage = 1;
			var count = 0;

			if(window.parent.name != "moviepage") iPanel.highlightFrame('programlist');
			iPanel.toggleScrolling('programlist', 3);
			iptvRegisterKeyHandler(keyEvent);

			var stbid = iptvGetSTBID();
			var stbsid = iptvGetSTBSessionID();	
			
			function generateEpisodeList(){
				var content = "";
				var compensate = 0;
				for (var i = 0; i < series_product_array.length; i++){
					var episode_name = "";
					if (language == "zh_tw") {
						episode_name = digestString(series_product_array[i].episode_name_chi,32);
					} else {
						episode_name = digestString(series_product_array[i].episode_name_eng,29);
					}
					content += '
					 <tr>
        		                        <td align="left" valign="middle" id="tr'+i+'" width="400" height="30">
                               			        <table width="400" height="30" border="0" cellpadding="0" cellspacing="0" valign="top">
			                                        <tr>
                        		                                <td align="left" valign="middle" width="380" height="30">
			                                                        <span id="name'+i+'">&nbsp;&nbsp;'+episode_name+'</span>
                                        		                </td>
        		                                                <td align="left" width="20" height="30">
                        		                                        <img src="images/<%=styleId%>/null.gif" width="20" height="30">
                                        		                </td>
                                                		</tr>
		                                        </table>
                		                </td>
		                        </tr>
					';
				}
				if(series_product_array.length % 7 != 0)  {
					compensate = (7 - (series_product_array.length % 7)) * 30;
					content += '<tr><td height="'+compensate+'"><img src="images/<%=styleId%>/null.gif" height="'+compensate+'"></td></tr>';
				}
				document.getElementById("episodeList").innerHTML = content;
			}
			
			function load()
			{
				generateEpisodeList();
				setTimeout("moveArbitrary();init();",500);
			}
			function init()
			{
				var i;
				highlightItem(setRow);
				changeParentArrow(0);
			}

			function keyEvent(keycode)
			{

				if(window.parent.name != "moviepage")
				{
					if(keycode == KEY_BACK)
					{
						window.parent.location.href="grid_view.jsp?"+urlparam;
					}
					else if(keycode == KEY_UP)
					{
						if((setRow >= 1)||(total>=1))
						{
							up();
						}
					}
					else if(keycode == KEY_DOWN)
					{
						if((setRow < noOfRow)||(total>=1))
						{
							down();
						}
					}
					else if(keycode == KEY_ENTER)
					{
						enter();
					}
					else if(keycode == KEY_YELLOW)
					{
						iptvSetNonVolatileData('epis', setRow);
						window.parent.location.href="class.jsp?"+urlparam+"seriesindex="+seriesindex;
					}
				}
			}
			function enter()
			{
				iptvSetNonVolatileData('epis', setRow);
		                var urlparamAppend="&seriesid="+series_id+"&seriesindex="+seriesindex+"&seriesproductid="+series_product_array[setRow].id+"&scheduleid="+series_product_array[setRow].schedule_id;
		                if(libsubscribed == "true"){ //subscribed
                		        window.parent.location.href="checkFlags.jsp?"+urlparam+urlparamAppend;
		                } else {
                		        window.parent.location.href="planlist.jsp?"+urlparam+urlparamAppend;
		                }
			}

			function up()
			{
				iPanel.highlightFrame("programlist");
				currentpage = 1;

				if (setRow > 0)
				{
					endpt--;

					if (endpt < 0)
					{
						iPanel.scrollFrame("programlist", "up", eachDownPix * rowsEachDisplay);
						endpt=rowsEachDisplay-1;
					}

					unHighlightItem(setRow);
					setRow--;
					highlightItem(setRow);
					changeParentArrow(setRow);
				}
				else
				{
					iPanel.scrollFrame("programlist", "down", totalScroll);
					unHighlightItem(setRow);
					setRow = total;
					endpt = total % rowsEachDisplay;

					highlightItem(setRow);
					changeParentArrow(setRow);
				}
			}


			function down()
			{
				iPanel.highlightFrame("programlist");
				currentpage = 1;

				if (setRow < total)
				{
					endpt++;
					if (endpt > rowsEachDisplay-1)
					{
						iPanel.scrollFrame("programlist", "down", eachDownPix * rowsEachDisplay);
						endpt = 0;
						downpix = downpix + eachDownPix * rowsEachDisplay;
					}

					unHighlightItem(setRow);

					setRow++;
					highlightItem(setRow);
					changeParentArrow(setRow);
				}
				else
				{
					iPanel.scrollFrame("programlist", "up", totalScroll);
					unHighlightItem(setRow);

					downpix = 0;
					setRow=0;
					endpt = 0;
					init();
				}
			}

			function highlightItem(id) {
				if (stbid.indexOf("0015253") == 0) {
					//STB 5253
					document.getElementById("tr"+ id).style.backgroundColor="#000000";
					document.getElementById("name"+ id).style.backgroundColor="#FFFFFF";
					document.getElementById("name"+id).style.color="white";
					parent.changeImage(img_id[id]);
					parent.changeClassification(classification_list[id]);
					setArrow(id);
					} else {
					//STB 6911 ok for below:
					document.getElementById("tr"+id).style.background="images/<%=styleId%>/pg_highlight_bar.jpg";
					document.getElementById("name"+id).style.color="white";
					parent.changeImage(img_id[id]);
					parent.changeClassification(classification_list[id]);
				}
			}

			function unHighlightItem(id) {
				//document.getElementById("img"+id).src = "images/<%=styleId%>/null.gif";
				if (stbid.indexOf("0015253") == 0) {
					//STB 5253
					document.getElementById("tr"+ id).style.color="transparent";
					document.getElementById("name"+ id).style.backgroundColor="#FFFFFF";
					document.getElementById("name"+id).style.color="black";
					unSetArrow(id);
					} else {
					//STB 6911 ok for below:
					document.getElementById("tr"+id).style.background="";
					document.getElementById("name"+id).style.color="black";
				}
			}

			function changeParentArrow(id) {
				if (id < 7) {
					changeParentUpArrow("arrowup_off.gif");
					} else {
					changeParentUpArrow("arrowup_on.gif");
				}

				if (id < parseInt(total/7) * 7) {
					changeParentDownArrow("arrowdown_on.gif");
					} else {
					changeParentDownArrow("arrowdown_off.gif");
				}		
			}

			function changeParentUpArrow(file) {
				if (stbid.indexOf("0015253") == 0) {
					//STB 5253

					} else {
					//STB 6911 ok for below:
					parent.changeUpArrow(file);
				}
			}

			function changeParentDownArrow(file) {
				if (stbid.indexOf("0015253") == 0) {
					//STB 5253

					} else {
					//STB 6911 ok for below:
					parent.changeDownArrow(file);
				}
			}

			var move = -1;
			function moveArbitrary()
			{
				move = iptvGetNonVolatileData('epis');
				move=Number(move);
				if(move > 0 && move <= total)
				{
					setRow = move;
					endpt = (setRow + 1)% rowsEachDisplay - 1;
					if(endpt < 0)
					{
						endpt = rowsEachDisplay - 1;
					}
					if(setRow - endpt > 0)
					{
						iPanel.scrollFrame("programlist", "down", eachDownPix * (setRow - endpt));
					}
				}
			}

			function setArrow(row)
			{
				if(row == 0)
				{
					document.images[row].src = "images/<%=styleId%>/down2.gif";
					//document.getElementById("img"+row).src = "images/<%=styleId%>/down2.gif";
				}
				else if(row == total)
				{
					document.images[row].src = "images/<%=styleId%>/up2.gif";
					//document.getElementById("img"+row).src = "images/<%=styleId%>/up2.gif";
				}
				else
				{
					document.images[row].src = "images/<%=styleId%>/level2.gif";
					//document.getElementById("img"+row).src = "images/<%=styleId%>/level2.gif";
				}
			}

			function unSetArrow(row)
			{
				document.images[row].src = "images/<%=styleId%>/null.gif";
			}
		</script>
		<style type="text/css">
			td 
			{
				font-size: 18px;
				color:black;
			}
		</style>
	</head>
	<body bgcolor="transparent" text="#FFFFFF" leftmargin="0" topmargin="0" onload="load()">
		<table width="400" height="210" border="0" cellpadding="0" cellspacing="0" valign="top" id="episodeList">
		</table>
	</body>
</html>
