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

var cat_id="C201107010000004";
var catname_eng="Adventure";
var catname_chi="&#20882;&#38570;";
var disclaimer_eng="";
var disclaimer_chi="";
var isadult=N;
var islock=N;

var product_array = new Array();
product_array[0] = new product("201107180012667", "The Life &amp; Times of Juniper Lee E1", "&#39764;&#27861;&#23569;&#22899; &#31532;1&#38598;", "--", "--", "201107180012667_1.jpg");
product_array[1] = new product("201107180012668", "The Life &amp; Times of Juniper Lee E2", "&#39764;&#27861;&#23569;&#22899; &#31532;2&#38598;", "--", "--", "201107180012668_1.jpg");

var series_array = new Array();
