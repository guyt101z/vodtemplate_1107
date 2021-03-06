function series_product(id, name_eng, name_chi, episode_name_eng, episode_name_chi, language_eng, language_chi, cast_eng, cast_chi, synopsis_eng, synopsis_chi, duration, classification, is_adult, is_lock, is_restricted, schedule_id, is_sd, is_hd, sd_image1_file, sd_image2_file, sd_image3_file, sd_image4_file) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
this.episode_name_eng = episode_name_eng;
this.episode_name_chi = episode_name_chi;
this.language_eng = language_eng;
this.language_chi = language_chi;
this.cast_eng = cast_eng;
this.cast_chi = cast_chi;
this.synopsis_eng = synopsis_eng;
this.synopsis_chi = synopsis_chi;
this.duration = duration;
this.classification = classification;
this.is_adult = is_adult;
this.is_lock = is_lock;
this.is_restricted = is_restricted;
this.schedule_id = schedule_id;
this.is_sd=is_sd;
this.is_hd=is_hd;
this.sd_image1_file = sd_image1_file;
this.sd_image2_file = sd_image2_file;
this.sd_image3_file = sd_image3_file;
this.sd_image4_file = sd_image4_file;
}

var id="S201105300000000";
var enable_next_episode="true";

var series_product_array = new Array();
series_product_array[0] = new series_product("201006040000509", "Mamma Mia! Series Episode 1", "Mamma Mia! Series &#31532;&#19968;&#38598;", "Episode 1Episode 1Episode 1Episode 1Episode 1Episode 1Episode 1", "&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;&#31532;&#19968;&#38598;", "Chinese", "&#20013;&#25991;", "Chinese people", "&#20013;&#22283;&#20154;", "Chinese Story", "&#20013;&#22283;&#25925;&#20107;", "10", "G", false, false, false, "201006040001188", true, false, "201006040000509_1.jpg", "", "", "");
/*series_product_array[1] = new series_product("201006040000504", "Mamma Mia! Series Episode 2", "Mamma Mia! Series &#31532;&#20108;&#38598;","Episode 2", "&#31532;&#20108;&#38598;", "English", "&#33521;&#25991;", "British people", "&#33521;&#22283;&#20154;", "British Story", "&#33521;&#22283;&#25925;&#20107;", "20", "M", false, false, false, "201006040001184", false, true, "201006040000505_1.jpg", "", "", "");
series_product_array[2] = new series_product("201006040000505", "Mamma Mia! Series Episode 3", "Mamma Mia! Series &#31532;&#19977;&#38598;", "Episode 3", "&#31532;&#19977;&#38598;","French", "&#27861;&#25991;", "French people", "&#27861;&#22283;&#20154;", "French Story", "&#27861;&#22283;&#25925;&#20107;", "30", "PG", false, false, false, "201006040001185", true, true, "201006040000505_1.jpg", "", "", "");
series_product_array[3] = new series_product("2010060400005091", "Mamma Mia! Series Episode 4", "Mamma Mia! Series &#31532;&#22235;&#38598;", "Episode 4", "&#31532;&#22235;&#38598;","Russian", "&#20420;&#25991;", "Russian people", "&#20420;&#32645;&#26031;&#20154;", "Russian Story", "&#20420;&#32645;&#26031;&#25925;&#20107;", "40", "G", false, false, false, "201006040001188", true, true, "201006040000509_1.jpg", "", "", "");
series_product_array[4] = new series_product("2010060400005041", "Mamma Mia! Series Episode 5", "Mamma Mia! Series &#31532;&#20116;&#38598;",  "Episode 5", "&#31532;&#20116;&#38598;&#31532;&#20116;&#38598;&#31532;&#20116;&#38598;&#31532;&#20116;&#38598;&#31532;&#20116;&#38598;&#31532;&#20116;&#38598;&#31532;&#20116;&#38598;&#31532;&#20116;&#38598;&#31532;&#20116;&#38598;&#31532;&#20116;&#38598;&#31532;&#20116;&#38598;","Japanese", "&#26085;&#25991;", "Japanese people", "&#26085;&#26412;&#20154;", "Japanese Story", "&#26085;&#26412;&#25925;&#20107;", "50", "M", false, false, false, "201006040001184", true, true, "201006040000509_1.jpg", "", "", "");
series_product_array[5] = new series_product("2010060400005042", "Mamma Mia! Series Episode 6", "Mamma Mia! Series &#31532;&#20845;&#38598;", "Episode 6", "&#31532;&#20845;&#38598;","Korean", "&#38867;&#25991;", "Korean people", "&#38867;&#22283;&#20154;", "Korean Story", "&#38867;&#22283;&#25925;&#20107;", "60", "PG", false, false, false, "201006040001184", true, true, "201006040000504_1.jpg", "", "", "");
series_product_array[6] = new series_product("2010060400005043", "Mamma Mia! Series Episode 7", "Mamma Mia! Series &#31532;&#19971;&#38598;", "Episode 7", "&#31532;&#19971;&#38598;","Spanish", "&#35199;&#29677;&#29273;&#25991;", "Spanish people", "&#35199;&#29677;&#29273;&#20154;", "Spanish Story", "&#35199;&#29677;&#29273;&#25925;&#20107;", "70", "G", false, false, false, "201006040001184", true, true, "201006040000505_1.jpg", "", "", "");
series_product_array[7] = new series_product("2010060400005044", "Mamma Mia! Series Episode 8", "Mamma Mia! Series &#31532;&#20843;&#38598;", "Episode 8", "&#31532;&#20843;&#38598;","Portuguese", "&#33889;&#33796;&#29273;&#25991;", "Portuguese people", "&#33889;&#33796;&#29273;&#20154;", "Portuguese Story", "&#33889;&#33796;&#29273;&#25925;&#20107;", "80", "M", false, false, false, "201006040001184", true, true, "201006040000509_1.jpg", "", "", "");
series_product_array[8] = new series_product("2010060400005045", "Mamma Mia! Series Episode 9", "Mamma Mia! Series &#31532;&#20061;&#38598;", "Episode 9", "&#31532;&#20061;&#38598;","Italian", "&#24847;&#22823;&#21033;&#25991;", "Italian people", "&#24847;&#22823;&#21033;&#20154;", "Italian Story", "&#24847;&#22823;&#21033;&#25925;&#20107;", "90", "PG", false, false, false, "201006040001184", true, true, "201006040000504_1.jpg", "", "", "");
series_product_array[9] = new series_product("2010060400005046", "Mamma Mia! Series Episode 10", "Mamma Mia! Series &#31532;&#21313;&#38598;", "Episode 10", "&#31532;&#21313;&#38598;","Latin", "&#25289;&#19969;&#25991;", "Latin people", "&#25289;&#19969;&#20154;", "Latin Story", "&#25289;&#19969;&#25925;&#20107;", "100", "G", false, false, false, "201006040001184", true, true, "201006040000505_1.jpg", "", "", "");
