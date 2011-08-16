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

var cat_id="C201006020000146";
var catname_eng="My Playlist";
var catname_chi="&#25105;&#30340;&#28165;&#21934;";
var disclaimer_eng="This is English DisclaimerThis is English DisclaimerThis is English DisclaimerThis is English DisclaimerThis is English DisclaimerThis is English Disclaimer";
var disclaimer_chi="This is Chinese DisclaimerThis is Chinese DisclaimerThis is Chinese DisclaimerThis is Chinese DisclaimerThis is Chinese DisclaimerThis is Chinese Disclaimer";
var isadult=N;
var islock=null;

var product_array = new Array();
product_array[0] = new product("201006040000509", "Testing As Long As Possible Program Name and Episode Name and Episode Details", "&#25105;&#35201;&#35430;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#31680;&#30446;&#21517; &#65292;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#21127;&#38598;&#21517; &#65292;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#21127;&#38598;&#20839;&#23481;", "Meryl Streep1", "&#26757;&#33673;&#21490;&#32736;&#26222;1", "201006040000509_1.jpg");
//product_array[0] = new product("201107060007646", "Testing As Long As Possible Program Name and Episode Name and Episode Details", "&#25105;&#35201;&#35430;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#31680;&#30446;&#21517; &#65292;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#21127;&#38598;&#21517; &#65292;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#21127;&#38598;&#20839;&#23481;", "Meryl Streep1", "&#26757;&#33673;&#21490;&#32736;&#26222;1", "201006040000509_1.jpg");
product_array[1] = new product("201006040000505", "Mamma Mia2! PPV", "&#23229;&#23229;&#21674;&#21568;&#65281;2 PPV", "Meryl Streep2", "&#26757;&#33673;&#21490;&#32736;&#26222;2", "201006040000505_1.jpg");
product_array[2] = new product("201006040000504", "Mamma Mia3! PPV", "&#23229;&#23229;&#21674;&#21568;&#65281;3 PPV", "Meryl Streep3", "&#26757;&#33673;&#21490;&#32736;&#26222;3", "201006040000504_1.jpg");
product_array[3] = new product("201006040000504", "Mamma Mia3! PPV", "&#23229;&#23229;&#21674;&#21568;&#65281;3 PPV", "Meryl Streep3", "&#26757;&#33673;&#21490;&#32736;&#26222;3", "201006040000504_1.jpg");
product_array[4] = new product("201006040000504", "Mamma Mia3! PPV", "&#23229;&#23229;&#21674;&#21568;&#65281;3 PPV", "Meryl Streep3", "&#26757;&#33673;&#21490;&#32736;&#26222;3", "201006040000504_1.jpg");
product_array[5] = new product("201006040000504", "Mamma Mia3! PPV", "&#23229;&#23229;&#21674;&#21568;&#65281;3 PPV", "Meryl Streep3", "&#26757;&#33673;&#21490;&#32736;&#26222;3", "201006040000504_1.jpg");
product_array[6] = new product("201006040000504", "Mamma Mia3! PPV", "&#23229;&#23229;&#21674;&#21568;&#65281;3 PPV", "Meryl Streep3", "&#26757;&#33673;&#21490;&#32736;&#26222;3", "201006040000504_1.jpg");
product_array[7] = new product("201006040000504", "Mamma Mia3! PPV", "&#23229;&#23229;&#21674;&#21568;&#65281;3 PPV", "Meryl Streep3", "&#26757;&#33673;&#21490;&#32736;&#26222;3", "201006040000504_1.jpg");
product_array[8] = new product("201006040000504", "Mamma Mia3! PPV", "&#23229;&#23229;&#21674;&#21568;&#65281;3 PPV", "Meryl Streep3", "&#26757;&#33673;&#21490;&#32736;&#26222;3", "201006040000504_1.jpg");
product_array[9] = new product("201006040000504", "Mamma Mia3! PPV", "&#23229;&#23229;&#21674;&#21568;&#65281;3 PPV", "Meryl Streep3", "&#26757;&#33673;&#21490;&#32736;&#26222;3", "201006040000504_1.jpg");

var series_array = new Array();
//series_array[0] = new series("S201105300000000", "Mamma Mia! Series", "Mamma Mia! Series - Chi", "MH_NBCU_Series_Actor", "MH_NBCU_Series_Actor - Chi", "S201105300000001_1.jpg","LIST_TEMPLATE");
//series_array[1] = new series("S201106090008397", "Mamma Mia! Series", "Mamma Mia! Series - Chi", "MH_NBCU_Series_Actor", "MH_NBCU_Series_Actor - Chi", "S201105300000001_1.jpg","LIST_TEMPLATE");

