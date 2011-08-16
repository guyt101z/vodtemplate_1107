<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, 
	java.util.List, java.lang.Long"
%>
<%
String [] expTime = new String[2];
boolean existInPlaylist = false;
String [] expTimeVal = new String[2];
String duration = "";
String movieDuration = "";
ims.vi.quadplay.MovieHouseCheckoutService.MovieHousePlayListMessage movieHousePlayListMessage = 
	wrapper.existInMyCurrentPlayList(fsa, productId);
if (movieHousePlayListMessage != null) {
	List<ims.vi.quadplay.MovieHouseCheckoutService.MovieHousePlayItem> listInfo = movieHousePlayListMessage.getEntity();
	if (listInfo.size() > 0 ) {
		existInPlaylist = true;
	}
} else {
	existInPlaylist = false;
}

if (existInPlaylist) {
	//java.text.DateFormat dfOut = new java.text.SimpleDateFormat("dd MMM yyyy HH:mm");
	java.text.DateFormat dfOut = new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm");
	List<ims.vi.quadplay.MovieHouseCheckoutService.MovieHousePlayItem> listInfo = movieHousePlayListMessage.getEntity();
	for (ims.vi.quadplay.MovieHouseCheckoutService.MovieHousePlayItem movieHousePlayItem : listInfo) {
		
		java.util.Date dt = movieHousePlayItem.getExpireTime().toGregorianCalendar().getTime();
		movieDuration = movieHousePlayItem.getDuration();
		//long timeDiff = movieHousePlayItem.getSystemTime().toGregorianCalendar().getTimeMillis()-
		//	movieHousePlayItem.getExpireTime().toGregorianCalendar().getTimeMillis();
			
		
		
		if ("SD".equals(movieHousePlayItem.getServiceType())) {
			priceTxt[0] = "Paid (Expiry date and time:" + dfOut.format(dt) + ")";
			expTime[0] = dfOut.format(dt);
			expTimeVal[0] = Long.toString(dt.getTime());
		} else if ("HD".equals(movieHousePlayItem.getServiceType())) { 
			priceTxt[1] = "Paid (Expiry date and time:" + dfOut.format(dt) + ")";
			expTime[1] = dfOut.format(dt);
			expTimeVal[1] = Long.toString(dt.getTime());
		}			
	}
}

%>
