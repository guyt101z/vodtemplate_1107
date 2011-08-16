<%@ page contentType = "text/html; charset=Big5" %>
<%@ page import ="java.io.FileOutputStream" %>
<%@ page import ="java.io.ByteArrayOutputStream" %>
<%@ page import ="java.io.InputStream" %>
<%@ page import ="java.net.URL" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="ims.vi.portal.util.AppLog" %>
<%@ page import ="ims.vi.portal.bean.VODScheduleBean" %>
<%@ page import ="ims.vi.portal.bean.ProfileBean" %>
<%@ page import ="ims.vi.portal.dao.VIDao" %>
<%@ page import ="ims.vi.portal.handler.SVODSubscriptionHandler" %>
<%@ page import ="ims.vi.portal.dao.SVODSubscriptionDAO" %>
<%@ page import="org.apache.commons.lang.ArrayUtils" %>
<%@ include file="../config/config.jsp" %>
<%!
	
	public void writeBytesToFile(byte[] b,String path) throws Exception
	{	
		AppLog.logUser("writting file: " + path);
		AppLog.logUser("writting file with size: " + b.length);

		FileOutputStream fos = new FileOutputStream(path);
		fos.write(b,0,b.length);
		fos.flush();
		fos.close();
	}
	public byte[] getContent(String urlStr) throws Exception
	{
		int retrieved;
		byte[] res = null;
		byte[] b = new byte[1000];
		URL url = null;
		ByteArrayOutputStream bros = null;
		InputStream urlIs = null;
		
		try
		{
	
			AppLog.logUser("getting url: " + urlStr);
		
			url = new URL(urlStr);
			bros = new ByteArrayOutputStream();
			urlIs = url.openStream();
			
			while((retrieved = urlIs.read(b,0,1000)) > -1)
			{
				bros.write(b, 0, retrieved);
			}
			
			res = bros.toByteArray();
			
			AppLog.logUser("retrieved size: " + res.length);
		}
		catch(Exception e)
		{
			throw e; 
		}
		finally
		{
			if(bros != null)
			{
				bros.close();
			}
			if(urlIs != null)
			{
				urlIs.close();
			}
		}
		return res;
	}
	public String getStartTime(HttpServletRequest request)
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String starttime = request.getParameter("stime");
		if(starttime == null || starttime.length() < 8)
		{
			starttime = sdf.format(Calendar.getInstance().getTime());
		}
		else if(starttime.length() > 8)
		{
			starttime = starttime.substring(0,8);
		}
		
		return starttime;
	}
	
	public String getPoster(String src)
	{
		if(src != null && !src.equals(""))
		{
			return src;
		}
		else
		{
			return "now-SelectPoster.jpg";
		}
	}
	
	public ArrayList removeOutDateSchedule(ArrayList vodScheduleBeanAL, String stime, String endTime) {
		
		VODScheduleBean vsBean;
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
		Date deadline;
		Date currentTime;
		
		try {
			currentTime = Calendar.getInstance().getTime();
			deadline = sdf1.parse(stime+endTime);
			AppLog.logDebug("deadline="+deadline+",currentTime="+currentTime);
			
			Iterator it = vodScheduleBeanAL.iterator();
  		while (it.hasNext()) {
				vsBean = (VODScheduleBean)it.next();
				Date scheduleEndDate = sdf2.parse(vsBean.getEND_DATE());
				AppLog.logUser("scheduleEndDate="+scheduleEndDate);
				if (deadline.getYear() == scheduleEndDate.getYear() && deadline.getMonth() == scheduleEndDate.getMonth() 
					&& deadline.getDate() == scheduleEndDate.getDate() && currentTime.after(deadline)) {
					AppLog.logUser("remove match "+ vsBean.getNAME_ENG());
					it.remove();
				}
			}
			
		} catch (Exception e) {
			AppLog.logUser("removeOutDateSchedule Exception: " + e);
		}
		return vodScheduleBeanAL;
	}
	
	public boolean isValidCVISubCustCat(String subCustCat) {
		for(int i=0; i<validCVISubCustCat.length; i++) {
			if (subCustCat != null && subCustCat.equals(validCVISubCustCat[i])) return true;
		}
		return false;
	}
	
	public boolean isValidRESSubCustCat(String subCustCat) {
		for(int i=0; i<validRESSubCustCat.length; i++) {
			if (subCustCat != null && subCustCat.equals(validRESSubCustCat[i])) return true;
		}
		return false;
	}
	
	//return variables	
	public static final int NON_RES_PROFILE = 0;
	public static final int INACTIVE_PROFILE = 1;
	public static final int ERROR_BUY_THRU = 2;
	public static final int HAVE_SUBSCRIBE = 3;
	public static final int NOT_SUBSCRIBE = 4;
	public static final int FREE_VIEW = 5;
	public static final int NULL_PROFILE = 6;	
	public static final int NON_CVI_PROFILE = 7;
	public static final int NOT_SUBSCRIBE_CVI = 8;
	public static final int NOT_SUBSCRIBE_RVI = 9;
		
	public int checkSubscription(HttpServletRequest request, String stbid, String vod_library_id) throws Exception {
	
		VIDao viDAO = null;
		SVODSubscriptionHandler sVODSubscriptionHandler = null;
		ProfileBean profileBean = null;
		boolean isSubscribed = false;
		
		try {
			viDAO = new VIDao();
			sVODSubscriptionHandler = new SVODSubscriptionHandler();
			profileBean = viDAO.getProfile(request, stbid);
			if (profileBean == null) {
				return NULL_PROFILE;
			} else if (!"ACTIVE".equals(profileBean.getSTATUS())) {
				return INACTIVE_PROFILE;
			} else if ("BUS".equals(profileBean.getCUST_CAT()) && !isValidCVISubCustCat(profileBean.getSUB_CUST_CAT())) {
				return NON_CVI_PROFILE;
			} else if ("RES".equals(profileBean.getCUST_CAT()) && !isValidRESSubCustCat(profileBean.getSUB_CUST_CAT())) {
				return NON_RES_PROFILE;
			}

			if(isBuyThruPass(request, profileBean.getFSA(), buyThruChannel)) {
				AppLog.logInfo("checkSubscription : return HAVE_SUBSCRIBE");
				return HAVE_SUBSCRIBE;
			}

		}catch(Exception e) {
			AppLog.logError("ATP [check_subscription.jsp] Error: "+e.toString());
			throw new Exception();
		} finally {
			
		}	

		//return NOT_SUBSCRIBE;
		if (profileBean.getCUST_CAT().equals("BUS")) {
			return NOT_SUBSCRIBE_CVI;
		}

		return NOT_SUBSCRIBE_RVI;
	}
