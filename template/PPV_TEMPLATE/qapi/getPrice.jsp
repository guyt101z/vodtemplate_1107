<%
ims.vi.quadplay.MovieHouseCheckoutService.MovieHousePriceMessageWithCashPoint movieHousePriceMessage =
	wrapper.getMovieHouseProductPriceWithCashPoint(fsa, productId);

if (movieHousePriceMessage != null) {
	if (!movieHousePriceMessage.getResponseCode().toString().equals("SUCCESS")) {
		String api = "getMovieHouseProductPrice";
		String respCode = movieHousePriceMessage.getResponseCode().toString();
%>
		<script type="text/javascript">
		<!--
		window.location = "error.jsp?api=<%=api%>&respcode=<%=respCode%>&<%=urlParam%>";
		//-->
		</script>
<%
		return;
	}
	java.util.List<ims.vi.quadplay.MovieHouseCheckoutService.MovieHousePriceWithCashPoint> listInfo = movieHousePriceMessage.getEntity();
	System.out.println("movieHousePriceMessage.getEntity().size():"+listInfo.size());
	
	for (ims.vi.quadplay.MovieHouseCheckoutService.MovieHousePriceWithCashPoint MovieHousePriceWithCashPoint : listInfo) {
		if ("POSTPAID".equalsIgnoreCase(MovieHousePriceWithCashPoint.getPayment())) {
			if ("SD".equals(MovieHousePriceWithCashPoint.getServiceType())) {
				price[0] = MovieHousePriceWithCashPoint.getPrice();
				priceTxt[0] = "Standard Price $" + MovieHousePriceWithCashPoint.getPrice();
			} else if ("HD".equals(MovieHousePriceWithCashPoint.getServiceType())) {
				price[1] = MovieHousePriceWithCashPoint.getPrice();
				priceTxt[1] = "Standard Price $" + MovieHousePriceWithCashPoint.getPrice();
			}
		}
	}

	for (ims.vi.quadplay.MovieHouseCheckoutService.MovieHousePriceWithCashPoint MovieHousePriceWithCashPoint : listInfo) {
		if ("PREPAID".equalsIgnoreCase(MovieHousePriceWithCashPoint.getPayment())) {
			if ("SD".equals(MovieHousePriceWithCashPoint.getServiceType())) {
				cashPointPrice[0] = MovieHousePriceWithCashPoint.getPrice();
				if (priceTxt[0] != null || "".equals(priceTxt[0])) priceTxt[0] += " / " + "now DOLLAR $"+MovieHousePriceWithCashPoint.getPrice();
				else priceTxt[0] = "now DOLLAR $"+MovieHousePriceWithCashPoint.getPrice();
			} else if ("HD".equals(MovieHousePriceWithCashPoint.getServiceType())) {
				cashPointPrice[1] = MovieHousePriceWithCashPoint.getPrice();
				if (priceTxt[1] != null || "".equals(priceTxt[1])) priceTxt[1] += " / " + "now DOLLAR $"+MovieHousePriceWithCashPoint.getPrice();
				else priceTxt[1] = "now DOLLAR $"+MovieHousePriceWithCashPoint.getPrice();
			}
		}
	}
	/*
	price[0] = "10";
	cashPointPrice[0] = "20";
	priceTxt[0] = "$ 10.00 / now DOLLAR $20";
	
	price[1] = "30";
	cashPointPrice[1] = "40";
	priceTxt[1] = "$ 30.00 / now DOLLAR $40";
	*/
}
%>
