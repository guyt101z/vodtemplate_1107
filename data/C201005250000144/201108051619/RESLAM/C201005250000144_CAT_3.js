function product(id, name_eng, name_chi, cast_eng, cast_chi, sd_image1_file) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
this.cast_eng = cast_eng;
this.cast_chi = cast_chi;
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

var cat_id="C201101020000310";
var catname_eng="nbcu_01031_2";
var catname_chi="nbcu_01031_2";
var disclaimer_eng="";
var disclaimer_chi="";
var isadult=false;
var islock=false;

var product_array = new Array();
product_array[0] = new product("201007130000530", "HD only PPV", "HD only PPV", "HD", "HD", "201007130000530_1.jpg");

var series_array = new Array();
