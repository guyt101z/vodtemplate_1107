<%@page contentType="text/html; charset=big5" pageEncoding="big5"%>
<!--%@include file="qapi/islibrarysubscribed.jsp"%-->
<%@include file="qapi/isViewableProduct.jsp"%>
<%
//String productId = request.getParameter("productid");
//String scheduleId = request.getParameter("scheduleid");
if(libSubscribed){
%>
	<script type="text/javascript">
	<!--
	window.location = "qapi/getsvod.jsp?productid=<%=productId%>&scheduleid=<%=scheduleId%>&verified=true&playonly=true&<%=urlParam%>";
	//-->
	</script>
<%
}
else{
%>
	<script type="text/javascript">
	<!--
	//window.location = "error.jsp?api=isLibrarySubscribed&respcode=BUY_PLAN&<%=urlParam%>";
	window.location = "qapi/getsvod.jsp?productid=<%=productId%>&scheduleid=<%=scheduleId%>&verified=true&playonly=false&<%=urlParam%>";
	//-->
	</script>
<%
}
%>