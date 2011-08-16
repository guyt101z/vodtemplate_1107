iptvRegisterKeyHandler(keyEvent);
var cat_style = cat_list[cat_pos-1].cat_style;
//For default setting
if (cat_style == "" || cat_style == null){
	cat_style = "GRID_TEMPLATE";
}
var max_grid_slot = 6;
var num_of_product = product_array.length + series_array.length;
var max_page = countPage(num_of_product,max_grid_slot);
var tmp_stbid = iptvGetSTBID();
var tmp_session_id = iptvGetSTBSessionID();
var stbid = tmp_stbid + "_" + tmp_session_id;
var max_cat = cat_list.length;
var current_view = cat_style;
var user_selected_view = iptvGetNonVolatileData("view");
var current_product = "";
var page_pos = 1;
var grid_pos = 0;
var grid_offset = 0;

function load() {
	if (cat_style.indexOf("LIST") > 0 || cat_style.indexOf("GRID") > 0){
                if (user_selected_view == "" || user_selected_view == null) {
                        current_view = cat_style;
                } else if (user_selected_view.indexOf("GRID") == 0){
                        current_view = user_selected_view;
                } else if (user_selected_view.indexOf("LIST") == 0){
                        window.parent.location.href="list_view.jsp?cat="+cat_pos+"&"+urlparam;
                }
        } else if (cat_style.indexOf("LIST") == 0) {
                window.parent.location.href="list_view.jsp?cat="+cat_pos+"&"+urlparam;
        }

	document.getElementById("logo").src="/vodtemplate/data/"+catId+"/"+logo_file;
	if(k > 0){
		grid_pos = k % max_grid_slot;
		grid_offset = k - grid_pos;
		page_pos = ((k - grid_pos) / max_grid_slot) + 1;
	}

	/*if (current_view == "") {
		current_view = cat_style;
		iptvSetNonVolatileData("view", current_view);
		if (cat_style.indexOf('LIST') == 0) {
			window.parent.location.href="list_view.jsp?cat="+cat_pos+"&"+urlparam;
		}
	}	
	*/
	MM_preloadImages(
	'images/'+styleId+'/'+language+'/'+current_view+'/footer_next.jpg',
	'images/'+styleId+'/'+language+'/'+current_view+'/footer_pre.jpg',
	'images/'+styleId+'/'+language+'/'+current_view+'/footer_pre_next.jpg',
	'images/'+styleId+'/'+language+'/'+current_view+'/footer.jpg',
	'images/movie_bg_on.png'
	);

	if(max_page > 1 && page_pos == 1) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_next.jpg";
	else if(max_page > 1 && max_page == page_pos) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre.jpg";
	else if(max_page > 2 && max_page > page_pos) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre_next.jpg";
	else document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer.jpg";
	
	for(var j=1; j<11; j++){
		if (j - 1  >= cat_list.length) {
			document.getElementById("leftgfx"+j).src="images/spacer.gif";
			document.getElementById("lefttxt"+j).innerHTML="";
		} else {
			if (j==cat_pos) {
				turnOnCat(cat_pos);
			} else {
				document.getElementById("leftgfx"+j).src="images/"+styleId+"/cateicon0"+j+"_unselect.png";
			}
			if (language == "zh_tw") {
				document.getElementById("lefttxt"+j).innerHTML=cat_list[j-1].catname_chi;
			}
			else { 
				document.getElementById("lefttxt"+j).innerHTML=cat_list[j-1].catname_eng;
			}
		}
	}
	if(max_page < 1){
		writePageNum("-");
	}
	else{
		writePageNum(page_pos+"/"+max_page);
	}
	loadFullGrid(grid_offset);
	turnOnGrid(grid_pos);
}
function turnOffCat(pos) {
	document.getElementById("leftslot"+pos).className="cateUnSelect";
	document.getElementById("leftgfx"+pos).src="images/"+styleId+"/cateicon0"+pos+"_unselect.png";
}
function turnOnCat(pos) {
	document.getElementById("leftslot"+pos).className="cateSelect";
	document.getElementById("leftgfx"+pos).src="images/"+styleId+"/cateicon0"+pos+"_select.png";
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
			current_product = product_array[i+offset];
			if (current_product == null){
				current_product = series_array[i+offset-product_array.length];			
			}
			if (language == "zh_tw") {
				loadGrid(i,current_product.sd_image1_file,current_product.name_chi);
			}
			else {
				loadGrid(i,current_product.sd_image1_file,current_product.name_eng);
			}
		}
		else{
			loadGrid(i,"images/spacer.gif","");
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
		if(page_pos == max_page) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre.jpg";
		else document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre_next.jpg";
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
		if(page_pos == 1) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_next.jpg";
		else document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre_next.jpg";
	}
}
function keyEvent(keyCode) {
	if(538 > keyCode && keyCode > 527) {
		var in_cat = keyCode-528;
		if(in_cat == 0){
			in_cat = 10;
		}
		if(in_cat <= max_cat){
			cat_pos = in_cat;
			//Should be IMPROVE if more than 2 styles
			var selected_cat_style = cat_list[cat_pos-1].cat_style;
			if (user_selected_view != "" && user_selected_view != null && (selected_cat_style.indexOf("GRID") > 0 || selected_cat_style.indexOf("LIST") > 0)) {
                                if (user_selected_view.indexOf("GRID") == 0){
                                        window.parent.location.href="grid_view.jsp?cat="+cat_pos+"&"+urlparam;
					return;
                                } else if (user_selected_view.indexOf("LIST") == 0){
                                        window.parent.location.href="list_view.jsp?cat="+cat_pos+"&"+urlparam;
					return;
                                }
                        }
                        if (selected_cat_style.indexOf("GRID") == 0) {
                                window.parent.location.href="grid_view.jsp?cat="+cat_pos+"&"+urlparam;
				return;
                        } else if (selected_cat_style.indexOf("LIST") == 0){
                                window.parent.location.href="list_view.jsp?cat="+cat_pos+"&"+urlparam;
				return;
                        }

		}
	}
	else if(keyCode == KEY_ENTER){
		current_product = product_array[grid_pos+grid_offset];
		if (current_product == null) {
			current_product = series_array[grid_pos+grid_offset-product_array.length];
			window.parent.location.href="detail.jsp?cat="+cat_pos+"&seriesid="+current_product.id+"&referrer=grid_view.jsp&"+urlparam;
		}
		else {
			window.parent.location.href="detail.jsp?cat="+cat_pos+"&productid="+current_product.id+"&referrer=grid_view.jsp&"+urlparam;
		}
	}
	else if(keyCode == KEY_BACK) {
		if (language == "zh_tw") {
			window.parent.location.href="http://visvod.netvigator.com/jsp/cn/svod/sd_landing.jsp?stbid="+stbid;
		}
		else {
			window.parent.location.href="http://visvod.netvigator.com/jsp/en/svod/sd_landing.jsp?stbid="+stbid;
		}
	}
	else if(keyCode == KEY_RED) {
		if (current_view.indexOf("LIST") > 0 || current_view.indexOf("GRID") > 0) {
			iptvSetNonVolatileData("view", "LIST_WITH_GRID_TEMPLATE");
			window.parent.location.href="list_view.jsp?cat="+cat_pos+"&"+urlparam;
		}
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
				if(page_pos == max_page) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre.jpg";
				else document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre_next.jpg";
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
				if(page_pos == 1) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_next.jpg";
				else document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre_next.jpg";
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
