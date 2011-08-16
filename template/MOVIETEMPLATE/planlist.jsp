<%@page contentType="text/html; charset=big5" pageEncoding="big5"
import="org.apache.log4j.*,
		ims.vi.quadplay.CommonProfileService.Profile,
		com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper,
		ims.vi.quadplay.SubscriptionService.ChannelAvailablePlans,
		ims.vi.quadplay.SubscriptionService.SubscriptionComboPlan,
		ims.vi.quadplay.SubscriptionService.SubscriptionIndividualPlan,
		java.util.List"
%>
<%@include file="svod_header.jsp"%>
<%
Logger logger;

logger = Logger.getLogger("planlist.jsp");

String productId = request.getParameter("productid");
String seriesProductId = request.getParameter("seriesproductid");
String seriesId = request.getParameter("seriesid");
String scheduleId = request.getParameter("scheduleid");
String cat = request.getParameter("cat");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=big5" />
	<title> New Document </title>

    <link href="css/<%=styleId%>/mh_style_e.css" rel="stylesheet" type="text/css">

    <script language="javascript" src="file:////javascript/iptv.js"></script>
	<script language="javascript" src="js/common.js"></script>
<%
QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();

ChannelAvailablePlans channelAvailablePlans = null;
String cat_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+".js";
String cat_data_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+"_CAT_"+cat+".js";
try {
	channelAvailablePlans = wrapper.getPlanList(fsa, libId, language);
} catch (ims.vi.quadplay.SubscriptionService.APIWebServiceException_Exception e) {
	logger.info("getPlanList error [" + e.getFaultInfo().getResponseCode()+ "]");

	String api = "getPlanList";
	String respCode = e.getFaultInfo().getResponseCode().toString();

	%>
	<script type="text/javascript">
	<!--
	window.parent.location.href = "error.jsp?api=<%=api%>&respcode=<%=respCode%>&<%=urlParam%>";
	//-->
	</script>
<%
	return;
}
%>
    <script language="javascript">
    	var urlparam = "cat=<%=cat%>&scheduleid=<%=scheduleId%>&<%=urlParam%>";
	var productId = "<%=productId%>";
	var seriesId = "<%=seriesId%>";
	var seriesProductId = "<%=seriesProductId%>";
	if (seriesId != "" && seriesId != "null") {
		urlparam += "&seriesid="+seriesId+"&seriesproductid="+seriesProductId;
	}
	else {
		urlparam += "&productid="+productId;
	}
    	function Plan(){
    		var code;
    		var price;
    		var campaign;
    		var desc;
    	}
    		var PlanArray = new Array();
<%
if(channelAvailablePlans != null) {
	int i=0;
	if (channelAvailablePlans.getSubscriptionIndividualPlan() != null) {
			List<SubscriptionIndividualPlan> planLst = channelAvailablePlans.getSubscriptionIndividualPlan();
			for (SubscriptionIndividualPlan plan : planLst) {
				String campaginCode = null;
				if (plan.getCampaign()!= null) {
					campaginCode = java.net.URLEncoder.encode(plan.getCampaign(), "utf-8");
				} else {
					campaginCode = "NULL";
				}

			%>
				PlanArray[<%=i%>] = new Plan();
				PlanArray[<%=i%>].code = "<%=plan.getPlanCode()%>";
				PlanArray[<%=i%>].price = "<%=plan.getPrice()%>";
				PlanArray[<%=i%>].campaign = "<%=campaginCode%>";
				PlanArray[<%=i%>].desc = "<%=plan.getDescription()%>";
			<%
				i++;
			}
	}
	if (channelAvailablePlans.getSubscriptionComboPlan() != null) {
		List<SubscriptionComboPlan> cplanLst = channelAvailablePlans.getSubscriptionComboPlan();
		for (SubscriptionComboPlan plan : cplanLst) {
			%>
				PlanArray[<%=i%>] = new Plan();
				PlanArray[<%=i%>].code = "<%=plan.getPlanCode()%>";
				PlanArray[<%=i%>].price = "<%=plan.getPrice()%>";
				PlanArray[<%=i%>].campaign = "<%=java.net.URLEncoder.encode(plan.getCampaign(), "utf-8")%>";
				PlanArray[<%=i%>].desc = "<%=plan.getDescription()%>";
			<%
				i++;
		}
	}
}

%>
	var language = "<%=language%>";
	var catId = "<%=catId%>";
	var styleId = "<%=styleId%>";
	var planlist_disclaimer = '<%=new String(resource.getString("planlist.disclaimer").getBytes("8859_1"),"Big5")%>';
	var bottom_disclaimer = '<%=new String(resource.getString("planlist.bottom_disclaimer").getBytes("8859_1"),"Big5")%>';
    </script>
	<script>
		<jsp:include page="<%=cat_include%>" />
		<jsp:include page="<%=cat_data_include%>" />
	</script>
	<script language="javascript" src="js/planlist.js"></script>
</head>

