<%

switch (respCode) {
	case SUCCESS:
		List <ims.vi.quadplay.VodCheckoutService.CheckoutInfo> listInfo = message.getEntity();
		for (ims.vi.quadplay.VodCheckoutService.CheckoutInfo checkoutInfo : listInfo) {
			if (movieRTSP.length() == 0) {
				movieRTSP += checkoutInfo.getRtspLink();
			} else {
				movieRTSP += ";" + checkoutInfo.getRtspLink();
			}
			bitRate = checkoutInfo.getBitRate();

		}
		%>
		<%@include file="../playframe.jsp"%>
		<%
		break;
	case BUY_PLAN:
		// go to plan list page
		%>
		<script type="text/javascript">
		<!--
		window.location = "../planlist.jsp?<%=urlParam%>";
		//-->
		</script>
		<%
		break;
	case NEED_TO_UNLOCK:
		// go to pin page
		%>
		<script language="javascript" src="file:////javascript/iptv.js"></script>
		<script type="text/javascript">
		<!--
		/**window.location = "../is_locked.jsp?<%=urlParam%>";**/
		if(<%=isPlayOnly%>){
			window.location = "../pin.jsp?verified=false&<%=urlParam%>";
		}
		else{
			window.location = "../thankyouwithpin.jsp?verified=false&<%=urlParam%>";
		}
		//-->
		</script>
		<%
		break;

	/*
	case ARMADA_FAIL:
	case ASSET_NOT_FOUND:
	case AUTO_SUB_FAIL:
	case BUY_THRU_FAIL:
	case DEPENDENCY_FAIL:
	case EMPTY_RTSP_LINK:
	case EXTERNAL_CALL_ERROR:
	case GENERAL_ERROR:
	case INTERNAL_ERROR:
	case INVALID_PROFILE:
	case INVALID_SERVICETYPE:
	case LICENSE_FAIL:
	case NULL_CHECK_SUBSCRIBE_TYPE:
	case PRODUCT_NOT_FOUND:
	case SD_PROFILE_PLAY_HD:
	case SUSPEND:
	case TERMINATE:
	case SDX_FAIL:
	*/
	default:

		String api = "getSVODUrl";
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
