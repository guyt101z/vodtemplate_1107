iptvRegisterKeyHandler(keyEvent);
var list_pos = 0;
var list_offset = 0;
var max_list_slot = 9;
var num_of_product = playlist_arr.length;
var max_page = countPage(num_of_product,max_list_slot);
var page_pos = 1;
var tmp_stbid = iptvGetSTBID();
var tmp_session_id = iptvGetSTBSessionID();
var stbid = tmp_stbid + "_" + tmp_session_id;
var max_cat = cat_arr.length;
var cat_pos = max_cat+1; // My playlist is 9
var globalSVODLock = iptvGetNonVolatileData("g_svl");
var restrictedSVODLock = iptvGetNonVolatileData("r_svl");

function load() {
	MM_preloadImages(
	'../../images/footer_acbalance_e.jpg',
	'../../images/footer_acbalance_next_e.jpg',
	'../../images/footer_acbalance_pre_e.jpg',
	'../../images/footer_acbalance_pre_next_e.jpg',
	'../../images/movie_bg_on.png'
	);
	if(k > 0){
		list_pos = k%9;
		list_offset = k - list_pos;
		page_pos = ((k - list_pos)/9) + 1;
	}
	if(max_page > 1 && page_pos == 1) document.getElementById("footer_img").style.background="../../images/footer_acbalance_next_e.jpg";
	else if(max_page > 1 && max_page == page_pos) document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_e.jpg";
	else if(max_page > 2 && max_page > page_pos) document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_next_e.jpg";
	else document.getElementById("footer_img").style.background="../../images/footer_acbalance_e.jpg";

	for(var j=1; j<11; j++){
		if (j == cat_arr.length+1) {
			if (j==cat_pos) {
				turnOnCat(cat_pos);
			} else {
				document.getElementById("leftgfx"+j).src="../../images/cateicon0"+j+"_unselect.png";
			}
			document.getElementById("lefttxt"+j).innerHTML="My Playlist";

		} else if (j  > cat_arr.length+1) {
			document.getElementById("leftgfx"+j).src="../../images/spacer.gif";
			document.getElementById("lefttxt"+j).innerHTML="";
		} else {
			if (j==cat_pos) {
				turnOnCat(cat_pos);
			} else {
				document.getElementById("leftgfx"+j).src="../../images/cateicon0"+j+"_unselect.png";
			}
			document.getElementById("lefttxt"+j).innerHTML=cat_arr[j-1].name;
		}
	}
	if(max_page < 1){
		writePageNum("-");
	}
	else{
		writePageNum(page_pos+"/"+max_page);
	}
	turnOnCat(cat_pos);
	if(num_of_product > 0){
		turnOn(list_pos);
		loadRightList(0);
	}
	else{
		document.getElementById("playlistTable").innerHTML=
		"
		<tr><td height='10'></td></tr>
		<tr class='headerPlaylist'><td width='454' height='41'></td></tr>
		<tr><td height='10' bgcolor=#000000></td></tr>
		<tr><td class='paddingLeft25' bgcolor=#000000>Sorry, no matched program available.</td></tr>
		<tr><td height='383' bgcolor=#000000></td></tr>
		";
		document.getElementById("rightInstruction").innerHTML=
		"
		Press number to select category
		";
	}
}
function loadRightList(offset){
	for(var i=0; i < max_list_slot; i++){
		if(i+offset < num_of_product){
			document.getElementById("name"+i).innerHTML=digestString(playlist_arr[i+offset].name,30);
			document.getElementById("typeClass"+i).innerHTML=digestString(playlist_arr[i+offset].typeClass,20);
			document.getElementById("expDate"+i).innerHTML=digestString(playlist_arr[i+offset].expDate,20);
		}
		else{
			document.getElementById("name"+i).innerHTML="";
			document.getElementById("typeClass"+i).innerHTML="";
			document.getElementById("expDate"+i).innerHTML="";
		}
	}
}
function turnOn(pos) {
	document.getElementById("rightslot"+pos).className="selectPlaylist";
}
function turnOff(pos) {
	document.getElementById("rightslot"+pos).className="unselectPlaylist";
}
function turnOffCat(pos) {
	document.getElementById("leftslot"+pos).className="cateUnSelect";
	document.getElementById("leftgfx"+pos).src="../../images/cateicon0"+pos+"_unselect.png";
}
function turnOnCat(pos) {
	document.getElementById("leftslot"+pos).className="cateSelect";
	document.getElementById("leftgfx"+pos).src="../../images/cateicon0"+pos+"_select.png";
}
function writePageNum(num){
	document.getElementById("pageNum").innerHTML=num;
}
function countPage(total_length,item_per_page){
	var j = 0;
	var i = 0;
	while(j < total_length){
		j += item_per_page;
		i++;
	}
	return i;
}

