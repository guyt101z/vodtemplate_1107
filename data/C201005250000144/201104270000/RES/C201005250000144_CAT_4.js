function product(product_id, productname_eng, productname_chi, sd_image1_file) {
this.product_id = product_id;
this.productname_eng = productname_eng;
this.productname_chi = productname_chi;
this.sd_image1_file = sd_image1_file;
}

var cat_id="C201005250000140";
var catname_eng="Most Watched";
var catname_chi="&#29105;&#38272;&#20043;&#36984;";
var disclaimer_eng="Some programs are only suitable for viewing by adults only. You are responsible for selecting and setting your own parental lock preference via the Settings page.";
var disclaimer_chi="&#37096;&#20221;&#31680;&#30446;&#21482;&#36969;&#21512;&#25104;&#20154;&#35264;&#30475;&#12290;&#38307;&#19979;&#38656;&#26044; &ldquo;&#35373;&#23450;&rdquo; &#29256;&#38754;&#36984;&#25799;&#21450;&#35373;&#23450;&#20854;&#23478;&#38263;&#37782;&#23450;&#21151;&#33021; &#12290;";
var isadult=N;
var islock=N;

var product_array = new Array();
product_array[0] = new product("201011170001229", "test_201011161514", "test_201011161514", "");
product_array[1] = new product("201007130000532", "R/18 SD PPV", "R/18 SD PPV", "201007130000532_1.jpg");
product_array[2] = new product("201011160001190", "test_201011161037", "test_201011161037", "201011160001190_1.png");
product_array[3] = new product("201006040000505", "Evolution", "&#22320;&#29699;&#20877;&#30332;&#32946;&#20877;&#30332;&#32946;", "201006040000505_1.jpg");
product_array[4] = new product("201006020000498", "Mamma Mia! PPV", "&#23229;&#23229;&#21674;&#21568;&#65281; PPV", "201006020000498_1.jpg");
product_array[5] = new product("201006040000504", "Duplicity", "&#26368;&#20339;&#24773;&middot;&#25973;", "201006040000504_1.jpg");