/*
	public int checkHDSubscription(HttpServletRequest request, String stbid, String vod_library_id) throws Exception {
	
		VIDao viDAO = null;
		SVODSubscriptionHandler sVODSubscriptionHandler = null;
		ProfileBean profileBean = null;
		boolean isSubscribed = false;
		
		try {
			viDAO = new VIDao();
			sVODSubscriptionHandler = new SVODSubscriptionHandler();
			profileBean = viDAO.getProfile(request, stbid);
			if (profileBean == null) {
				return NULL_PROFILE;
			} else if (!"ACTIVE".equals(profileBean.getSTATUS())) {
				return INACTIVE_PROFILE;
			} else if ("BUS".equals(profileBean.getCUST_CAT()) && !isValidCVISubCustCat(profileBean.getSUB_CUST_CAT())) {
				return NON_CVI_PROFILE;
			} else if ("RES".equals(profileBean.getCUST_CAT()) && !isValidRESSubCustCat(profileBean.getSUB_CUST_CAT())) {
				return NON_RES_PROFILE;
			}

			if(isBuyThruPass(request, profileBean.getFSA(), hdBuyThruChannel)) {
				AppLog.logInfo("checkHDSubscription : return HAVE_SUBSCRIBE");
				return HAVE_SUBSCRIBE;
			}

		}catch(Exception e) {
			AppLog.logError("ATP [check_subscription.jsp] Error: "+e.toString());
			throw new Exception();
		} finally {
			
		}

		if (profileBean.getCUST_CAT().equals("BUS")) {
			return NOT_SUBSCRIBE_CVI;
		}

		return NOT_SUBSCRIBE_RVI;
	}
*/
	public boolean isBuyThruPass(HttpServletRequest request, String fsa, String channels) throws Exception {
	
		AppLog.logInfo("isBuyThruPass : entering...");
		
		ArrayList subChannelList = null;
		int matchCnt = 0;
		String[] buyThruChannels;
		
		SVODSubscriptionHandler	sVODSubscriptionHandler = new SVODSubscriptionHandler();
		SVODSubscriptionDAO sVODSubscriptionDAO = new SVODSubscriptionDAO();
			
		try {
			if (fsa == null || channels == null) {
				AppLog.logInfo("isBuyThruPass : return false: fsa or channels is null");
				return false;
			}
		
			buyThruChannels = channels.split(",");
			
			subChannelList = sVODSubscriptionDAO.getSubChannels(request, fsa);
			if (subChannelList==null) {
				AppLog.logInfo("isBuyThruPass : return false: subChannelList is null");
				return false;
			}
			
			for(int i = 0; i < buyThruChannels.length; i++) {
				AppLog.logInfo("isBuyThruPass : check channel: "+buyThruChannels[i]);
	      if(subChannelList.contains(buyThruChannels[i])) {
	      	AppLog.logInfo("isBuyThruPass : channel "+buyThruChannels[i]+ " passed!");
	      	matchCnt++;
				}
			}
			AppLog.logInfo("isBuyThruPass : matchCnt="+ matchCnt + ", buyThruChannels.length="+buyThruChannels.length);
			if (matchCnt != buyThruChannels.length) {
				return false;
			}
			/*
			if (sVODSubscriptionHandler.isPostTermination(request, fsa, channels)) {
				AppLog.logInfo("isBuyThruPass : return false: Post Term Found in channels"+ channels);
				return false;
			}
			*/

		} catch (Exception e) {
			AppLog.logError("ATP [check_subscription.jsp] Error: "+e.toString());
			return false;
		} finally {
			
		}
		AppLog.logInfo("isBuyThruPass : Pass FSA: "+ fsa);
		return true;
	}
%>
