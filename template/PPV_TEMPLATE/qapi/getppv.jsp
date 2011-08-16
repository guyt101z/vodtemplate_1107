<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, java.util.List, java.net.URLEncoder"
%>
<%@include file="../../../ppv_header.jsp"%>
<%
QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();

String expDayVal = request.getParameter("expdayval");
String movieDuration = request.getParameter("movieDuration");
String ipAddr = request.getRemoteAddr();
String productId = request.getParameter("productid");
String movieFormat = request.getParameter("movieformat");
String presentedPrice = request.getParameter("price");
String deviceType = "TVPORTAL";
String pinVerified = request.getParameter("verified");
String playOnly = request.getParameter("playonly");
String purchaseOther = request.getParameter("purchaseother");
String cat = request.getParameter("cat");

// For Phase 2A
//String cashPointBalance = request.getParameter("cashpointbalance");
String purchaseType = request.getParameter("purchasetype");

String doTopUp = request.getParameter("dotopup");
String topUpOfferCode = request.getParameter("topupoffercode");
String balance = request.getParameter("cashpointbalance");
String oldCashPointBalance = balance;
%>
<%@include file="topUpCashPoint.jsp"%>
<%@include file="getCashPointBalance.jsp"%>
<%
if("true".equalsIgnoreCase(doTopUp)){
	//remain its value after getCashPointBalance.jsp
	balance = cashPointBalance;
}
else{
	//overwrite by old value
	balance = oldCashPointBalance;
}
urlParam +=  "&movieDuration="+movieDuration+"&purchasetype="+purchaseType+"&expdayval="+expDayVal+"&cat="+cat+"&productid="+productId+"&movieformat="+movieFormat+"&price="+presentedPrice;

Boolean isLockedVerified = new Boolean(pinVerified);
Boolean isPlayOnly = new Boolean(playOnly);
Boolean isPurchaseOtherFormat= new Boolean(purchaseOther);

/*
ims.vi.quadplay.MovieHouseCheckoutService.MovieCheckoutMessage message = wrapper.getPPVVodWithCashPoint(fsa, stbId, stbSid, ipAddr,
		productId, movieFormat, presentedPrice, isLockedVerified, isPlayOnly, isPurchaseOtherFormat, deviceType);
*/
if("POSTPAID".equals(purchaseType)){
	balance = null;
}
ims.vi.quadplay.MovieHouseCheckoutService.MovieCheckoutMessage message = wrapper.getPPVVodWithCashPoint(fsa, stbId, stbSid, ipAddr,
		productId, movieFormat, presentedPrice, QuadPlayServiceWrapper.getPurchaseType(purchaseType), balance,
		isLockedVerified, isPlayOnly, isPurchaseOtherFormat, deviceType);

String movieRTSP="";

long bitRate=0;

if (message!=null){
	ims.vi.quadplay.MovieHouseCheckoutService.MovieHouseResponseCode respCode = message.getResponseCode();
	%>
	<%@include file="getppvresp.jsp"%>
	<%
	return;
} else { // System Err
	//
	%>
	<script type="text/javascript">
	<!--
	window.location = "../error.jsp?errormsg=SystemError&"+<%=urlParam%>;
	//-->
	</script>
	<%

}
%>