<body bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e" onload="load()">
	<table width="640" height="530" cellpadding="0" cellspacing="0" border="0">
		<!-- left table -->
		<tr>
        	<td width="165" height="495">
            	<table border="0" cellpadding="0" cellspacing="0" align="right">
                	<tr>
                    	<td width="165" height="70" class="logo"><img id="logo" width="145" height="52" align="top" src=""></td>
                    </tr>
                    <tr>
                    	<td valign="top" width="165" height="365">
							<!-- left table text -->
                        	<table border="0" cellpadding="0" cellspacing="0">
                        		<tr>
                        				<td height="20"></td>
                        			</tr>
                            	<tr>
									<td id="planlist_disclaimer" height="338" class="termConditionTxt paddingLeft13"></td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                    <tr>
                    	<td width="165" height="60" class="txtInfo01 paddingLeft10"><%=new String(resource.getString("planlist.select").getBytes("8859_1"),"Big5")%>
						</td>
                    </tr>

                </table>
            </td>

		<!-- right table -->
            <td width="475" height="495">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="36">
							<img width="475" height="36" border="0" src="images/<%=styleId%>/<%=language%>/back_exit.png">
						</td>
                    </tr>
                    <tr>
                      <td height="264">
                            <table border="0" cellpadding="0" cellspacing="0" align="right">
                                <tr>
                                        <td colspan="4" height="4"></td>
                                </tr>
                                <tr class="headerPlaylist">
                                        <td width="37" height="41"></td>
                                        <td width="262" height="41"><%=new String(resource.getString("planlist.plan_title").getBytes("8859_1"),"Big5")%></td>
                                        <td width="160" height="41">
											<span class="paddingLeft10"><%=new String(resource.getString("planlist.price_title").getBytes("8859_1"),"Big5")%></span>
										</td>
                                        <td width="15" height="41"></td>
                                </tr>
                                <tr id="bar0" class="unselectPlaylist">
                                        <td width="37" height="46"><img id="arrow0" src=""></td>
                                        <td width="262" height="46"><img id="radio0" src="images/spacer.gif"><span id="plan0" class="paddingLeft10"></span></td>
                                        <td width="160" height="46"><span id="price0" class="paddingLeft10"></span></td>
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="bar1" class="unselectPlaylist">
                                        <td width="37" height="46"><img id="arrow1" src=""></td>
                                        <td width="262" height="46"><img id="radio1" src="images/spacer.gif"><span id="plan1" class="paddingLeft10"></span></td>
                                        <td width="160" height="46"><span id="price1" class="paddingLeft10"></span></td>
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr id="bar2" class="unselectPlaylist">
                                        <td width="37" height="46"><img id="arrow2" src=""></td>
                                        <td width="262" height="46"><img id="radio2" src="images/spacer.gif"><span id="plan2" class="paddingLeft10"></span></td>
                                        <td width="160" height="46"><span id="price2" class="paddingLeft10"></span></td>
                                        <td width="15" height="46"></td>
                                </tr>
                                <tr>
                                        <td width="37" height="81"></td>
                                        <td width="262" height="81"></td>
                                        <td width="160" height="81"></td>
                                        <td width="15" height="81"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                    	<td height="124">
                            <table width="474" border="0" cellpadding="0" cellspacing="0" align="right">
                                <tr>
                                    <td height="18" colspan="2"> </td>
                                </tr>
                                <tr>
                                    <td height="32" colspan="2"><span class="paddingLeft18 txtInfo02"><%=new String(resource.getString("planlist.non_refund").getBytes("8859_1"),"Big5")%></span></td>
                                </tr>
                                <tr>
                                    <td height="44" width="268" class="paddingLeft18 txtInfo05"><%=new String(resource.getString("planlist.continue").getBytes("8859_1"),"Big5")%></td>
                                    <td width="206"> <!--<img id="pin" width="181" height="38" src="images/star_0.png">-->
										<table border="0" cellpadding="0" cellspacing="0"  width="206" height="44" class="inputBox">
                                        	<tr>
                                            	<td width="22"></td>
                                            	<td width="39"><img id="pin1" style="z-index:1" width="19" height="17" src=""></td>
                                            	<td width="39"><img id="pin2" style="z-index:1" width="19" height="17" src=""></td>
                                            	<td width="39"><img id="pin3" style="z-index:1" width="19" height="17" src=""></td>
                                            	<td width="39"><img id="pin4" style="z-index:1" width="19" height="17" src=""></td>
                                            	<td width="28"></td>
                                            </tr>
                                        </table>
									</td>
                                </tr>
                                <tr>
                                    <td id="errorMsg" height="20" colspan="2" class="paddingLeft18 txtInvalid"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td id="disclaimer" height="63" class="txtInfo02 paddingLeft18 paddingRight50"></td>
                    </tr>
                    <!--tr height="5">
                    	<td height="5" colspan="3"></td>
                    </tr-->
                </table>
	        </td>
        </tr>

		<!-- footer -->
		<tr>
			<td colspan="2" width="640" height="35" background="images/<%=styleId%>/<%=language%>/footer_class_tc.jpg">
		<!-- pages indicator -->
                <!--table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="483"></td>
                        <td width="25"><img width="25" height="35" src="images/pagearrow_left_dim.png"></td>
                        <td width="94" class="pageNum">1/20</td>
                        <td width="25"><img width="25" height="35" src="images/pagearrow_right.png"></td>
                        <td width="13"></td>
                    </tr>
                </table-->
			</td>
        </tr>
	</table>
</body>
</html>


