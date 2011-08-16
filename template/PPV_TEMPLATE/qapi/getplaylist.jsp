<%
//fsa = "11110033";
//language = "zh_tw";

ims.vi.quadplay.MovieHouseCheckoutService.MovieHousePlayListMessage movieHousePlayListMessage = wrapper.getMyCurrentPlayList(fsa, language);

StringBuffer jsBuf =new StringBuffer();

jsBuf.append("function playlistItem(id,name,typeClass,expDate,expTimeVal,movieformat,movieDuration,isadult,isrestricted,islock){\n");
jsBuf.append("this.id = id;\n");
jsBuf.append("this.name = name;\n");
jsBuf.append("this.typeClass = typeClass;\n");
jsBuf.append("this.expDate = expDate;\n");
jsBuf.append("this.expTimeVal = expTimeVal;\n");
jsBuf.append("this.movieformat= movieformat;\n");
jsBuf.append("this.movieDuration= movieDuration;\n");
jsBuf.append("this.isadult = isadult;\n");
jsBuf.append("this.isrestricted = isrestricted;\n");
jsBuf.append("this.islock = islock;\n");
jsBuf.append("}\n");
jsBuf.append("var playlist_arr = new Array();\n")
;

if (movieHousePlayListMessage != null) {
	if (movieHousePlayListMessage.getResponseCode().equals(ims.vi.quadplay.MovieHouseCheckoutService.MovieHouseResponseCode.SUCCESS)){
		List<ims.vi.quadplay.MovieHouseCheckoutService.MovieHousePlayItem> listInfo = movieHousePlayListMessage.getEntity();
		int i = 0;
		for (ims.vi.quadplay.MovieHouseCheckoutService.MovieHousePlayItem movieHousePlayItem : listInfo) {

			java.util.Date dt = movieHousePlayItem.getExpireTime().toGregorianCalendar().getTime();
			java.text.DateFormat dfOut = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm");

			String id = movieHousePlayItem.getProductId();
			String name = movieHousePlayItem.getTitle();
			String typeClass = movieHousePlayItem.getServiceType()+ " &#047; " + movieHousePlayItem.getClassification();
			String expDate = dfOut.format(dt);
			String expTimeVal = Long.toString(dt.getTime());
			String movieformat = movieHousePlayItem.getServiceType();
			String movieDuration = movieHousePlayItem.getDuration();
			boolean isAdult = movieHousePlayItem.isAdult();
			boolean isRestricted = movieHousePlayItem.isRestricted();
			boolean isLock = movieHousePlayItem.isLock();

			jsBuf.append("playlist_arr["+i+"] = new playlistItem(\""+id+"\", \""+name+"\", \""+typeClass+"\", \""+expDate+"\", \""+expTimeVal+"\", \""+movieformat+"\", \""+movieDuration+"\", " + isAdult + ", " + isRestricted + ", " + isLock + ");\n");
			i++;
		}
	} else { // ERR
		String api = "getMyCurrentPlayList";
		String respCode = movieHousePlayListMessage.getResponseCode().toString();
		%>
		<script type="text/javascript">
		<!--
		window.location = "error.jsp?api=<%=api%>&respcode=<%=respCode%>&<%=urlParam%>";
		//-->
		</script>
		<%
		return;
	}
} else { // ERR
	%>
	<script type="text/javascript">
	<!--
	window.location = "../error.jsp?<%=urlParam%>";
	//-->
	</script>
	<%
	return;
}
%>
