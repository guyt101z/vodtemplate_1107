var globalSVODLock = iptvGetNonVolatileData("g_svl");
var restrictedSVODLock = iptvGetNonVolatileData("r_svl");
var max_show_episode = 5;
var current_show_episode = max_show_episode;
//It is the "item0"'s "series_prodcut_array" index
var current_first_item_series_pos = 0;
//It is the current position in the layout of item0,1,2,3,4
var current_item_pos = 0;
var default_series_template = "LIST_TEMPLATE";
var series_template = "";
var urlparamAppend = "";

function load() {
	document.getElementById("logo").src="/vodtemplate/data/"+catId+"/"+logo_file;
	if (seriesId != "null" && seriesId != "") {
        	for (var i = 0; i < series_array.length; i++) {
                	if (seriesId == series_array[i].id){
                        	series_template = series_array[i].style;
                                break;
                        }
                }
                if (series_template == "" || series_template == null) {
                	series_template = default_series_template;
                }
                document.getElementById(series_template).className=null;

		if (seriesProductId != "" && seriesProductId != "null") {
			for (var i = 0;i < series_product_array.length; i++){
				if (seriesProductId == series_product_array[i].id) {
					if (series_product_array.length <= max_show_episode) {
						current_item_pos=i;
						break;
					} else {
						current_first_item_series_pos = i;
						if (current_first_item_series_pos == 1) {
							current_first_item_series_pos--;
		                	                current_item_pos=1;
						} else if (current_first_item_series_pos > series_product_array.length - (max_show_episode - 1)){
							current_item_pos = current_first_item_series_pos - (series_product_array.length - (max_show_episode -1));
							current_first_item_series_pos = series_product_array.length - (max_show_episode - 1);
						}
						break;
					}
				}
			}
		}
		if (series_template == "LIST_TEMPLATE") {
			generate_LIST_TEMPLATE_EpisodeLayout();
		}
	}
	updateDetail();
}

function updateDetail(){
        if (series_product_array.length > 0){
                var current_selected_series_product = series_product_array[current_first_item_series_pos+current_item_pos];
                duration = current_selected_series_product.duration;
                name_chi = current_selected_series_product.name_chi;
                name_eng = current_selected_series_product.name_eng;
                cast_chi = current_selected_series_product.cast_chi;
                cast_eng = current_selected_series_product.cast_eng;
                synopsis_chi = digestString(current_selected_series_product.synopsis_chi, 135);
                synopsis_eng = digestString(current_selected_series_product.synopsis_eng, 135);
                sd_image1_file = current_selected_series_product.sd_image1_file;
                is_sd = current_selected_series_product.is_sd;
                is_hd = current_selected_series_product.is_hd;
                language_eng = current_selected_series_product.language_eng;
                language_chi = current_selected_series_product.language_chi;
                classification = current_selected_series_product.classification;
        }
        if (language == "zh_tw"){
                document.getElementById("title").innerHTML = digestString(name_chi,27);
                if (duration == "" || duration == null) {
                        document.getElementById("duration").innerHTML = "--";
                } else {
                        document.getElementById("duration").innerHTML = duration+" ╓юда";
                }
                document.getElementById("language").innerHTML = language_chi;
                document.getElementById("cast").innerHTML = cast_chi;
                document.getElementById("synopsis").innerHTML = digestString(synopsis_chi,220);
                document.getElementById("poster").src = "/vod/poster/sd/cn/"+sd_image1_file;
                document.getElementById("disclaimer").innerHTML = disclaimer_chi;
        }
        else {
                document.getElementById("title").innerHTML = digestString(name_eng,27);
                if (duration == "" || duration == null) {
                        document.getElementById("duration").innerHTML = "--";
                } else {
                        document.getElementById("duration").innerHTML = duration+" mins";
                }
                document.getElementById("language").innerHTML = language_eng;
                document.getElementById("cast").innerHTML = cast_eng;
                document.getElementById("synopsis").innerHTML = digestString(synopsis_eng,150);
                document.getElementById("poster").src = "/vod/poster/sd/en/"+sd_image1_file;
                document.getElementById("disclaimer").innerHTML = disclaimer_eng;
        }
        if (is_sd && !is_hd) {
                document.getElementById("hdpic").src = "images/spacer.gif";
                document.getElementById("sdpic").src = "images/"+styleId+"/SD.png";
        } else if (!is_sd && is_hd) {
                document.getElementById("hdpic").src = "images/"+styleId+"/HD.png";
                document.getElementById("sdpic").src = "images/spacer.gif";
        } else if (is_sd && is_hd) {
                document.getElementById("hdpic").src = "images/"+styleId+"/HD.png";
                document.getElementById("sdpic").src = "images/"+styleId+"/SD.png";
        }
        if (classification != null && classification != ""){
                document.getElementById("classification").innerHTML = classification;
                //document.getElementById("classTable").style.background = "images/"+styleId+"/classicification_"+classification+".png";
                document.getElementById("classTable").style.background = "images/"+styleId+"/classicification.png";
        }
        else{
                document.getElementById("classification").innerHTML = "";
		document.getElementById("classTable").style.background = "images/spacer.gif";
        }
}

