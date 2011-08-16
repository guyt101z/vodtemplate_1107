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

var cat_id="C201107010000002";
var catname_eng="Action";
var catname_chi="&#21205;&#20316;";
var disclaimer_eng="";
var disclaimer_chi="";
var isadult=N;
var islock=N;

var product_array = new Array();
product_array[0] = new product("201107180012647", "Ben 10 E1", "Ben 10 &#31532;1&#38598;", "--", "--", "201107180012647_1.jpg");
product_array[1] = new product("201107180012648", "Ben 10 E2", "Ben 10 &#31532;2&#38598;", "--", "--", "201107180012648_1.jpg");
product_array[2] = new product("201107180012649", "Ben 10 E3", "Ben 10 &#31532;3&#38598;", "--", "--", "201107180012649_1.jpg");
product_array[3] = new product("201107180012650", "Ben 10 E4", "Ben 10 &#31532;4&#38598;", "--", "--", "201107180012650_1.jpg");
product_array[4] = new product("201107180012658", "Hero 108 E1", "&#27700;&#28779;108 &#31532;1&#38598;", "--", "--", "201107180012658_1.jpg");
product_array[5] = new product("201107180012659", "Hero 108 E2", "&#27700;&#28779;108 &#31532;2&#38598;", "--", "--", "201107180012659_1.jpg");

var series_array = new Array();
