function Category(cat_id, catname_eng, catname_chi, cat_style) {
this.cat_id = cat_id;
this.catname_eng = catname_eng;
this.catname_chi = catname_chi;
this.cat_style = cat_style;
}

var lib_id="L00702";
var libname_eng="MovieHouse (PPV) - NBCU";
var libname_chi="MovieHouse (PPV) - NBCU";
var logo_file="C201005250000144.png";

var cat_list = new Array();
cat_list[0] = new Category("C201006020000146", "My Playlist", "&#25105;&#30340;&#28165;&#21934;", "GRID_TEMPLATE");
cat_list[1] = new Category("C201005250000139", "New Release", "&#26368;&#26032;&#25512;&#20171;", "GRID_TEMPLATE");
cat_list[2] = new Category("C201101020000310", "nbcu_01031_2", "nbcu_01031_2", "null");
cat_list[3] = new Category("C201005250000141", "Blockbuster", "&#26412;&#26376;&#37445;&#29563;", "GRID_TEMPLATE");
cat_list[4] = new Category("C201005250000142", "Features", "&#36067;&#24231;&#31934;&#36984;", "GRID_TEMPLATE");
cat_list[5] = new Category("C201005250000143", "Full Selection", "&#20840;&#37096;&#38651;&#24433;", "GRID_TEMPLATE");
