function product(id, name_eng, name_chi, cast_eng, cast_chi, classification, is_adult, is_lock, is_restricted, schedule_id, end_time, is_onair, sd_image1_file) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
this.cast_eng = cast_eng;
this.cast_chi = cast_chi;
this.classification = classification;
this.is_adult = is_adult;
this.is_lock = is_lock;
this.is_restricted = is_restricted;
this.schedule_id = schedule_id;
this.end_time = end_time;
this.is_onair = is_onair;
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

var cat_id="C481";
var catname_eng="Drama";
var catname_chi="&#21127;&#24773;";
var disclaimer_eng="";
var disclaimer_chi="";
var isadult=false;
var islock=false;

var product_array = new Array();

var series_array = new Array();
series_array[0] = new series("S01801", "The 29th HKFAA", "&#31532;29&#23622;&#39321;&#28207;&#38651;&#24433;&#37329;&#20687;&#29518;&#38930;&#29518;&#20856;&#31150;", "The 29th HKFAA", "&#31532;29&#23622;&#39321;&#28207;&#38651;&#24433;&#37329;&#20687;&#29518;&#38930;&#29518;&#20856;&#31150;", "S01801_1.png", "");
series_array[1] = new series("S01521", "Lifetival", "Lifetival", "Lifetival", "Lifetival", "S01521_1.gif", "");
series_array[2] = new series("S00865", "Have a Nice Day", "Have a Nice Day", "Have a Nice Day", "Have a Nice Day", "S00865_1.jpg", "");
series_array[3] = new series("S00862", "Home Sweet Home", "Home Sweet Home", "Home Sweet Home", "Home Sweet Home", "S00862_1.jpg", "");
series_array[4] = new series("S01421", "Mother Chef", "Cooking &#23229;&#23282;", "Mother Chef", "Cooking &#23229;&#23282;", "S01421_1.gif", "");
series_array[5] = new series("S02061", "Blowing in the World", "&#39080;&#34892;&#20840;&#19990;&#30028;", "Helen To", "&#26460;&#22914;&#39080;", "S02061_1.jpg", "");
series_array[6] = new series("S00861", "now Story (adv.) ", "now&#21608;&#35352;(&#24291;&#21578;)", "now Story (adv.) ", "now&#21608;&#35352;(&#24291;&#21578;)", "S00861_1.gif", "");
series_array[7] = new series("S01984", "Hello Harlem", "&#21704;&#26519;&#32769;&#24107;&#22909;", "Harlem", "&#21704;&#26519;", "S01984_1.jpg", "");
series_array[8] = new series("S00863", "One Life One Earth", "&#19968;&#20491;&#22320;&#29699;", "One Life One Earth", "&#19968;&#20491;&#22320;&#29699;", "S00863_1.jpg", "");
series_array[9] = new series("S02001", "MoMo Love", "&#26691;&#33457;&#23567;&#22969;", "MoMo Love", "&#26691;&#33457;&#23567;&#22969;", "S02001_1.jpg", "");
series_array[10] = new series("S01725", "Brilliant Legacy", "&#29158;&#29211;&#30340;&#36986;&#29986;", "Brilliant Legacy", "&#29158;&#29211;&#30340;&#36986;&#29986;", "S01725_1.jpg", "");
