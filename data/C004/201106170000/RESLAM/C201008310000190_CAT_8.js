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

var cat_id="C201008310000192";
var catname_eng="TV Series";
var catname_chi="&#21127;&#38598;";
var disclaimer_eng="Some programs are suitable for viewing by adults only. You are responsible for selecting and setting your own parental lock preference via the Settings page.";
var disclaimer_chi="&#37096;&#20221;&#31680;&#30446;&#21482;&#36969;&#21512;&#25104;&#20154;&#35264;&#30475;&#12290;&#38307;&#19979;&#38656;&#26044; &ldquo;&#35373;&#23450;&rdquo; &#29256;&#38754;&#36984;&#25799;&#21450;&#35373;&#23450;&#20854;&#23478;&#38263;&#37782;&#23450;&#21151;&#33021; &#12290;";
var isadult=N;
var islock=N;

var product_array = new Array();

var series_array = new Array();
series_array[0] = new series("S201106160001122", "Testing As Long As Possible Program Name and Episode Name and Episode Details", "&#25105;&#35201;&#35430;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#31680;&#30446;&#21517; &#65292;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#21127;&#38598;&#21517; &#65292;&#26377;&#21633;&#38263;&#24471;&#21633;&#38263;&#26082;&#21127;&#38598;&#20839;&#23481;", "None", "&#20871;", "S201106160001122_1.jpg");
series_array[1] = new series("S201106090008397", "Testing Series by Ernest", "Testing Series by Ernest", "Test", "Test", "S201106090008397_1.jpg");
series_array[2] = new series("S201106160001822", "&#39938;&#39770;&#28044; &#28145;&#27700;&#22487; &#21704;&#22217;&#21890; &#25779;&#37666; &#26519;&#23791;", "&#39938;&#39770;&#28044; &#28145;&#27700;&#22487; &#21704;&#22217;&#21890; &#25779;&#37666; &#26519;&#23791;", "--", "--", "S201106160001822_1.jpg");
series_array[3] = new series("S201106160002244", "Display order = 3", "Display order = 3", "--", "--", "S201106160002244_1.jpg");
series_array[4] = new series("S201106160009999", "Display order 3 with big series ID", "Display order 3 with big series ID", "--", "--", "S201106160009999_1.jpg");
series_array[5] = new series("S201106160008888", "Dsiplay order * 4", "Dsiplay order * 4", "--", "--", "S201106160008888_1.jpg");
series_array[6] = new series("S201106160002345", "&#27966;&#37666;&#23433;&#25490;&#20170;&#20844;&#24067; 18&#27506;&#32218;&#23450;&#26126;&#24180;3&#26376;", "&#27966;&#37666;&#23433;&#25490;&#20170;&#20844;&#24067; 18&#27506;&#32218;&#23450;&#26126;&#24180;3&#26376;", "&#27966;&#37666;&#23433;&#25490;&#20170;&#20844;&#24067; 18&#27506;&#32218;&#23450;&#26126;&#24180;3&#26376;", "&#27966;&#37666;&#23433;&#25490;&#20170;&#20844;&#24067; 18&#27506;&#32218;&#23450;&#26126;&#24180;3&#26376;", "S201106160002345_1.jpg");
