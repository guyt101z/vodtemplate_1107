iptvRegisterKeyHandler(keyEvent);
var max_grid_slot = 12;
var num_of_product = library_list.length;
var max_page = countPage(num_of_product,max_grid_slot);
var tmp_stbid = iptvGetSTBID();
var tmp_session_id = iptvGetSTBSessionID();
var stbid = tmp_stbid + "_" + tmp_session_id;
var catLength = genre_list.length;
var fsaid = iptvGetFSA();
var lang = "e";
var image_name = "";
var default_image_name = "";
if(1 == iptvGetLanguage()) { lang = "c"; }

function load() {
	MM_preloadImages(
	'../images/svod_footer1_' + lang + '.gif',
	'../images/svod_footer3_' + lang + '.gif',
	'../images/svod_footer2_' + lang + '.gif',
	'../images/svod_footer2_' + lang + '.gif'
	);
	if(k > 0){
		grid_pos = k%12;
		grid_offset = k - grid_pos;
		page_pos = ((k - grid_pos)/12) + 1;
	}
	
//	iptvUnsetNonVolatileData("genre");
	document.getElementById("back").src="../images/svod_exit1_" + lang + ".gif";
	document.getElementById("nowselectlogo").src=lang=="c"?"../images/svod_nowselectlogo2.gif":"../images/svod_nowselectlogo1.gif";
//	document.getElementById("steps").src=lang=="c"?"../images/svod_step1_c.gif":"../images/svod_step1_e.gif";
	
	if(max_page > 1 && page_pos == 1) {
		document.getElementById("footer_img").style.background="../images/svod_footer1_" + lang + ".gif";
		document.getElementById("downlogo").src="../images/svod_down_nor.gif";
	}
	else if(max_page > 1 && max_page == page_pos) {
		document.getElementById("footer_img").style.background="../images/svod_footer3_" + lang + ".gif";
		document.getElementById("uplogo").src="../images/svod_up_nor.gif";
	}
	else if(max_page > 2 && max_page > page_pos) {
		document.getElementById("footer_img").style.background="../images/svod_footer2_" + lang + ".gif";
		document.getElementById("uplogo").src="../images/svod_up_nor.gif";
		document.getElementById("downlogo").src="../images/svod_down_nor.gif";
	}
	else {
		document.getElementById("footer_img").src="../images/spacer.gif";
		document.getElementById("uplogo").src="../images/spacer.gif";
		document.getElementById("downlogo").src="../images/spacer.gif";
	}
	
	for(var j=1; j<11; j++){
		if (j <= catLength) {
			if (j==cat_pos) {
				turnOnCat(cat_pos);				
			} else {
				document.getElementById("leftgfx"+j).src="../images/svod_cat"+j+"_nor.gif";
			}
			document.getElementById("lefttxt"+j).innerHTML=lang=="c"?genre_list[j-1].cnName:genre_list[j-1].enName;
		} else if (j > catLength) {
			document.getElementById("leftgfx"+j).src="../images/spacer.gif";
			document.getElementById("lefttxt"+j).innerHTML="";
		}
	}
	
	loadFullGrid(grid_offset);
	turnOnCat(cat_pos);
	turnOnGrid(grid_pos);
}

function turnOffCat(pos) {
	document.getElementById("leftslot"+pos).className="cateUnSelect";
	document.getElementById("leftgfx"+pos).src="../images/svod_cat"+pos+"_nor.gif";
}

function turnOnCat(pos) {
	document.getElementById("leftslot"+pos).className="cateSelect";
	document.getElementById("leftgfx"+pos).src="../images/svod_cat"+pos+"_sel.gif";
}

function turnOffGrid(pos) {
	document.getElementById("rightslot"+pos).className="unmovieSelect";
}

