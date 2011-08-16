<%
QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
ims.vi.common.service.client.GetCashPointTopUpPlanResponse getCashPointTopUpPlanResponse = wrapper.getCashPointTopUpPlan(stbId, stbSid);

StringBuffer jsBuf =new StringBuffer();

if (getCashPointTopUpPlanResponse != null) {
	if (getCashPointTopUpPlanResponse.getResponseCode() == ims.vi.common.service.client.enums.RestServerResponseCode.SUCCESS) {
			jsBuf.append("function planlist(offerCode,price,cashPoint,expireMonth) {\n");
			jsBuf.append("    this.offerCode = offerCode;\n");
			jsBuf.append("    this.price = price;\n");
			jsBuf.append("    this.cashPoint = cashPoint;\n");
			jsBuf.append("    this.expireMonth = expireMonth;\n");
			jsBuf.append("}\n");
			jsBuf.append("var planlist_arr = new Array();\n");

		List<ims.vi.common.service.client.CashPointTopUpPlan> planList = getCashPointTopUpPlanResponse.getTopUpPlans();
		int i = 0;

		for (ims.vi.common.service.client.CashPointTopUpPlan plan : planList) {
			jsBuf.append("planlist_arr["+ (i++) +"] = new planlist(\"" + plan.getOfferCode() + "\",\"" + plan.getPrice() + "\",\"" + plan.getCashPoint() + "\",\"" + plan.getExpiryMonth() + "\");\n");
		}
/*		while (i<4) {
			jsBuf.append("planlist_arr["+ (i++) +"] = new planlist(\"" + i + "\",\"" + i + "\",\"" + i + "\",\"" + i + "\");\n");
		}*/
%>
<script type="text/javascript">
<%=jsBuf.toString()%>
</script>
<%
	} else {
		String api = "getCashPointTopUpPlan";
		String respCode = getCashPointTopUpPlanResponse.getResponseCode().name();
%>
<script type="text/javascript">
	window.location = "error.jsp?api=<%=api%>&respcode=<%=respCode%>&<%=urlParam%>";
</script>
<%
		return;
	}
} else {
%>
<script type="text/javascript">
	window.location = "../error.jsp?<%=urlParam%>";
</script>
<%
	return;
}
%>
