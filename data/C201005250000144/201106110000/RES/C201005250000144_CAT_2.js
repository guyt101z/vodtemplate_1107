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

var cat_id="C201005250000139";
var catname_eng="New Release";
var catname_chi="&#26368;&#26032;&#25512;&#20171;";
var disclaimer_eng="Some programs are only suitable for viewing by adults only. You are responsible for selecting and setting your own parental lock preference via the Settings page.";
var disclaimer_chi="&#37096;&#20221;&#31680;&#30446;&#21482;&#36969;&#21512;&#25104;&#20154;&#35264;&#30475;&#12290;&#38307;&#19979;&#38656;&#26044; &ldquo;&#35373;&#23450;&rdquo; &#29256;&#38754;&#36984;&#25799;&#21450;&#35373;&#23450;&#20854;&#23478;&#38263;&#37782;&#23450;&#21151;&#33021; &#12290;";
var isadult=N;
var islock=N;

var product_array = new Array();
product_array[0] = new product("201006020000498", "Mamma Mia! PPV", "&#23229;&#23229;&#21674;&#21568;&#65281; PPV", "Meryl Streep", "&#26757;&#33673;&#21490;&#32736;&#26222;", "201006020000498_1.jpg");

var series_array = new Array();
series_array[0] = new series("S201105300000001", "MH_NBCU_Series_1", "MH_NBCU_Series_1", "MH_NBCU_Series_Actor", "MH_NBCU_Series_Actor", "S201105300000001_1.jpg");
