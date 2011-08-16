<%

switch (respCode) {
	case SUCCESS:
		List<ims.vi.quadplay.MovieHouseCheckoutService.CheckoutInfo> listInfo1 = message
				.getEntity();
		for (ims.vi.quadplay.MovieHouseCheckoutService.CheckoutInfo checkoutInfo : listInfo1) {
			if (movieRTSP.length() == 0) {
				movieRTSP += checkoutInfo.getRtspLink();
			} else {
				movieRTSP += ";" + checkoutInfo.getRtspLink();
			}
			bitRate = checkoutInfo.getBitRate();
		}
		String inRTSP = URLEncoder.encode(movieRTSP, "US-ASCII");
		if (isPlayOnly) {
		%>
		<%@include file="../playframe.jsp"%>
		<%
		}
		else {
		%>
		<script type="text/javascript">
		<!--
		window.location = "../thankyou.jsp?inrtsp=<%=inRTSP%>&bitrate=<%=bitRate%>&<%=urlParam%>";
		//-->
		</script>
		<%
		}
		break;
	case NEED_TO_UNLOCK:
		// go to pin page
		if (isPlayOnly) {
		%>
		<script type="text/javascript">
		<!--
		window.location = "../pin.jsp?<%=urlParam%>";
		//-->
		</script>
		<%
		}
		else {
		%>
		<script type="text/javascript">
		<!--
		window.location = "../thankyouwithpin.jsp?<%=urlParam%>";
		//-->
		</script>
		<%
		}
		break;
	default:
		String api = "getPPVVodUrl";
		String respCodeStr = respCode.toString();
		%>
		<script type="text/javascript">
		<!--
		window.location = "../error.jsp?api=<%=api%>&respcode=<%=respCodeStr%>&<%=urlParam%>";
		//-->
		</script>
		<%
		break;
}
%>
