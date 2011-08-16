function product(id, name_eng, name_chi, end_time, sd_image1_file) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
this.cast_eng = cast_eng;
this.cast_chi = cast_chi;
this.end_time = end_time;
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

var cat_id="C201002050000152";
var catname_eng="ISA (HD)";
var catname_chi="ISA (HD)";
var disclaimer_eng="Every match will be available for 4 weeks. Off-air time will be 11:59pm of the off-air date.";
var disclaimer_chi="&#27599;&#22580;&#36093;&#20107;&#25918;&#26144;&#26178;&#38291;&#28858;4&#26143;&#26399;&#12290;&#26368;&#24460;&#25773;&#25918;&#26178;&#38291;&#28858;&#26368;&#24460;&#25773;&#25918;&#26085;&#20043;&#26202;&#19978;11&#26178;59&#20998;&#12290;";
var isadult=false;
var islock=false;

var product_array = new Array();
product_array[0] = new product("200808300015178", "01-09-2008 Fiorentina v Juventus", "01-09-2008 &#36027;&#20523;&#22825;&#25343; &#23565; &#31062;&#38642;&#36948;&#26031;", "--", "--", "");
product_array[1] = new product("200801150011347", "20-01-2008 Juventus v Sampdoria(HD)", "20-01-2008 &#31062;&#38642;&#36948;&#26031; &#23565; &#26862;&#22810;&#21033;&#20126;(HD)", "--", "--", "");
product_array[2] = new product("200801150011346", "21-01-2008 Inter Milan v Parma(HD)", "21-01-2008 &#22283;&#38555;&#31859;&#34349; &#23565; &#24085;&#29246;&#39340;(HD)", "--", "--", "");
product_array[3] = new product("200803140012282", "20-03-08 Lazio v Roma (HD)", "20-03-08 &#25289;&#32032; &#23565; &#32645;&#39340; (HD)", "--", "--", "");
product_array[4] = new product("200803210012386", "30-03-08 Juventus v Parma (HD)", "30-03-08 &#31062;&#38642;&#36948;&#26031; &#23565; &#24085;&#29246;&#39340; (HD)", "--", "--", "");

var series_array = new Array();