function generate_LIST_TEMPLATE_EpisodeLayout(){
	current_show_episode = Math.min(max_show_episode, series_product_array.length);
	if (series_product_array[current_first_item_series_pos - 2]!= null) {
		document.getElementById("morePlanUp").className="morePlanUp morePlan_show";
                if (language == "zh_tw") {
                	document.getElementById("morePlanUp_row1").innerHTML=series_product_array[current_first_item_series_pos - 1].episode_name_chi;
                } else {
                        document.getElementById("morePlanUp_row1").innerHTML=series_product_array[current_first_item_series_pos - 1].episode_name_eng;
                }
                current_show_episode -= 1;
        } else {
		document.getElementById("morePlanUp").className="morePlan_hide";
		document.getElementById("morePlanUp_row1").innerHTML="";
	}
        if (series_product_array[current_first_item_series_pos + current_show_episode] != null) {
                current_show_episode -= 1;
        	document.getElementById("morePlanDown").className="morePlanDown morePlan_show";
                if (language == "zh_tw") {
                	document.getElementById("morePlanDown_row1").innerHTML=series_product_array[current_first_item_series_pos + current_show_episode].episode_name_chi;
                } else {
                        document.getElementById("morePlanDown_row1").innerHTML=series_product_array[current_first_item_series_pos + current_show_episode].episode_name_eng;
                }
        } else {
		document.getElementById("morePlanDown").className="morePlan_hide";
		document.getElementById("morePlanDown_row1").innerHTML="";
	}
        for (var k = 0; k < max_show_episode; k++) {
		if (k < current_show_episode && series_product_array[k+current_first_item_series_pos] != null) {
                	if (language == "zh_tw") {
                        	document.getElementById("item"+k+"_row2").innerHTML = series_product_array[k+current_first_item_series_pos].episode_name_chi;
                        } else {
                                document.getElementById("item"+k+"_row2").innerHTML = series_product_array[k+current_first_item_series_pos].episode_name_eng;
                        }
                        document.getElementById("item"+k).className="morePlan_show";
                        document.getElementById("item"+k+"_row1").className = "unselect01 morePlan_show";
                        document.getElementById("item"+k+"_row2").className = "unselect02 morePlan_show";
		}
                else {
                	document.getElementById("item"+k).className="morePlan_hide";
                	document.getElementById("item"+k+"_row1").className="morePlan_hide";
                	document.getElementById("item"+k+"_row2").className="morePlan_hide";
			document.getElementById("item"+k+"_row2").innerHTML="";
		}
	}
	highlightItem(current_item_pos);
}

function highlightItem(item_pos){
	document.getElementById("item"+item_pos).className="morePlan_show";
	document.getElementById("item"+item_pos+"_row1").className="select01 morePlan_show";
	document.getElementById("item"+item_pos+"_row2").className="select02 morePlan_show";
}

function dimItem(item_pos){	
	document.getElementById("item"+item_pos+"_row1").className="unselect01 morePlan_show";
	document.getElementById("item"+item_pos+"_row2").className="unselect02 morePlan_show";
}


function keyEvent(keyCode) {
	if(keyCode == KEY_ENTER){	
		if (seriesId != "" && seriesId != "null") {
			urlparamAppend="&seriesproductid="+series_product_array[current_first_item_series_pos+current_item_pos].id+"&scheduleid="+series_product_array[current_first_item_series_pos+current_item_pos].schedule_id;
		}	
		if(libsubscribed == "true"){ //subscribed
			window.parent.location.href="checkFlags.jsp?"+urlparam+urlparamAppend;
		} else {
			window.parent.location.href = "planlist.jsp?"+urlparam+urlparamAppend;
		}
	} else if(keyCode == KEY_BACK){
		if(backURL == null||backURL == ""||backURL == "null"){
			//backURL = "index.jsp?lang="+language+"&catId="+catId+"&version="+version+"&libId="+libId+"&styleId="+styleId+"&";
			backURL = "index.jsp";
		}
		window.parent.location.href=backURL+"?"+urlparam;
	} else if(keyCode == KEY_GREEN){
		if (seriesId != "" && seriesId != "null") {
                        urlparamAppend="&seriesproductid="+series_product_array[current_first_item_series_pos+current_item_pos].id+"&scheduleid="+series_product_array[current_first_item_series_pos+current_item_pos].schedule_id;
                }
		window.parent.location.href="class.jsp?referrer="+backURL+"&"+urlparam+urlparamAppend;
	} else if(keyCode == KEY_BLUE){
		if (seriesId != "" && seriesId != "null") {
                        urlparamAppend="&seriesproductid="+series_product_array[current_first_item_series_pos+current_item_pos].id+"&scheduleid="+series_product_array[current_first_item_series_pos+current_item_pos].schedule_id;
                }
		window.parent.location.href="t_c.jsp?referrer="+backURL+"&"+urlparam+urlparamAppend;

	} else if(keyCode == KEY_UP){
		if (current_item_pos > 0) {
			dimItem(current_item_pos);
			highlightItem(--current_item_pos);
		} else if (series_product_array[current_first_item_series_pos-1] != null) {
			current_first_item_series_pos--;
			if (current_first_item_series_pos == 1) {
				current_first_item_series_pos--;
				current_item_pos++;
			}
			generate_LIST_TEMPLATE_EpisodeLayout();
		}
		updateDetail();
	} else if (keyCode == KEY_DOWN){
		if (current_item_pos+1 < current_show_episode) {
			dimItem(current_item_pos);
			highlightItem(++current_item_pos);
		} else if (series_product_array[current_first_item_series_pos+current_show_episode] != null) {
			current_first_item_series_pos++;
			if (current_first_item_series_pos == 1){	
				current_first_item_series_pos++;
				current_item_pos--;
			}
			generate_LIST_TEMPLATE_EpisodeLayout();
		}	
		updateDetail();
	}
}
