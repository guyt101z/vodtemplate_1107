<%@page contentType="text/html; charset=big5" pageEncoding="big5"
import="com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper"
%>
<%
String stbId = request.getParameter("stbid");
String stbSid = request.getParameter("sid");

QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
boolean isAdultAdmissionAllowed = wrapper.isAdultAdmissionAllowed(stbId, stbSid);

response.sendRedirect("adultcheckingpin.jsp?isAdultAdmissionAllowed="+isAdultAdmissionAllowed+"&"+ request.getQueryString());
%>

