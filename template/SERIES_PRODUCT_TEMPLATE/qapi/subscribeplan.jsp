<%@page contentType="text/html"
	import="org.apache.log4j.*,
	com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, 
	ims.vi.quadplay.SubscriptionService.ChannelAvailablePlans, 
	ims.vi.quadplay.SubscriptionService.SubscriptionComboPlan, 
	ims.vi.quadplay.SubscriptionService.SubscriptionIndividualPlan, 
	java.util.List, ims.vi.quadplay.SubscriptionService.ActionResult"
%>
<%@include file="../svod_header.jsp"%>
<%
Logger logger;

logger = Logger.getLogger("subscription.jsp");


QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
//String planCode = "VIVSCM12M";
//String planCampaign = "now Select-SCM";
String planCode = request.getParameter("plancode");;
String planCampaign = request.getParameter("campaign");;
String seriesId = request.getParameter("seriesid");
String seriesIndex = request.getParameter("seriesindex");
String seriesProductId = request.getParameter("seriesproductid");
String scheduleId = request.getParameter("scheduleid");

if (planCampaign.equals("NULL")) {
	planCampaign = null;
}

urlParam+="&seriesid="+seriesId+"&seriesproductid="+seriesProductId+"&seriesindex="+seriesIndex;


//fsa = "99900010";
//libId="L00304";
//language="en_us";

try {
	ActionResult result = wrapper.subscribePlan(fsa, planCode, planCampaign);
	if (result !=null) {
		if (!result.isActionSucceed()) {
			// System error
			logger.info("Subscription error ["+fsa+"] ["+planCode+"] ["+planCampaign+"] [result.isActionSucceed]");
			%>
			<script type="text/javascript">
			<!--
			window.location = "../error.jsp?errormsg=SystemError&"+<%=urlParam%>;
			//-->
			</script>	
			<%
		} else {
			// success subsciption and go to play 
			//sb.append("success : " + result.getFailReason()+"\n");
%>
			<script type="text/javascript">
			<!--
			window.location = "../thankyou.jsp?scheduleid=<%=scheduleId%>&<%=urlParam%>";
			//-->
			</script>
<%
		}
	} else {
		// System error
		//sb.append("FailReason : " + result.getFailReason()+"\n");
		//sb.append("result is null");
		logger.info("Subscription error ["+fsa+"] ["+planCode+"] ["+planCampaign+"] [result =null]");
		%>
		<script type="text/javascript">
		<!--
		window.location = "../error.jsp?errormsg=SystemError&"+<%=urlParam%>;
		//-->
		</script>	
		<%
	}
} catch (ims.vi.quadplay.SubscriptionService.APIWebServiceException_Exception e) {
	logger.info("Subscription error [" + e.getFaultInfo().getResponseCode()+ "]");
	
	//String errMsg = wrapper.getUIMessage("subscribePlan",  e.getFaultInfo().getResponseCode().toString(), libId, language);

	//logger.info("Subscription error msg [" + errMsg + "]");
	
	//errMsg = java.net.URLEncoder.encode(errMsg,"UTF-8"); 
	
	String api = "subscribePlan";
	String respCode = e.getFaultInfo().getResponseCode().toString();

	%>
	<script type="text/javascript">
	<!--
	window.location = "../error.jsp?api=<%=api%>&respcode=<%=respCode%>&<%=urlParam%>";
	//-->
	</script>
	<%	

	//if (ims.vi.quadplay.SubscriptionService.ResponseCode.PLAN_ALREADY_SUBSCRIBED.equals(e.getFaultInfo().getResponseCode())){
	//} else {
	//}
	//ims.vi.quadplay.SubscriptionService.APIWebServiceException ex = e.getFaultInfo();	
	//ims.vi.quadplay.SubscriptionService.ResponseCode.
	//if (
	
	//("Error response code = [" + e.getFaultInfo().getResponseCode() + "]\n");
	//String errMsg = wrapper.getUIMessage("subscribePlan",  e.getFaultInfo().getResponseCode().toString(), libId, language);
	
	
}
%>

