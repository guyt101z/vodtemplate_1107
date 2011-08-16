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

var cat_id="C201107010000003";
var catname_eng="Comedy";
var catname_chi="&#21916;&#21127;";
var disclaimer_eng="";
var disclaimer_chi="";
var isadult=N;
var islock=N;

var product_array = new Array();
product_array[0] = new product("201107180012651", "Chowder E1", "&#24859;&#21507;&#39740;&#24039;&#36948; &#31532;1&#38598;", "--", "--", "201107180012651_1.jpg");
product_array[1] = new product("201107180012652", "Chowder E2", "&#24859;&#21507;&#39740;&#24039;&#36948; &#31532;2&#38598;", "--", "--", "201107180012652_1.jpg");
product_array[2] = new product("201107180012653", "Chowder E3", "&#24859;&#21507;&#39740;&#24039;&#36948; &#31532;3&#38598;", "--", "--", "201107180012653_1.jpg");
product_array[3] = new product("201107180012654", "Courage the Cowardly Dog E1", "&#33213;&#23567;&#29399;&#33521;&#38596; &#31532;1&#38598;", "--", "--", "201107180012654_1.jpg");
product_array[4] = new product("201107180012655", "Courage the Cowardly Dog E2", "&#33213;&#23567;&#29399;&#33521;&#38596; &#31532;2&#38598;", "--", "--", "201107180012655_1.jpg");
product_array[5] = new product("201107180012656", "Courage the Cowardly Dog E3", "&#33213;&#23567;&#29399;&#33521;&#38596; &#31532;3&#38598;", "--", "--", "201107180012656_1.jpg");
product_array[6] = new product("201107180012657", "Courage the Cowardly Dog E4", "&#33213;&#23567;&#29399;&#33521;&#38596; &#31532;4&#38598;", "--", "--", "201107180012657_1.jpg");
product_array[7] = new product("201107180012660", "Johnny Bravo E1", "&#25306;&#21629;&#37070;&#32004;&#32752;&#23612; &#31532;1&#38598;", "--", "--", "201107180012660_1.jpg");
product_array[8] = new product("201107180012661", "Johnny Bravo E2", "&#25306;&#21629;&#37070;&#32004;&#32752;&#23612; &#31532;2&#38598;", "--", "--", "201107180012661_1.jpg");
product_array[9] = new product("201107180012662", "Grim Adventures of Billy&amp;Mandy E1", "&#22823;&#40763;&#33287;&#37239;&#33922; &#31532;1&#38598;", "--", "--", "201107180012662_1.jpg");
product_array[10] = new product("201107180012663", "Grim Adventures of Billy&amp;Mandy E2", "&#22823;&#40763;&#33287;&#37239;&#33922; &#31532;2&#38598;", "--", "--", "201107180012663_1.jpg");
product_array[11] = new product("201107180012664", "Grim Adventures of Billy&amp;Mandy E3", "&#22823;&#40763;&#33287;&#37239;&#33922; &#31532;3&#38598;", "--", "--", "201107180012664_1.jpg");
product_array[12] = new product("201107180012665", "Grim Adventures of Billy&amp;Mandy E4", "&#22823;&#40763;&#33287;&#37239;&#33922; &#31532;4&#38598;", "--", "--", "201107180012665_1.jpg");
product_array[13] = new product("201107180012666", "Grim Adventures of Billy&amp;Mandy E5", "&#22823;&#40763;&#33287;&#37239;&#33922; &#31532;5&#38598;", "--", "--", "201107180012666_1.jpg");
product_array[14] = new product("201107180012669", "Misadventures of Flapjack E1", "&#38463;&#21992;&#22823;&#20882;&#38570; &#31532;1&#38598;", "--", "--", "201107180012669_1.jpg");
product_array[15] = new product("201107180012670", "Misadventures of Flapjack E2", "&#38463;&#21992;&#22823;&#20882;&#38570; &#31532;2&#38598;", "--", "--", "201107180012670_1.jpg");
product_array[16] = new product("201107180012671", "Misadventures of Flapjack E3", "&#38463;&#21992;&#22823;&#20882;&#38570; &#31532;3&#38598;", "--", "--", "201107180012671_1.jpg");
product_array[17] = new product("201107180012672", "Misadventures of Flapjack E4", "&#38463;&#21992;&#22823;&#20882;&#38570; &#31532;4&#38598;", "--", "--", "201107180012672_1.jpg");

var series_array = new Array();
