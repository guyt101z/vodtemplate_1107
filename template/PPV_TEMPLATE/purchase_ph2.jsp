<%@page contentType="text/html"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper, java.util.List"
%>
<%@include file="../../ppv_header.jsp"%>
<%
	String init_cur_option = request.getParameter("init_cur_option");
	String init_option_offset = request.getParameter("init_option_offset");
	String status = request.getParameter("status");
	String productId = request.getParameter("productid");
	String movieFormat = request.getParameter("movieformat");
	String price = request.getParameter("price");
	String cashPoint = request.getParameter("cashpoint");
	if("null".equals(cashPoint)||cashPoint == null || cashPoint.length() == 0){
		cashPoint = "-1";
	}
	String backURL = request.getParameter("referrer");
	String purchaseOther = request.getParameter("purchaseother");
	String cat = request.getParameter("cat");
	String expDayVal = request.getParameter("expdayval");

	String errorCode="";
	if(productId == null || productId.length() == 0){
		errorCode = "No product id";
	}
	String detail_include = "../../data/"+ppvVersion+"/"+subcustcat+"/PPV_MH_"+productId+"_EN.js";

%>
<%@include file="../../ppv_subheader.jsp"%>
<%@include file="qapi/getCashPointBalance.jsp"%>
<%@include file="qapi/getCashPointTopUpPlan.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title> PPV Purchase Menu </title>

		<link href="css/mh_style_e.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="file:////javascript/iptv.js"></script>
		<script language="javascript" src="../../js/common.js"></script>
    <script language="javascript">
    	var init_cur_option = parseInt("<%=init_cur_option%>",10);
    	var init_option_offset = parseInt("<%=init_option_offset%>",10);
    	var init_stat = "<%=status%>";
    	var backURL = "<%=backURL%>";
			var urlparam = "expdayval=<%=expDayVal%>&cat=<%=cat%>&productid=<%=productId%>&movieformat=<%=movieFormat%>&purchaseother=<%=purchaseOther%>&<%=urlParam%>";
			var price = "<%=price%>";
			if(price == "null"){
				price = "N/A";
			}
			var cashpoint = <%=cashPoint%>;
			var movieformat = "<%=movieFormat%>";
    </script>
		<script>
			<jsp:include page="<%=detail_include%>" />
	  </script>
		<script language="javascript">
			var cur_cash_point = "<%=cashPointBalance%>";
			var expiry_date = "<%=expiryDateString%>";
		</script>
		<script language="javascript" src="js/purchase/text.js"></script>
		<script language="javascript" src="js/purchase/common_layout.js"></script>
		<script language="javascript" src="js/purchase/pin_handler.js"></script>
		<script language="javascript" src="js/purchase/select_payment_method.js"></script>
		<script language="javascript" src="js/purchase/spend_cash_point.js"></script>
		<script language="javascript" src="js/purchase/spend_money.js"></script>
		<script language="javascript" src="js/purchase/select_plan.js"></script>
		<script language="javascript" src="js/purchase/top_up_and_deduction.js"></script>
		<script language="javascript" src="js/purchase/handler.js"></script>

	</head>

<body id="body_content" bgcolor="white" topmargin="0" leftmargin="0" class="bodyBg body_e" onLoad="load()">
</body>
</html>
