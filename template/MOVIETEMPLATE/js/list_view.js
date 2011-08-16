iptvRegisterKeyHandler(keyEvent);
var cat_style = cat_list[cat_pos-1].cat_style;
//For default setting
if (cat_style == "" || cat_style == null){
        cat_style = "GRID_TEMPLATE";
}
var max_list_slot = 9;
var num_of_product = product_array.length+series_array.length;
var max_page = countPage(num_of_product,max_list_slot);
var tmp_stbid = iptvGetSTBID();
var tmp_session_id = iptvGetSTBSessionID();
var stbid = tmp_stbid + "_" + tmp_session_id;
var max_cat = cat_list.length;
var current_view = cat_style;
var user_selected_view = iptvGetNonVolatileData("view");
var current_product = "";
var page_pos = 1;
var list_pos = 0;
var list_offset = 0;
var product_id = "";
var series_id = "";

function load() {
	if (cat_style.indexOf("LIST") > 0 || cat_style.indexOf("GRID") > 0){
                if (user_selected_view == "" || user_selected_view == null) {
                        current_view = cat_style;
                } else if (user_selected_view.indexOf("GRID") == 0){
                        window.parent.location.href="grid_view.jsp?cat="+cat_pos+"&"+urlparam;
                } else if (user_selected_view.indexOf("LIST") == 0){
                        current_view = user_selected_view;
                }
        } else if (cat_style.indexOf("GRID") == 0) {
                window.parent.location.href="grid_view.jsp?cat="+cat_pos+"&"+urlparam;
        }

	document.getElementById("logo").src="/vodtemplate/data/"+catId+"/"+logo_file;

	if(k > 0){
                list_pos = k % max_list_slot;
                list_offset = k - list_pos;
                page_pos = ((k - list_pos) / max_list_slot) + 1;
        }

	MM_preloadImages(
	'images/'+styleId+'/'+language+'/'+current_view+'/footer.jpg',
	'images/'+styleId+'/'+language+'/'+current_view+'/footer_next.jpg',
	'images/'+styleId+'/'+language+'/'+current_view+'/footer_pre.jpg',
	'images/'+styleId+'/'+language+'/'+current_view+'/footer_pre_next.jpg',
	'images/list_box_on.png'
	);

	if(max_page > 1) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_next.jpg";
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
	turnOnCat(cat_pos);
	turnOn(list_pos);
	loadRightList(list_offset);
}
function loadRightList(offset){
	for(var i=0; i < max_list_slot; i++){
		if(i+offset < num_of_product){
			current_product = product_array[i+offset];
                        if (current_product == null){
                                current_product = series_array[i+offset-product_array.length];
                        }
			if (language == "zh_tw") {
				document.getElementById("name"+i).innerHTML=digestString(current_product.name_chi,20);
				document.getElementById("cast"+i).innerHTML=digestString(current_product.cast_chi,36);
			} else {
				document.getElementById("name"+i).innerHTML=digestString(current_product.name_eng,28);
				document.getElementById("cast"+i).innerHTML=digestString(current_product.cast_eng,52);
			}
			//document.getElementById("offAirDate"+i).innerHTML=digestString(product_array[i+offset].offAirDate,20);
		}
		else{
			document.getElementById("name"+i).innerHTML="";
			document.getElementById("cast"+i).innerHTML="";
			//document.getElementById("offAirDate"+i).innerHTML="";
		}
	}
}
function turnOn(pos) {
	document.getElementById("rightslot"+pos).className="selectPlaylist";
	document.getElementById("rightgfx"+pos).src="images/"+styleId+"/list_arrow.png";
}
function turnOff(pos) {
	document.getElementById("rightslot"+pos).className="unselectPlaylist";
	document.getElementById("rightgfx"+pos).src=null;
}
function turnOffCat(pos) {
	document.getElementById("leftslot"+pos).className="cateUnSelect";
	document.getElementById("leftgfx"+pos).src="images/"+styleId+"/cateicon0"+pos+"_unselect.png";
}
function turnOnCat(pos) {
	document.getElementById("leftslot"+pos).className="cateSelect";
	document.getElementById("leftgfx"+pos).src="images/"+styleId+"/cateicon0"+pos+"_select.png";
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
		if(page_pos == max_page) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre.jpg";
		else document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre_next.jpg";
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
		if(page_pos == 1) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_next.jpg";
		else document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre_next.jpg";
	}
}
function keyEvent(keyCode) {
	if(keyCode == KEY_RED) {
		if (current_view.indexOf("LIST") > 0 || current_view.indexOf("GRID") > 0) {
			iptvSetNonVolatileData("view", "GRID_WITH_LIST_TEMPLATE");
			window.parent.location.href="grid_view.jsp?cat="+cat_pos+"&"+urlparam;
		}
	}
	else if(keyCode == KEY_YELLOW) {
		doPageDown();
	}
	else if(keyCode == KEY_BLUE) {
		doPageUp();
	}
	else if(keyCode == KEY_ENTER){
		current_product = product_array[list_pos+list_offset];
                if (current_product == null) {
                        current_product = series_array[list_pos+list_offset-product_array.length];
			window.parent.location.href="detail.jsp?cat="+cat_pos+"&seriesid="+current_product.id+"&referrer=list_view.jsp&"+urlparam;;
                } else {
			window.parent.location.href="detail.jsp?cat="+cat_pos+"&productid="+current_product.id+"&referrer=list_view.jsp&"+urlparam;;
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
				if(page_pos == max_page) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre.jpg";
				else document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre_next.jpg";
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
				if(page_pos == 1) document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_next.jpg";
				else document.getElementById("footer_img").style.background="images/"+styleId+"/"+language+"/"+current_view+"/footer_pre_next.jpg";
			}
		}
	}
	else if(538 > keyCode && keyCode > 527) {
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
}
