function series_product(id, name_eng, name_chi, language_eng, language_chi, cast_eng, cast_chi, synopsis_eng, synopsis_chi, duration, classification, is_adult, is_lock, is_restricted, schedule_id, is_hd, is_sd, sd_image1_file, sd_image2_file, sd_image3_file, sd_image4_file) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
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
this.is_hd = is_hd;
this.is_sd = is_sd;
this.sd_image1_file = sd_image1_file;
this.sd_image2_file = sd_image2_file;
this.sd_image3_file = sd_image3_file;
this.sd_image4_file = sd_image4_file;
}

var id="S201105300000001";
var enable_next_episode="true";

var series_product_array = new Array();
series_product_array[0] = new series_product("201011170001240", "test_201011161531", "test_201011161531", "--", "--", "--", "--", "--", "--", "0", "", false, false, false, "201011170002220", true, false, "", "", "", "");
series_product_array[1] = new series_product("201011160001195", "test_201011161047", "test_201011161047", "--", "--", "--", "--", "--", "--", "0", "", false, false, false, "201011160002175", true, true, "", "", "", "");
series_product_array[2] = new series_product("201011160001216", "test_201011161154", "test_201011161154", "--", "--", "--", "--", "--", "--", "0", "", false, false, false, "201011160002196", true, false, "", "", "", "");
series_product_array[3] = new series_product("201011160001217", "test_201011161158", "test_201011161158", "--", "--", "--", "--", "--", "--", "0", "", false, false, false, "201011160002197", true, false, "", "", "", "");
