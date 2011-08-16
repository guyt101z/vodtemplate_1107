<%@page import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper,
	ims.vi.common.service.client.GetCashPointBalanceResponse,
	ims.vi.common.service.client.enums.RestServerResponseCode,
	java.util.Date"%>
<%
QuadPlayServiceWrapper balanceWrapper = new QuadPlayServiceWrapper();
GetCashPointBalanceResponse balanceMessage = balanceWrapper.getCashPointBalance(stbId, stbSid);

String cashPointBalance = "";
Date expiryDate = null;
String expiryDateString = "";
boolean canGetCashPoint = true;
java.text.DateFormat temp_dfOut = new java.text.SimpleDateFormat("dd-MM-yyyy");

if (balanceMessage != null) {
	RestServerResponseCode restServerResponseCode = balanceMessage.getResponseCode();
	System.out.println("!!!!!!!!!!!!!!!!!!"+restServerResponseCode+"!!!!!!!!!!!!!!");
	if(RestServerResponseCode.WALLET_NOT_FOUND.equals(restServerResponseCode)||
			RestServerResponseCode.ALREADY_EXPIRED.equals(restServerResponseCode)
	){
		cashPointBalance = "0";
		expiryDateString = "N/A";
	}
	else if(RestServerResponseCode.INTERNAL_ERROR.equals(restServerResponseCode)||
					RestServerResponseCode.INVALID_INPUT.equals(restServerResponseCode)||
					RestServerResponseCode.MISSING_INPUT.equals(restServerResponseCode)||
					RestServerResponseCode.INVALID_VERSION.equals(restServerResponseCode)||
					RestServerResponseCode.INVALID_CALLER.equals(restServerResponseCode)||
					RestServerResponseCode.ACCOUNT_NOT_FOUND.equals(restServerResponseCode)
	){
		cashPointBalance = "Temp. Unavailable";
		expiryDateString = "Temp. Unavailable";
		canGetCashPoint = false;
	}
	else{
		cashPointBalance = balanceMessage.getCashPointBalance();
		expiryDate = balanceMessage.getExpiryDate();
		expiryDateString = temp_dfOut.format(expiryDate);
		if("0".equals(cashPointBalance)){
			expiryDateString = "N/A";
		}
	}
}
%>
