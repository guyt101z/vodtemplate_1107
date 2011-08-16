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

var cat_id="C201002050000152";
var catname_eng="ISA (HD)";
var catname_chi="ISA (HD)";
var disclaimer_eng="Every match will be available for 4 weeks. Off-air time will be 11:59pm of the off-air date.";
var disclaimer_chi="&#27599;&#22580;&#36093;&#20107;&#25918;&#26144;&#26178;&#38291;&#28858;4&#26143;&#26399;&#12290;&#26368;&#24460;&#25773;&#25918;&#26178;&#38291;&#28858;&#26368;&#24460;&#25773;&#25918;&#26085;&#20043;&#26202;&#19978;11&#26178;59&#20998;&#12290;";
var isadult=false;
var islock=false;

var product_array = new Array();

var series_array = new Array();
