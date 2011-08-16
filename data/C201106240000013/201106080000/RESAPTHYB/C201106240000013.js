function Category(cat_id, catname_eng, catname_chi, cat_style) {
this.cat_id = cat_id;
this.catname_eng = catname_eng;
this.catname_chi = catname_chi;
this.cat_style = cat_style;
}

var lib_id="L00718";
var libname_eng="XTSY";
var libname_chi="XTSY";
var logo_file="C201106240000013.gif";

var cat_list = new Array();
cat_list[0] = new Category("C201106240000018", "Special Topic", "&#29305;&#21029;&#20043;&#36984;", "GRID_TEMPLATE");
