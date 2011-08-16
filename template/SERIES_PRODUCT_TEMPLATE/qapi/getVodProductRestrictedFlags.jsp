<%@page import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper"%>
<%
//String productId = "201007130000532";
QuadPlayServiceWrapper parental_wrapper = new QuadPlayServiceWrapper();
ims.vi.quadplay.VodService.VodProductMessage message = null;
if (seriesProductId != null && !"".equals(seriesProductId)) {
	message = parental_wrapper.getVodProductDetailWS(seriesProductId);
}

boolean isAdult = false;
boolean isRestricted = false;
boolean isLocked = false;
//String errorCode = "ERROR";

if (message != null) {
	//errorCode = message.getResponseCode().name();

	ims.vi.quadplay.VodService.VodProduct vodProduct = message.getEntity();
	isAdult = vodProduct.isAdult();
	isRestricted = vodProduct.isRestricted();
	isLocked = vodProduct.isLock();
}
%>
