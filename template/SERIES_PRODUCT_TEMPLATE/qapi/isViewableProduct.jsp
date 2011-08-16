<%@page import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper"%>
<%@include file="../svod_header.jsp"%>
<%
QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();

String ipAddr = request.getRemoteAddr();
String scheduleId = request.getParameter("scheduleid");
String deviceType = "TVPORTAL";
String seriesProductId = request.getParameter("seriesproductid");

System.out.println("!!!!!!!!!!!!!!!!!!!! "+stbId, stbSid, ipAddr, seriesProductId, libId, scheduleId, deviceType);

ims.vi.quadplay.VodCheckoutService.SuccessFailMessage message = wrapper.isViewableProduct(stbId, stbSid, ipAddr, seriesProductId, libId, scheduleId, deviceType);
boolean libSubscribed = false;

if (message!=null){
        ims.vi.quadplay.VodCheckoutService.ResponseCode respCode = message.getResponseCode();
	System.out.println(respCode+" !!!!!!!!!!!!!!!!!!!!!!!");
	switch (respCode) {
		case BUY_PLAN:
		// go to plan list page
			libSubscribed = false;	
		break;

	/*
	case SUCCESS:
	case NEED_TO_UNLOCK:
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
			libSubscribed = true;
		break;
	}
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
