function product(product_id, productname_eng, productname_chi, sd_image1_file) {
this.product_id = product_id;
this.productname_eng = productname_eng;
this.productname_chi = productname_chi;
this.sd_image1_file = sd_image1_file;
}

var cat_id="C201005250000142";
var catname_eng="Features";
var catname_chi="&#36067;&#24231;&#31934;&#36984;";
var disclaimer_eng="";
var disclaimer_chi="";
var isadult=N;
var islock=N;

var product_array = new Array();
product_array[0] = new product("201011160001183", "test_201011161008", "test_201011161008", "");
product_array[1] = new product("201011170001222", "test_201011161458", "test_201011161458", "201011170001222_1.png");
product_array[2] = new product("201011170001233", "test_201011161520", "test_201011161520", "201011170001233_1.png");
product_array[3] = new product("201011160001203", "test_201011161057", "test_201011161057", "");
