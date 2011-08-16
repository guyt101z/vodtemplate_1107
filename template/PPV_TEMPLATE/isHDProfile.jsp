<%
boolean isHDProfile = false;

if (servtype!=null) {
	if ("MPEG4HD".equals(servtype)) {
		isHDProfile = true;
	} else{
		isHDProfile = false;
	}
} else {
	isHDProfile = false;
}
%>