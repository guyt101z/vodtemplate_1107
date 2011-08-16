<%@page contentType="text/html; charset=big5" pageEncoding="big5"%>
<%@include file="svod_header.jsp"%>
<%
        String seriesId = request.getParameter("seriesid");
	String seriesIndex = request.getParameter("seriesindex");
        String seriesProductId = request.getParameter("seriesproductid");
        String backURL = request.getParameter("referrer");
        String detail_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+seriesId+".js";
        String cat_data_include = "../../data/"+catId+"/"+svodVersion+"/"+subcustcat+"/"+catId+"_CAT_1.js";
%>
<html>
	<head>
		<title></title>
		<meta http-equiv="Content-Type" content="text/html; charset=big5">
		<script language='JavaScript' src='file:////javascript/iptv.js'></script>
		<script language="javascript" src="js/common.js"></script>
		<script>
        	        <jsp:include page="<%=cat_data_include%>" />
                	<jsp:include page="<%=detail_include%>" />
	        </script>
		<script language='JavaScript'>
			var stbid = iptvGetSTBID();
			var seriesindex = "<%=seriesIndex%>";
			var language = "<%=language%>";
			if(window.name != "moviepage") iPanel.highlightFrame('programlist');

			function changeImage(filename) {
				if (stbid.indexOf("0015253") == 0) {
					//STB 5253
					document.images["episodeimage"].src = "/vod/poster/sd/en/"+filename;
					} else {
					//STB 6911 ok for below:
					document.getElementById("episodeimage").src="/vod/poster/sd/en/"+filename;
				}
			}

			function changeUpArrow(filename) {
				if (stbid.indexOf("0015253") == 0) {
					//STB 5253
					document.images["episodeimage"].src = "images/<%=styleId%>/"+filename;
					} else {
					//STB 6911 ok for below:
					document.getElementById("uparrow").src="images/<%=styleId%>/"+filename;
				}
			}

			function changeDownArrow(filename) {
				if (stbid.indexOf("0015253") == 0) {
					//STB 5253
					document.images["episodeimage"].src = "images/<%=styleId%>/"+filename;
					} else {
					//STB 6911 ok for below:
					document.getElementById("downarrow").src="images/<%=styleId%>/"+filename;
				}	
			}

			function changeClassification(class_type) {
				if (stbid.indexOf("0015253") == 0) {
					//STB 5253
					document.form1.class_type.value= '<%=new String(resource.getString("product.classification").getBytes("8859_1"),"Big5")%>' + class_type;
					} else {
					//STB 6911 ok for below:
						document.getElementById("class_type").innerHTML = '<%=new String(resource.getString("product.classification").getBytes("8859_1"),"Big5")%>' + class_type;
				}

			}

			function load(){
				var series_name = "";
				if (language == "zh_tw") {
					series_name = digestString(series_array[seriesindex].name_chi,56);
					if(series_name.length < 128) {
						series_name += "<br/>&nbsp;";
					} 
				} else {
					series_name = digestString(series_array[seriesindex].name_eng,37);
					if(series_name.length < 30) {
                                                series_name += "<br/>&nbsp;";
                                        }
				}
				document.getElementById("series_name").innerHTML = series_name;
			}

		</script>
		<style type="text/css">
                        .name {
                                word-wrap:break-word;
                        }
                </style>


	</head>
	<body  background="images/<%=styleId%>/<%=language%>/drama_detail.gif" text="#FFFFFF" onload="load()">
		<table width="640" border="0" align="left" cellpadding="0" cellspacing="0">
			<tr> 
				<td height="130" colspan="4"><img src="images/<%=styleId%>/null.gif" height="130"></td>
			</tr>
			<tr> 
				<td colspan="4" rowspan="5" valign="top">
					<table width="202" height="199" border="0" cellpadding="0" cellspacing="0">
						<tr> 
							<td width="18" rowspan="4"><img src="images/<%=styleId%>/null.gif" width="18"></td>
						</tr>
						<tr>
							<td width="191" height="156" valign="top" >
								<table><tr><td><img src="images/<%=styleId%>/null.gif" width="191" height="5"></td></tr>
									<tr><td><img id="episodeimage" src="" width="191" height="151"></td></tr>
								</table>  
							</td>
						</tr>
						<tr> 
							<td width="15" height="10"><img src="images/<%=styleId%>/null.gif" width="15" height="10"></td>
						</tr>
						<script language='JavaScript'>
							if (stbid.indexOf("0015253") == 0) {
								document.write("<tr>");
									document.write("<form name=\"form1\">");
										document.write("<td width=\"198\" align=\"center\" valign=\"top\">");
											document.write("<input type=\"text\" name=\"class_type\" disabled style=\"border-style: none;border-width: 0;\" value=\"\">");
											document.write("</td>");
										document.write("</form>");
									document.write("</tr>");
								} else {
								document.write("<tr>");
									document.write('<td width=\'198\' align=\'left\' valign=\'top\'><font id=\'class_type\' color=\'#FFFFFF\'><%=new String(resource.getString("product.classification").getBytes("8859_1"),"Big5")%></font></td>');
									document.write("</tr>");
							}
						</script>

					</table>	 
				</td>
				<td width="11" rowspan="6"><img src="images/<%=styleId%>/null.gif" width="11"></td>
				<td height="19" valign="middle"><font class="name" id="series_name" size="22" color="#000000">&nbsp;<br/>&nbsp;</font></td>
			</tr>
			<tr>
				<td height="20" align="center" valign="middle">
					<img id="uparrow" src="images/<%=styleId%>/arrowup_off.gif" width="256" height="20">
				</td>
			</tr>
			<tr>
				<td height="4" valign="middle"><img src="images/<%=styleId%>/null.gif" height="4"></td>
			</tr>
			<tr>
				<td width="400" height="210" colspan="5" rowspan="5" valign="top" align="center">
					<table border="0">
						<tr><td>
							<iframe name="programlist" src="seriesProgramList.jsp?<%=urlParam%>&seriesid=<%=seriesId%>&seriesindex=<%=seriesIndex%>" width="400" height="210"></iframe>
						</td></tr>
						<tr>
							<td height="3" valign="middle"><img src="images/<%=styleId%>/null.gif" height="3"></td>
						</tr>
						<tr><td align="center" valign="middle">
								<img id="downarrow" src="images/<%=styleId%>/arrowdown_off.gif" width="256" height="20"> 
						</td></tr>
					</table>
				</td>
			</tr>
			<tr> 
				<td height="100">&nbsp;</td>
			</tr>
			<tr> 
				<td width="4"  height="30">&nbsp;</td>
				<td width="6"  height="30">&nbsp;</td>

				<td width="4">&nbsp;</td>
			</tr>
			<tr> 
				<td height="40" colspan="3">&nbsp;</td>
				<td width="195">&nbsp;</td>
			</tr>
		</table>
	</body>
</html>
