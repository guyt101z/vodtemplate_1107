function product(product_id, productname_eng, productname_chi, sd_image1_file) {
this.product_id = product_id;
this.productname_eng = productname_eng;
this.productname_chi = productname_chi;
this.sd_image1_file = sd_image1_file;
}

var cat_id="C201005250000141";
var catname_eng="Blockbuster";
var catname_chi="&#26412;&#26376;&#37445;&#29563;";
var disclaimer_eng="Some programs are only suitable for viewing by adults only. You are responsible for selecting and setting your own parental lock preference via the Settings page.";
var disclaimer_chi="&#37096;&#20221;&#31680;&#30446;&#21482;&#36969;&#21512;&#25104;&#20154;&#35264;&#30475;&#12290;&#38307;&#19979;&#38656;&#26044; &ldquo;&#35373;&#23450;&rdquo; &#29256;&#38754;&#36984;&#25799;&#21450;&#35373;&#23450;&#20854;&#23478;&#38263;&#37782;&#23450;&#21151;&#33021; &#12290;";
var isadult=N;
var islock=N;

var product_array = new Array();
product_array[0] = new product("201011160001213", "test_201011161148", "test_201011161148", "");
