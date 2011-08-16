function Category(cat_id, catname_eng, catname_chi, cat_style) {
this.cat_id = cat_id;
this.catname_eng = catname_eng;
this.catname_chi = catname_chi;
this.cat_style = cat_style;
}

var lib_id="L00321";
var libname_eng="MovieHouse (SVOD)";
var libname_chi="MovieHouse (SVOD)";
var logo_file="C002.png";

var cat_list = new Array();
cat_list[0] = new Category("C201008310000191", "Monthly Spotlight", "&#26412;&#26376;&#25512;&#20171;", "GRID_WITH_LIST_TEMPLATE");
cat_list[1] = new Category("C201008310000171", "Action", "&#21205;&#20316;", "GRID_WITH_LIST_TEMPLATE");
cat_list[2] = new Category("C201008310000173", "Drama", "&#21127;&#24773;", "GRID_WITH_LIST_TEMPLATE");
cat_list[3] = new Category("C201008310000172", "Comedy", "&#21916;&#21127;", "GRID_WITH_LIST_TEMPLATE");
cat_list[4] = new Category("C201008310000174", "Romance", "&#24859;&#24773;", "GRID_WITH_LIST_TEMPLATE");
cat_list[5] = new Category("C201008310000193", "Family", "&#21512;&#23478;&#27489;", "GRID_WITH_LIST_TEMPLATE");
cat_list[6] = new Category("C201008310000176", "Thriller", "&#39514;&#24900;", "GRID_WITH_LIST_TEMPLATE");
cat_list[7] = new Category("C201008310000192", "TV Series", "&#21127;&#38598;", "GRID_WITH_LIST_TEMPLATE");
cat_list[8] = new Category("C201008310000175", "Star Trek Series ", "&#26143;&#31354;&#22855;&#36935;&#35352;&#31995;&#21015;", "GRID_WITH_LIST_TEMPLATE");
