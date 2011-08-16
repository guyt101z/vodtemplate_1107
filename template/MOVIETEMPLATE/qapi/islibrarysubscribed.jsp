<%@page import="org.apache.log4j.*,
			com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper"
%>
<%@include file="../svod_header.jsp"%>
<%
Logger logger = Logger.getLogger("islibrarysubscribed.jsp");

QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
boolean libSubscribed = false;

try {
	libSubscribed = wrapper.isLibrarySubscribedWS(fsa, libId);
	if (!libSubscribed) {
		logger.info("IsLibrarySubscribed error ["+fsa+"] ["+libId+"] [Not subscribed]");
	}
} catch (ims.vi.quadplay.SubscriptionService.APIWebServiceException_Exception e) {
	logger.info("Subscription error [" + e.getFaultInfo().getResponseCode()+ "]");

	String api = "isLibrarySubscribed";
	String respCode = e.getFaultInfo().getResponseCode().toString();

%>
	<script type="text/javascript">
	<!--
	window.location = "../error.jsp?api=<%=api%>&respcode=<%=respCode%>&<%=urlParam%>";
	//-->
	</script>
<%
}
%>