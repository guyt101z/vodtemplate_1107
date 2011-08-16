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

var cat_id="C201008310000173";
var catname_eng="Drama";
var catname_chi="&#21127;&#24773;";
var disclaimer_eng="Some programs are suitable for viewing by adults only. You are responsible for selecting and setting your own parental lock preference via the Settings page.";
var disclaimer_chi="&#37096;&#20221;&#31680;&#30446;&#21482;&#36969;&#21512;&#25104;&#20154;&#35264;&#30475;&#12290;&#38307;&#19979;&#38656;&#26044; &ldquo;&#35373;&#23450;&rdquo; &#29256;&#38754;&#36984;&#25799;&#21450;&#35373;&#23450;&#20854;&#23478;&#38263;&#37782;&#23450;&#21151;&#33021; &#12290;";
var isadult=N;
var islock=N;

var product_array = new Array();
product_array[0] = new product("201011110003021", "GI Joe", "gi jOE (&#20013;&#25991;)", "--", "--", "201011110003021_1.jpg");
product_array[1] = new product("201106130007281", "MH SVOD class G", "MH SVOD G &#20013;&#25991;", "Eng Actor", "&#20013;&#25991; Actor", "201106130007281_1.png");
product_array[2] = new product("201106130007321", "MH SVOD class PG Testing As Long As Possible Program Name and Episode Name and Episod", "MH SVOD PG &#25105;&#35201;&#35430;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#31680;&#30446;&#21517; &#65292;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#21127;&#38598;&#21517;", "eng actor", "&#20013;&#25991; actor", "201106130007321_1.png");

var series_array = new Array();
