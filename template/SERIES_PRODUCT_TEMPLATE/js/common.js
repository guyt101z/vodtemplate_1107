function isPassedOffairdate(in_offair) {
        if(!in_offair || in_offair.toLowerCase() == 'null'){
                return "true";
        }
        var YYYY = in_offair.substring(6,10);
        var MM = in_offair.substring(3,5)-1;
        var DD = in_offair.substring(0,2);
        var offairdate = new Date(YYYY,MM,DD,23,59,59);
        var today = new Date();
        if(today <= offairdate){
                return "false";
        }
        else{
                return "true";
        }
}

function trim(str)
{
        return str.replace(/(\s*$)/g, "");
}

function digestString(sth,the_limit) {
        var chi_q = 0;
        var eng_q = 0;
        var limit = the_limit;
        var rtn = "";
        var z=0;
	var index = 0;
        while(z < sth.length && chi_q+eng_q < limit){
                if (sth.substring(z,z+1)=="&"){
			chi_q+=1;
			if (sth.substring(z+1,z+2) == "#") chi_q+=1;
			index = sth.indexOf(";", z)+1;
                        rtn += sth.substring(z,index);
                        z = index;
                }
                else{
                        eng_q++;
                        rtn += sth.substring(z,z+1);
                        z = z + 1;
                }
        }
        if (chi_q+eng_q >= limit){
                rtn = trim(rtn);
                rtn = rtn.substring(0, rtn.length);
		if(sth.length > limit){
	                rtn += "...";
		}
        }
        return rtn;
}

function MM_preloadImages() {
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