function doPageDown(){
	if(list_offset+max_list_slot < num_of_product){ //still have next page
		list_offset += max_list_slot;
		loadRightList(list_offset);
		//recover the cusor back to first slot
		turnOff(list_pos);
		list_pos = 0;
		turnOn(list_pos);
		//update the page counter
		page_pos++;
		writePageNum(page_pos+"/"+max_page);
		if(page_pos == max_page) document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_e.jpg";
		else document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_next_e.jpg";
	}
}
function doPageUp(){
	if(list_offset - max_list_slot >= 0){ //still have previous page
		list_offset -= max_list_slot;
		loadRightList(list_offset);
		//recover the cusor back to first slot
		turnOff(list_pos);
		list_pos = 0;
		turnOn(list_pos);
		//update the page counter
		page_pos--;
		writePageNum(page_pos+"/"+max_page);
		if(page_pos == 1) document.getElementById("footer_img").style.background="../../images/footer_acbalance_next_e.jpg";
		else document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_next_e.jpg";
	}
}
function keyEvent(keyCode) {
	if(keyCode == KEY_YELLOW) {
		doPageDown();
	}
	else if(keyCode == KEY_BLUE) {
		doPageUp();
	}
	else if(keyCode == KEY_RED) {
		window.parent.location.href="top_up_menu.jsp?referrer=myplaylist.jsp&cat="+cat_pos+"&productid="+ playlist_arr[list_pos+list_offset].id;
	}
	else if(keyCode == KEY_ENTER){
		if(num_of_product > 0){
			if (playlist_arr[list_pos+list_offset].islock) {
				window.parent.location.href="pin.jsp?expdayval="+playlist_arr[list_pos+list_offset].expTimeVal+"&referrer=myplaylist.jsp&cat="+cat_pos+"&productid="+ playlist_arr[list_pos+list_offset].id+"&movieformat="+playlist_arr[list_pos].movieformat+"&purchaseother=false&verified=false&playonly=true&price=0&"+urlparam;
			} else {
				if (globalSVODLock == "Y") {
					window.parent.location.href="pin.jsp?expdayval="+playlist_arr[list_pos+list_offset].expTimeVal+"&referrer=myplaylist.jsp&cat="+cat_pos+"&productid="+ playlist_arr[list_pos+list_offset].id+"&movieformat="+playlist_arr[list_pos].movieformat+"&purchaseother=false&verified=false&playonly=true&price=0&"+urlparam;
				} else if (restrictedSVODLock != "N") {
					if (playlist_arr[list_pos+list_offset].isrestricted) {
						window.parent.location.href="pin.jsp?expdayval="+playlist_arr[list_pos+list_offset].expTimeVal+"&referrer=myplaylist.jsp&cat="+cat_pos+"&productid="+ playlist_arr[list_pos+list_offset].id+"&movieformat="+playlist_arr[list_pos].movieformat+"&purchaseother=false&verified=false&playonly=true&price=0&"+urlparam;
					} else {
						window.parent.location.href="qapi/getppv.jsp?movieDuration="+playlist_arr[list_pos+list_offset].movieDuration+"&expdayval="+playlist_arr[list_pos+list_offset].expTimeVal+"&cat="+cat_pos+"&productid="+ playlist_arr[list_pos+list_offset].id+"&movieformat="+playlist_arr[list_pos].movieformat+"&purchaseother=false&verified=false&playonly=true&price=0&"+urlparam;
					}
				} else if (globalSVODLock == "N") {
					window.parent.location.href="qapi/getppv.jsp?movieDuration="+playlist_arr[list_pos+list_offset].movieDuration+"&expdayval="+playlist_arr[list_pos+list_offset].expTimeVal+"&cat="+cat_pos+"&productid="+ playlist_arr[list_pos+list_offset].id+"&movieformat="+playlist_arr[list_pos].movieformat+"&purchaseother=false&verified=true&playonly=true&price=0&"+urlparam;
				} else {
					window.parent.location.href="pin.jsp?expdayval="+playlist_arr[list_pos+list_offset].expTimeVal+"&referrer=myplaylist.jsp&cat="+cat_pos+"&productid="+ playlist_arr[list_pos+list_offset].id+"&movieformat="+playlist_arr[list_pos].movieformat+"&purchaseother=false&verified=false&playonly=true&price=0&"+urlparam;
				}
			}
		}
	}
	else if(keyCode == KEY_BACK) {
		//window.parent.location.href="http://visvod.netvigator.com/jsp/en/svod/sd_landing_mh.jsp?stbid="+stbid;
		window.parent.location.href="http://visvod.netvigator.com/jsp/en/svod/sd_landing.jsp?stbid="+stbid;
	}
	else if(keyCode == KEY_DOWN) {
		if(list_offset+list_pos < num_of_product-1){ //still have item
			if(list_pos < max_list_slot - 1){ //still can go bottom
				turnOff(list_pos);
				list_pos++;
				turnOn(list_pos);
			}
			else{ //time to do page down
				list_offset += max_list_slot;
				loadRightList(list_offset);
				//recover the cusor back to first slot
				turnOff(list_pos);
				list_pos = 0;
				turnOn(list_pos);
				//update the page counter
				page_pos++;
				writePageNum(page_pos+"/"+max_page);
				if(page_pos == max_page) document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_e.jpg";
				else document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_next_e.jpg";
			}
		}
	}
	else if(keyCode == KEY_UP) {
		if(list_offset+list_pos > 0){ //still have item
			if(list_pos > 0){ //still can go up
				turnOff(list_pos);
				list_pos--;
				turnOn(list_pos);
			}
			else{ //time to do page up
				list_offset -= max_list_slot;
				loadRightList(list_offset);
				//recover the cusor back to first slot
				turnOff(list_pos);
				list_pos = max_list_slot - 1;
				turnOn(list_pos);
				//update the page counter
				page_pos--;
				writePageNum(page_pos+"/"+max_page);
				if(page_pos == 1) document.getElementById("footer_img").style.background="../../images/footer_acbalance_next_e.jpg";
				else document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_next_e.jpg";
			}
		}
	}
	else if(538 > keyCode && keyCode > 527) {
		var in_cat = keyCode-528;
		if(in_cat == 0){
			in_cat = 10;
		}
		if (in_cat <= max_cat) {
			cat_pos = in_cat;
			window.parent.location.href="grid_view.jsp?cat="+cat_pos+"&"+urlparam;
		}
	}
}

