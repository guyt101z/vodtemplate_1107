function series_product(id, name_eng, name_chi, is_adult, is_lock, is_restricted, schedule_id) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
this.is_adult = is_adult;
this.is_lock = is_lock;
this.is_restricted = is_restricted;
this.schedule_id = schedule_id;
}

var id="S201105300000001";
var name_eng="MH_NBCU_Series_1";
var name_chi="MH_NBCU_Series_1";
var language_eng="MovieHouse_NBCU_1";
var language_chi="Movie_NBCU_1";
var cast_eng="MH_NBCU_Series_Actor";
var cast_chi="MH_NBCU_Series_Actor";
var synopsis_eng="MH_NBCU_Series_Synopsis";
var synopsis_chi="MH_NBCU_Series_Synopsis";
var disclaimer_eng="";
var disclaimer_chi="";
var classification="";
var enable_next_episode="true";
var sd_image1_file="S201105300000001_1.jpg";

var series_product_array = new Array();
series_product_array[0] = new series_product("201011170001240", "test_201011161531", "test_201011161531", false, false, false, "201011170002220");
series_product_array[1] = new series_product("201011160001195", "test_201011161047", "test_201011161047", false, false, false, "201011160002175");
series_product_array[2] = new series_product("201011160001216", "test_201011161154", "test_201011161154", false, false, false, "201011160002196");
series_product_array[3] = new series_product("201011160001217", "test_201011161158", "test_201011161158", false, false, false, "201011160002197");
