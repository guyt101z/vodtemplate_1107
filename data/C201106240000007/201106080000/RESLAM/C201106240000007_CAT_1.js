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

var cat_id="C201106240000008";
var catname_eng="Hot Picks";
var catname_chi="&#29105;&#29190;&#25512;&#20171;";
var disclaimer_eng="Please select &quot;INFODESK&quot; under &quot;Settings&quot; in now TV Menu for AV-On-Demand Program Terms &amp; Conditions.";
var disclaimer_chi="&#35531;&#26044;now&#23532;&#38971;&#38651;&#35222;&#20027;&#38913;&#36984;&#25799;[&#35373;&#23450;]&#21450;[&#36039;&#35338;&#31449;] &#21443;&#38321;&#25104;&#20154;&#33258;&#36984;&#24433;&#38498;&#20043;&#26781;&#27454;&#21450;&#26781;&#20214;&#12290;";
var isadult=N;
var islock=null;

var product_array = new Array();
product_array[0] = new product("201107060007781", "Sex Legend", "&#26494;&#23798;&#26963;&#20043;&#20659;&#35498;&#20126;&#32654;", "Eng Actor", "&#26494;&#23798;&#26963;", "201107060007781_1.png");
product_array[1] = new product("201107070007821", "Maxing AV SVOD testing 2", "Maxing AV SVOD testing 2 C", "Eng Actor", "Chi Actor", "201107070007821_1.png");

var series_array = new Array();
