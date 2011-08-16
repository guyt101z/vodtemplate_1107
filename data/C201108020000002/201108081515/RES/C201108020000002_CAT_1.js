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

var cat_id="C201108020000002";
var catname_eng="Rugby Union World Cup";
var catname_chi="Rugby Union World Cup";
var disclaimer_eng="";
var disclaimer_chi="";
var isadult=false;
var islock=false;

var product_array = new Array();
product_array[0] = new product("201004210000197", "Rugby video quality testing", "&#27204;&#27414;&#29699;&#35222;&#38971;&#36074;&#37327;&#28204;&#35430;", "--", "--", "", false, false, false, "201004210000381", "201904210000381", true, "");
product_array[1] = new product("201108030008502", "Rugby HSD testing", "Rugby HSD testing C", "--", "--", "", false, false, false, "201108030008382", "20120824235900", true, "");
product_array[2] = new product("201004210000197", "Rugby WC match 1", "&#27204;&#27414;&#29699;&#19990;&#30028;&#26479;&#27604;&#36093;1", "--", "--", "", false, false, false, "201004210000381", "20120824235900", true, "");
product_array[3] = new product("201108030008522", "Rugby WC match 2", "&#27204;&#27414;&#29699;&#19990;&#30028;&#26479;&#27604;&#36093;2", "--", "--", "", false, false, false, "201004210000381", "20120816235900", true, "");
product_array[4] = new product("201108030008523", "Rugby WC match 3", "&#27204;&#27414;&#29699;&#19990;&#30028;&#26479;&#27604;&#36093;3", "--", "--", "", false, false, false, "201108030008383", "20120823235900", true, "");
product_array[5] = new product("201108030008503", "Rugby WC match 4", "&#27204;&#27414;&#29699;&#19990;&#30028;&#26479;&#27604;&#36093;4", "--", "--", "", false, false, false, "201108030008384", "20120824235900", true, "");
product_array[6] = new product("201108030008541", "Rugby WC match 5", "&#27204;&#27414;&#29699;&#19990;&#30028;&#26479;&#27604;&#36093;5", "--", "--", "", false, false, false, "201108030008385", "20120831235900", true, "");
product_array[7] = new product("201108030008542", "Rugby WC match 6", "&#27204;&#27414;&#29699;&#19990;&#30028;&#26479;&#27604;&#36093;6", "--", "--", "", false, false, false, "201108030008421", "20120817235900", true, "");
product_array[8] = new product("201108030008543", "Rugby long HK words", "&#39938;&#39770;&#28044; &#28145;&#27700;&#22487; &#21704;&#22217;&#21890; &#25779;&#37666; &#26519;&#23791; &#39938;&#39770;&#28044; &#28145;&#27700;&#22487; &#21704;&#22217;&#21890; &#25779;&#37666; &#26519;&#23791;&#25779;&#37666;", "--", "--", "", false, false, false, "201108030008422", "20120831235900", true, "");
product_array[9] = new product("201108030008504", "Rugby Testing As Long As Possible Program Name and Episode Name and Episode Details T", "&#25105;&#35201;&#35430;&#26377;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#31680;&#30446;&#21517; &#65292;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#21127;&#38598;&#21517; &#65292;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#21633;&#38263;&#24471;&#21633;&#38263;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#21127;&#38598;&#20839;&#23481;", "--", "--", "", false, false, false, "201108030008441", "20120802235900", true, "");
product_array[10] = new product("201108030008561", "Rugby SD asset only D-Order 99", "Rugby SD asset only D-Order 99C", "--", "--", "", false, false, false, "201108030008442", "20120831235900", true, "");

var series_array = new Array();
