function product(id, name_eng, name_chi, cast_eng, cast_chi, classification, is_adult, is_lock, is_restricted, schedule_id, end_time, is_onair, sd_image1_file) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
this.cast_eng = cast_eng;
this.cast_chi = cast_chi;
this.classification = classification;
this.is_adult = is_adult;
this.is_lock = is_lock;
this.is_restricted = is_restricted;
this.schedule_id = schedule_id;
this.end_time = end_time;
this.is_onair = is_onair;
this.sd_image1_file = sd_image1_file;
}

function series(id, name_eng, name_chi, cast_eng, cast_chi, sd_image1_file, style) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
this.cast_eng = cast_eng;
this.cast_chi = cast_chi;
this.sd_image1_file = sd_image1_file;
this.style = style;
}

var cat_id="C481";
var catname_eng="Drama";
var catname_chi="&#21127;&#24773;";
var disclaimer_eng="";
var disclaimer_chi="";
var isadult=false;
var islock=false;

var product_array = new Array();

var series_array = new Array();
