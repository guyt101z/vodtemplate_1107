<%@page contentType="text/html; charset=big5" pageEncoding="big5" 
import="ims.vi.quadplay.CommonProfileService.Profile, com.pccw.hkt.nowtv.quadplay.QuadPlayServiceWrapper"
%>

<%
	String stbId = request.getParameter("stbid");
	String stbSid = request.getParameter("stbsid");
	String catId = request.getParameter("catId");
	QuadPlayServiceWrapper wrapper = new QuadPlayServiceWrapper();
	Profile profile = wrapper.getProfileByStbInfoWS(stbId, stbSid);
	String subCustCat = "";
	try {
		subCustCat = profile.getSubCustCat();
	} catch (Exception e) {
		subCustCat = "RESLAM";
	}
	String cat = request.getParameter("cat");
	if(cat == null || "null".equals(cat) || cat.length() == 0){
		cat = "1";
	}
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=big5" />
	<title> New Document </title>
	
	<script language="javascript" src="file:////javascript/iptv.js"></script>
	
	<script language="javascript" src="../data/version.js"></script>
	
	<script language="javascript">
	iptvPauseVideo(true);
	var genreid, enName, cnName;
	function Genre(genreid, enName, cnName)
	{
		this.genreid=genreid;
		this.enName=enName;
		this.cnName=cnName;
	}

	var libid, enImageName, cnImageName, imageUri;
	function Library(libid, enImageName, cnImageName, imageUri)
	{
		this.libid=libid;
		this.enImageName=enImageName;
		this.cnImageName=cnImageName;
		this.imageUri=imageUri;
	}
	</script>
	
	<script language="javascript">
		document.write("<script language='javascript' src='../data/" + version + "/<%=subCustCat%>/Genre.js'><\/script>");
	</script>
	
	<script language="javascript">
		//var cat_genre = iptvGetNonVolatileData("genre");
		cat_genre = "<%=cat%>";
		var catId = "<%=catId%>";
		if (catId != "null" && catId != "") {
			for (var i = 1; i < genre_list.length; i++){
				if (catId == genre_list[i].genreid) {
					cat_genre = (i+1).toString();
					break;
				}
			}
		}
		if (cat_genre != null && cat_genre != "undefined" && !isNaN(cat_genre.charCodeAt(0)))	{
			cat_pos = cat_genre;
		} else {
			cat_pos = "1";
		}
	</script>
	
	<script language="javascript">
		document.write("<script language='javascript' src='../data/" + version + "/<%=subCustCat%>/" + genre_list[cat_pos-1].genreid + ".js'><\/script>");
	</script>
	
	<script language="javascript">
		var grid_pos = 0;
		var grid_offset = 0;
		var page_pos = 1;
		var k = -1;
	</script>
		
	<script language="javascript" src="../js/vodlanding.js"></script>
    <link href="../stylesheet/mh_style_e.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="black" topmargin="0" leftmargin="0" class="bodyBg2 body_e" onload="load();">
	<table width="640" height="530" cellpadding="0" cellspacing="0" border="0">
		<!-- The first tr -->
		<tr>
        	<td valign="top" width="175" height="495"><!-- left table -->
            	<table border="0" cellpadding="0" cellspacing="0">
                
                  <tr>
                    	<td width="175" height="102" class=""><img id="nowselectlogo" width="175" height="102"></td>
                  </tr>
                  
                  <!-- left table - category -->
                    <tr>
                    	<td valign="top" width="175" height="350">
							
           	  <table border="0" width="175" cellpadding="0" cellspacing="0">
                            	<tr id="leftslot1" class="cateUnSelect">
                                	<td width="34" height="35" class="paddingleft13"><img id="leftgfx1" border="0" src="../images/svod_cat1_nor.gif"></td>
                               	  	<td width="141" height="35" class="paddingLeft6" id="lefttxt1"></td>
                </tr>
                            	<tr id="leftslot2" class="cateUnSelect">
                                	<td class="paddingLeft13" height="35"><img id="leftgfx2" border="0" src="../images/svod_cat2_nor.gif"></td>
                                	<td class="paddingLeft6" height="35" id="lefttxt2"></td>
                </tr>
                            	<tr id="leftslot3" class="cateUnSelect">
                                	<td class="paddingLeft13" height="35"><img id="leftgfx3" border="0" src="../images/svod_cat3_nor.gif"></td>
                                	<td class="paddingLeft6" height="35" id="lefttxt3"></td>
                </tr>
                            	<tr id="leftslot4" class="cateUnSelect">
                                	<td class="paddingLeft13" height="35"><img id="leftgfx4" border="0" src="../images/svod_cat4_nor.gif"></td>
                                	<td class="paddingLeft6" height="35" id="lefttxt4"></td>
                </tr>
                            	<tr id="leftslot5" class="cateUnSelect">
                                	<td class="paddingLeft13" height="35"><img id="leftgfx5" border="0" src="../images/svod_cat5_nor.gif"></td>
                                	<td class="paddingLeft6" height="35" id="lefttxt5"></td>
                </tr>
                            	<tr id="leftslot6" class="cateUnSelect">
                                	<td class="paddingLeft13" height="35"><img id="leftgfx6" border="0" src="../images/svod_cat6_nor.gif"></td>
                                	<td class="paddingLeft6" height="35" id="lefttxt6"></td>
                </tr>
                            	<tr id="leftslot7" class="cateUnSelect">
                                	<td class="paddingLeft13" height="35"><img id="leftgfx7" border="0" src="../images/svod_cat7_nor.gif"></td>
                                	<td class="paddingLeft6" height="35" id="lefttxt7"></td>
                </tr>
                            	<tr id="leftslot8" class="cateUnSelect">
                                	<td class="paddingLeft13" height="35"><img id="leftgfx8" border="0" src="../images/svod_cat8_nor.gif"></td>
                                	<td class="paddingLeft6" height="35" id="lefttxt8"></td>
                </tr>
                            	<tr id="leftslot9" class="cateUnSelect">
                                	<td class="paddingLeft13" height="35"><img id="leftgfx9" border="0" src="../images/svod_cat9_nor.gif"></td>
                                	<td class="paddingLeft6" height="35" id="lefttxt9"></td>
                </tr>
                                <tr id="leftslot10" class="cateUnSelect">
                                	<td class="paddingLeft13" height="35"><img id="leftgfx10" border="0" src="../images/svod_cat10_nor.gif"></td>
                                	<td class="paddingLeft6" height="35" id="lefttxt10"></td>
                </tr>
                            </table>                        
                      </td>
                  </tr>
                    <tr>
                    	<td width="175" height="43" class="txtInfo01 paddingLeft10"></td>
                    </tr>
                    
                </table>
          </td>

		
            <td valign="top" width="465" height="495"><!-- right table -->
            
            <!-- section A -->
            <table border="0" cellpadding="0" cellspacing="0">
                      
                <tr>
                    <td valign="top" width="465" height="91">
                    
                    
                          <table border="0" cellpadding="0" cellspacing="0">
                             <tr>
                                <td height="43"><img id="back" width="465" height="43"></td>
                             </tr>
                             
                             <tr>
                                <td height="28"><img id="steps" width="465" height="28" src=""></td>
                             </tr>
                             
                             <tr>
                                <td height="20"><img id="uplogo" width="465" height="20"></td>
                             </tr>
                          </table> 
                          
                    </td>
                 </tr> 
                 
                 <!-- section B --> 
                 <tr>
                 
                 
                     <td width="474" height="371">
                          <table border="0" cellpadding="0" cellspacing="0">
                          
                          
                          
                 <!--1--><td width="20" height="371">
                                <table width="20" height="371" cellpadding="0" cellspacing="0" border="0">
                                
                                     <tr>
                                        <td height="125"></td>
                                           </tr>
                                     <tr>
                                         <td align="right" height="120"><!--img src="../images/test_previous_dim.gif" width="20" height="120" border="0"--></td>
                                           </tr>
                                           
                                     <tr>
                                        <td height="126"></td>
                                           </tr>
                                        
                                          
                                      </table>
                                             </td>
                     
                 <!--2--><td rowspan="7" width="5"></td>
                              
                 <!--3--><td width="397" height="371">
                                                              
                                  <table width="397" height="371" cellpadding="0" cellspacing="0" border="0">
                                  
                                             <tr> <!--CP row1-->
                                               <td valign="top" width="129" height="89">
                                                 <table id="rightslot0" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx0" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                               </td>
                                    
                                               <td width="5"></td>
                                    
                                               <td valign="top"width="129" height="89" >
                                                 <table id="rightslot1" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx1" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                               </td>
                                    
                                               <td width="5"></td>
                                    
                                               <td valign="top"width="129" height="89">
                                                 <table id="rightslot2" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx2" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                                </td>
                                              </tr>
                                              
                                              
                                              <tr> <!--CP row2-->
                                               <td valign="top" width="129" height="89">
                                                 <table id="rightslot3" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx3" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                               </td>
                                    
                                               <td width="5"></td>
                                    
                                               <td valign="top" width="129" height="89" >
                                                 <table id="rightslot4" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx4" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                               </td>
                                    
                                               <td width="5"></td>
                                    
                                               <td valign="top"width="129" height="89">
                                                 <table id="rightslot5" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx5" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                                </td>
                                              </tr>
                                              
                                              
                                              
                                             <tr> <!--CP row3-->
                                               <td valign="top" width="129" height="89">
                                                 <table id="rightslot6" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx6" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                               </td>
                                    
                                               <td width="5"></td>
                                    
                                               <td valign="top"width="129" height="89" >
                                                 <table id="rightslot7" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx7" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                               </td>
                                    
                                               <td width="5"></td>
                                    
                                               <td valign="top"width="129" height="89">
                                                 <table id="rightslot8" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx8" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                                </td>
                                              </tr>
                                              
                                              
                                              
                                             <tr> <!--CP row4-->
                                               <td valign="top" width="129" height="89">
                                                 <table id="rightslot9" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx9" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                               </td>
                                    
                                               <td width="5"></td>
                                    
                                               <td valign="top"width="129" height="89" >
                                                 <table id="rightslot10" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx10" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                               </td>
                                    
                                               <td width="5"></td>
                                    
                                               <td valign="top"width="129" height="89">
                                                 <table id="rightslot11" width="129" height="89" cellpadding="0" cellspacing="0" border="0" class="unmovieSelect">
                                                    <tr><td><img id="rightgfx11" src="" width="129" height="89"  border="0"></td></tr>
                                                    <tr><td height="0"></td></tr>
                                                 </table>
                                                </td>
                                              </tr>
                                        </table>
                                      </td>     
                   <!--4--><td rowspan="7" width="5"></td>
                           
                                               
                   <!--5--><td width="38" height="371" align="right">
                                  <table width="38" height="371" cellpadding="0" cellspacing="0" border="0">
                                  
                                  <tr>
                                        <td height="125"></td>
                                           </tr>
                                     <tr>
                                         <td align="left" height="120"><!--img src="../images/test_next_light.gif" width="20" height="120" border="0"--></td>
                                           </tr>
                                           
                                     <tr>
                                        <td height="126"></td>
                                           </tr>
                                           
                                        </table>
                                               </td>
                                               
                           </table>
                       </td>
                       
                  </tr>
                  
                                
                 <!-- section C -->               
                   <tr>
                           <td width="465" height="33"><img id="downlogo"></td>    
                   </tr>
                   

                    </table><!-- close right table -->   
                   </td>   
               
        </tr><!-- close the first tr --> 
        
        
		<!-- footer -->
		<tr>
        	<td id="footer_img" colspan="4" width="640" height="35">
              </td>
                </tr>
            
            
	</table>
</body>
</html>


