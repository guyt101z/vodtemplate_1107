<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, java.util.List"
%>
<%@include file="../svod_header.jsp"%>
<%
QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();

String ipAddr = request.getRemoteAddr();
String scheduleId = request.getParameter("scheduleid");
String productType = "SVOD";
String deviceType = "TVPORTAL";
String pinVerified = request.getParameter("verified");
String cat = request.getParameter("cat");
String playOnly = request.getParameter("playonly");
String seriesId = request.getParameter("seriesid");
String seriesProductId = request.getParameter("seriesproductid");
String seriesIndex = request.getParameter("seriesindex");
Boolean isPlayOnly = new Boolean(playOnly);

ims.vi.quadplay.VodCheckoutService.CheckoutMessage message = null;
Boolean isLockedVerified = new Boolean(pinVerified);

urlParam += "&scheduleid="+scheduleId;
urlParam+="&seriesid="+seriesId+"&seriesproductid="+seriesProductId+"&seriesindex="+seriesIndex;
message = wrapper.getSVODUrl(stbId, stbSid, ipAddr, seriesProductId, libId, scheduleId, isLockedVerified, productType, deviceType, null);

String movieRTSP="";

long bitRate=0;

if (message!=null){
	ims.vi.quadplay.VodCheckoutService.ResponseCode respCode = message.getResponseCode();
	%>
	<%@include file="getsvodresp.jsp"%>
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
