function product(id, name_eng, name_chi, cast_eng, cast_chi, sd_image1_file) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
this.cast_eng = cast_eng;
this.cast_chi = cast_chi;
this.sd_image1_file = sd_image1_file;
}

function series(id, name_eng, name_chi, sd_image1_file, style) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
this.sd_image1_file = sd_image1_file;
this.style = style;
}

var cat_id="C201005250000142";
var catname_eng="Features";
var catname_chi="&#36067;&#24231;&#31934;&#36984;";
var disclaimer_eng="";
var disclaimer_chi="";
var isadult=N;
var islock=N;

var product_array = new Array();
product_array[0] = new product("201011160001183", "test_201011161008", "test_201011161008", "null", "null", "");
product_array[1] = new product("201011170001222", "test_201011161458", "test_201011161458", "null", "null", "201011170001222_1.png");
product_array[2] = new product("201011170001233", "test_201011161520", "test_201011161520", "null", "null", "201011170001233_1.png");
product_array[3] = new product("201011160001203", "test_201011161057", "test_201011161057", "null", "null", "");

var series_array = new Array();
