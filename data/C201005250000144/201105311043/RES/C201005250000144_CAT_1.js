function product(id, name_eng, name_chi, sd_image1_file) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
this.sd_image1_file = sd_image1_file;
}

function series(id, name_eng, name_chi, sd_image1_file, style) {
this.id = id;
this.name_eng = name_eng;
this.name_chi = name_chi;
this.sd_image1_file = sd_image1_file;
this.style = style;
}

var cat_id="C201006020000146";
var catname_eng="My Playlist";
var catname_chi="&#25105;&#30340;&#28165;&#21934;";
var disclaimer_eng="";
var disclaimer_chi="";
var isadult=N;
var islock=null;

var product_array = new Array();

var series_array = new Array();
