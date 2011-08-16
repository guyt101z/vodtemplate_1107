<%
if("true".equalsIgnoreCase(doTopUp)){
ims.vi.common.service.client.TopUpCashPointResponse topUpCashPointResponse = wrapper.topUpCashPoint(stbId, stbSid, topUpOfferCode, balance);

if (topUpCashPointResponse != null) {
	if (topUpCashPointResponse.getResponseCode() != ims.vi.common.service.client.enums.RestServerResponseCode.SUCCESS) {
		String api = "topUpCashPoint";
		String respCode = topUpCashPointResponse.getResponseCode().name();
%>
<script type="text/javascript">
	window.location = "/vod/moviehouse/en/ppv/error.jsp?api=<%=api%>&respcode=<%=respCode%>&<%=urlParam%>";
</script>
<%
		return;
	}
} else {
%>
<script type="text/javascript">
	window.location = "/vod/moviehouse/en/ppv/error.jsp?<%=urlParam%>";
</script>
<%
	return;
}
}
%>
