iptvRegisterKeyHandler(keyEvent);
var max_grid_slot = 6;
var num_of_product = product_array.length;
var max_page = countPage(num_of_product,max_grid_slot);
var tmp_stbid = iptvGetSTBID();
var tmp_session_id = iptvGetSTBSessionID();
var stbid = tmp_stbid + "_" + tmp_session_id;
var max_cat = cat_arr.length;

function load() {
	MM_preloadImages(
	'../../images/footer_acbalance_e.jpg',
	'../../images/footer_acbalance_next_e.jpg',
	'../../images/footer_acbalance_pre_e.jpg',
	'../../images/footer_acbalance_pre_next_e.jpg',
	'../../images/movie_bg_on.png'
	);
	if(k > 0){
		grid_pos = k%6;
		grid_offset = k - grid_pos;
		page_pos = ((k - grid_pos)/6) + 1;
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
	loadFullGrid(grid_offset);
	turnOnCat(cat_pos);
	turnOnGrid(grid_pos);
}
function turnOffCat(pos) {
	document.getElementById("leftslot"+pos).className="cateUnSelect";
	document.getElementById("leftgfx"+pos).src="../../images/cateicon0"+pos+"_unselect.png";
}
function turnOnCat(pos) {
	document.getElementById("leftslot"+pos).className="cateSelect";
	document.getElementById("leftgfx"+pos).src="../../images/cateicon0"+pos+"_select.png";
}
function turnOffGrid(pos) {
	document.getElementById("rightslot"+pos).className="movieUnSelect";
}
function turnOnGrid(pos) {
	document.getElementById("rightslot"+pos).className="movieSelect";
}
function loadFullGrid(offset){
	for(var i=0; i < max_grid_slot; i++){
		if(i+offset < num_of_product){
			loadGrid(i,product_array[i+offset].poster,product_array[i+offset].name);
		}
		else{
			loadGrid(i,"../../images/spacer.gif","");
		}
	}
}
function loadGrid(pos,poster,name){
	document.getElementById("rightgfx"+pos).src="/vod/poster/sd/en/"+poster;
	document.getElementById("name"+pos).innerHTML=digestString(name,22);
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
		writePageNum(page_pos+"/"+max_page);
		//recover the cusor in last page
		turnOffGrid(grid_pos);
		while(grid_offset+grid_pos > num_of_product - 1){
			grid_pos--;
		}
		turnOnGrid(grid_pos);
		if(page_pos == max_page) document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_e.jpg";
		else document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_next_e.jpg";
	}
}
function doPageUp(){
	if(grid_offset - max_grid_slot >= 0){ //there's previous page
		//page up
		grid_offset -= max_grid_slot;
		loadFullGrid(grid_offset);
		//decrease the page counter
		page_pos--;
		writePageNum(page_pos+"/"+max_page);
		if(page_pos == 1) document.getElementById("footer_img").style.background="../../images/footer_acbalance_next_e.jpg";
		else document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_next_e.jpg";
	}
}
function keyEvent(keyCode) {

	if(538 > keyCode && keyCode > 527) {
		var in_cat = keyCode-528;
		if(in_cat == 0){
			in_cat = 10;
		}
		if(in_cat == max_cat+1){
			cat_pos = in_cat;
			window.parent.location.href="myplaylist.jsp?cat="+cat_pos+"&"+urlparam;
		}
		else if (in_cat <= max_cat) {
			cat_pos = in_cat;
			window.parent.location.href="grid_view.jsp?cat="+cat_pos+"&"+urlparam;
		}
	}
	else if(keyCode == KEY_ENTER){
		window.parent.location.href="detail.jsp?cat="+cat_pos+"&productid="+product_array[grid_pos+grid_offset].id+"&referrer=grid_view.jsp&"+urlparam;
	}
	else if(keyCode == KEY_BACK) {
		//window.parent.location.href="http://visvod.netvigator.com/jsp/en/svod/sd_landing_mh.jsp?stbid="+stbid;
		window.parent.location.href="http://visvod.netvigator.com/jsp/en/svod/sd_landing.jsp?stbid="+stbid;
	}
	else if(keyCode == KEY_RED) {
		//window.parent.location.href="top_up_menu.jsp?stbid="+tmp_stbid+"&sid="+tmp_session_id;
		window.parent.location.href="top_up_menu.jsp?referrer=grid_view.jsp&cat="+cat_pos+"&productid="+product_array[grid_pos+grid_offset].id;
		//window.parent.location.href="top_up_menu.jsp?referrer=grid_view.jsp&cat=1";
	}
	else if(keyCode == KEY_YELLOW) {
		doPageDown();
	}
	else if(keyCode == KEY_BLUE) {
		doPageUp();
	}
	else if(keyCode == KEY_DOWN) {
		if(grid_pos > 2){ //cusor in second row
			if(grid_offset + max_grid_slot < num_of_product){ //there's next page
				//page down
				grid_offset += max_grid_slot;
				loadFullGrid(grid_offset);
				//increase the page counter
				page_pos++;
				writePageNum(page_pos+"/"+max_page);
				//recover the cusor in last page
				turnOffGrid(grid_pos);
				grid_pos -= 3;
				while(grid_offset+grid_pos > num_of_product - 1){
					grid_pos--;
				}
				turnOnGrid(grid_pos);
				if(page_pos == max_page) document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_e.jpg";
				else document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_next_e.jpg";
			}
		}
		else{
			if(grid_pos < 3){ //cusor in first row
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
				writePageNum(page_pos+"/"+max_page);
				//recover the cusor to second row
				turnOffGrid(grid_pos);
				grid_pos += 3;
				turnOnGrid(grid_pos);
				if(page_pos == 1) document.getElementById("footer_img").style.background="../../images/footer_acbalance_next_e.jpg";
				else document.getElementById("footer_img").style.background="../../images/footer_acbalance_pre_next_e.jpg";
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
				writePageNum(page_pos+"/"+max_page);
				//recover cusor to last slot
				turnOffGrid(grid_pos);
				grid_pos = max_grid_slot - 1;
				turnOnGrid(grid_pos);
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
				writePageNum(page_pos+"/"+max_page);
				//recover cusor to first slot
				turnOffGrid(grid_pos);
				grid_pos = 0;
				turnOnGrid(grid_pos);
			}
		}
		else{
			if(grid_offset+grid_pos < num_of_product - 1){ //-1 for indexing
				//move cusor to RHS
				turnOffGrid(grid_pos);
				grid_pos++;
				turnOnGrid(grid_pos);
			}
		}
	}
}



