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

var cat_id="C201107010000005";
var catname_eng="Family";
var catname_chi="&#21512;&#23478;&#27489;";
var disclaimer_eng="";
var disclaimer_chi="";
var isadult=N;
var islock=N;

var product_array = new Array();
product_array[0] = new product("201107180012673", "The Powerpuff Girls E1", "&#39131;&#22825;&#23567;&#22899;&#35686; &#31532;1&#38598;", "--", "--", "201107180012673_1.jpg");
product_array[1] = new product("201107180012674", "The Powerpuff Girls E2", "&#39131;&#22825;&#23567;&#22899;&#35686; &#31532;2&#38598;", "--", "--", "201107180012674_1.jpg");
product_array[2] = new product("201107180012675", "The Powerpuff Girls E3", "&#39131;&#22825;&#23567;&#22899;&#35686; &#31532;3&#38598;", "--", "--", "201107180012675_1.jpg");
product_array[3] = new product("201107180012676", "The Powerpuff Girls E4", "&#39131;&#22825;&#23567;&#22899;&#35686; &#31532;4&#38598;", "--", "--", "201107180012676_1.jpg");

var series_array = new Array();