function turnOnGrid(pos) {
	if (library_list[pos+grid_offset]) {
		document.getElementById("rightslot"+pos).className="movieSelect";
	}
}
function loadFullGrid(offset){
	for(var i=0; i < max_grid_slot; i++){
		if(i+offset < num_of_product){
			image_name = (lang=="c"?library_list[i+offset].cnImageName:library_list[i+offset].enImageName);
			default_image_name = (lang=="c"?'svod_cp_default_chi.png':'svod_cp_default_eng.png');
			if (image_name == default_image_name) {
				loadGrid(i,"../data/Images/" + (lang=="c"?library_list[i+offset].cnImageName:library_list[i+offset].enImageName));
			} else {	
				loadGrid(i,"../data/"+version+"/Images/" + (lang=="c"?library_list[i+offset].cnImageName:library_list[i+offset].enImageName));
			}
		}
		else{
			loadGrid(i,"../images/spacer.gif","");
		}
	}
}
function loadGrid(pos,poster){
	document.getElementById("rightgfx"+pos).src=poster;
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
function MM_preloadImages() {
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function doPageDown(){
	if(grid_offset + max_grid_slot < num_of_product){ //there's next page
		//page down
		grid_offset += max_grid_slot;
		loadFullGrid(grid_offset);
		//increase the page counter
		page_pos++;
		//recover the cusor in last page
		turnOffGrid(grid_pos);
		while(grid_offset+grid_pos > num_of_product - 1){
			grid_pos--;
		}
		turnOnGrid(grid_pos);
		if(page_pos == max_page) {
			document.getElementById("footer_img").style.background="../images/svod_footer3_" + lang + ".gif";
			document.getElementById("uplogo").src="../images/svod_up_nor.gif";
			document.getElementById("downlogo").src="../images/svod_down_dim.gif";
		}
		else {
			document.getElementById("footer_img").style.background="../images/svod_footer2_" + lang + ".gif";
			document.getElementById("uplogo").src="../images/svod_up_nor.gif";
			document.getElementById("downlogo").src="../images/svod_down_nor.gif";
		}
	}
}
function doPageUp(){
	if(grid_offset - max_grid_slot >= 0){ //there's previous page
		//page up
		grid_offset -= max_grid_slot;
		loadFullGrid(grid_offset);
		//decrease the page counter
		page_pos--;
		if(page_pos == 1) {
			document.getElementById("footer_img").style.background="../images/svod_footer1_" + lang + ".gif";
			document.getElementById("uplogo").src="../images/svod_up_dim.gif";
			document.getElementById("downlogo").src="../images/svod_down_nor.gif";
		}
		else {
			document.getElementById("footer_img").style.background="../images/svod_footer2_" + lang + ".gif";
			document.getElementById("uplogo").src="../images/svod_up_nor.gif";
			document.getElementById("downlogo").src="../images/svod_down_nor.gif";
		}
	}
}
function keyEvent(keyCode) {
	
	if(538 > keyCode && keyCode > 527) {
		var in_cat = keyCode-528;
		if(in_cat == 0){
			in_cat = 10;
		}
		if(in_cat == catLength+1){
			cat_pos = in_cat;
		}
		else if (in_cat <= catLength) {
			cat_pos = in_cat;
			//iptvSetNonVolatileData("genre", cat_pos);
			window.parent.location.href="vodlanding.jsp?stbid="+tmp_stbid+"&stbsid="+tmp_session_id+"&fsa="+fsaid+"&cat="+cat_pos;
		}
	}
	else if(keyCode == KEY_ENTER){
		if (library_list[grid_pos+grid_offset]) {
			//iptvSetNonVolatileData("genre", cat_pos);
			var targetUrl = library_list[grid_pos+grid_offset].imageUri.replace("{lang}",lang == "c"?"cn":"en");
			window.parent.location.href=targetUrl+"&stbid="+stbid+"&fsa="+fsaid;
		}
	}
	else if(keyCode == KEY_BACK) {
	}
	else if(keyCode == KEY_RED) {
	}
	else if(keyCode == KEY_YELLOW) {
		doPageDown();
	}
	else if(keyCode == KEY_BLUE) {
		doPageUp();
	}
	else if(keyCode == KEY_DOWN) {
		if(grid_pos > 8){ //cusor in second row
			if(grid_offset + max_grid_slot < num_of_product){ //there's next page
				//page down
				grid_offset += max_grid_slot;
				loadFullGrid(grid_offset);
				//increase the page counter
				page_pos++;
				//recover the cusor in last page
				turnOffGrid(grid_pos);
				grid_pos -= 9;
				while(grid_offset+grid_pos > num_of_product - 1){
					grid_pos--;
				}
				turnOnGrid(grid_pos);
				if(page_pos == max_page) {
					document.getElementById("footer_img").style.background="../images/svod_footer3_" + lang + ".gif";
					document.getElementById("uplogo").src="../images/svod_up_nor.gif";
					document.getElementById("downlogo").src="../images/svod_down_dim.gif";
				}
				else {
					document.getElementById("footer_img").style.background="../images/svod_footer2_" + lang + ".gif";
					document.getElementById("uplogo").src="../images/svod_up_nor.gif";
					document.getElementById("downlogo").src="../images/svod_down_nor.gif";
				}
			}
		}
		else{
			if(grid_pos < 9){ //cusor in first row
				if(grid_offset+grid_pos+3 > num_of_product - 1){
					//do nothing
				}
				else{
					//move cusor down
					turnOffGrid(grid_pos);
					grid_pos += 3;
					turnOnGrid(grid_pos);
				}
			}
		}
	}
	else if(keyCode == KEY_UP) {
		if(grid_pos < 3){ //cusor in first row
			if(grid_offset - max_grid_slot >= 0){ //there's previous page
				//page up
				grid_offset -= max_grid_slot;
				loadFullGrid(grid_offset);
				//decrease the page counter
				page_pos--;
				//recover the cusor to second row
				turnOffGrid(grid_pos);
				grid_pos += 9;
				turnOnGrid(grid_pos);
				if(page_pos == 1) {
					document.getElementById("footer_img").style.background="../images/svod_footer1_" + lang + ".gif";
					document.getElementById("uplogo").src="../images/svod_up_dim.gif";
					document.getElementById("downlogo").src="../images/svod_down_nor.gif";
				}
				else {
					document.getElementById("footer_img").style.background="../images/svod_footer2_" + lang + ".gif";
					document.getElementById("uplogo").src="../images/svod_up_nor.gif";
					document.getElementById("downlogo").src="../images/svod_down_nor.gif";
				}
			}
		}
		else{
			if(grid_pos > 2 ){ //cusor in second row
				//move cusor up
				turnOffGrid(grid_pos);
				grid_pos -= 3;
				turnOnGrid(grid_pos);
			}
		}
	}
	else if(keyCode == KEY_LEFT) {
		if(grid_pos == 0){
			if(grid_offset - max_grid_slot >= 0){ //there's previous page
				//page up
				grid_offset -= max_grid_slot;
				loadFullGrid(grid_offset);
				//decrease the page counter
				page_pos--;
				//recover cusor to last slot
				turnOffGrid(grid_pos);
				grid_pos = max_grid_slot - 1;
				turnOnGrid(grid_pos);
				if(page_pos == 1) {
					document.getElementById("footer_img").style.background="../images/svod_footer1_" + lang + ".gif";
					document.getElementById("uplogo").src="../images/svod_up_dim.gif";
					document.getElementById("downlogo").src="../images/svod_down_nor.gif";
				}
				else {
					document.getElementById("footer_img").style.background="../images/svod_footer2_" + lang + ".gif";
					document.getElementById("uplogo").src="../images/svod_up_nor.gif";
					document.getElementById("downlogo").src="../images/svod_down_nor.gif";
				}
			}
		}
		else{
			if(grid_pos > 0){ //LHS have space to shift cusor
				//move cusor to RHS
				turnOffGrid(grid_pos);
				grid_pos--;
				turnOnGrid(grid_pos);
			}
		}
	}
	else if(keyCode == KEY_RIGHT) {
		if(grid_pos == max_grid_slot - 1){
			if(grid_offset + max_grid_slot < num_of_product){ //there's next page
				//page down
				grid_offset += max_grid_slot;
				loadFullGrid(grid_offset);
				//increase the page counter
				page_pos++;
				//recover cusor to first slot
				turnOffGrid(grid_pos);
				grid_pos = 0;
				turnOnGrid(grid_pos);
				if(page_pos == max_page) {
					document.getElementById("footer_img").style.background="../images/svod_footer3_" + lang + ".gif";
					document.getElementById("uplogo").src="../images/svod_up_nor.gif";
					document.getElementById("downlogo").src="../images/svod_down_dim.gif";
				}
				else {
					document.getElementById("footer_img").style.background="../images/svod_footer2_" + lang + ".gif";
					document.getElementById("uplogo").src="../images/svod_up_nor.gif";
					document.getElementById("downlogo").src="../images/svod_down_nor.gif";
				}
			}
		}
		else{
			if(grid_offset+grid_pos < num_of_product - 1){ //-1 for indexing
				turnOffGrid(grid_pos);
				grid_pos++;
				turnOnGrid(grid_pos);
			}
		}
	}
}



