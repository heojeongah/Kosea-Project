package controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.ReadOrderDao;
import model.Condition;
import model.Order;
import model.OrderLine;
import model.SCondition;
import model.Sales;

@Controller
public class ReadOrderController {
	@Autowired
	private ReadOrderDao orderDao;
	
	@RequestMapping(value="/read/updatePay.html",
			method=RequestMethod.GET)
	public ModelAndView update(String OCODE) {
		
		Calendar cd = Calendar.getInstance();
		int year=cd.get(Calendar.YEAR);
	    int month=cd.get(Calendar.MONTH)+1;
	    int date=cd.get(Calendar.DATE);
	    String mm = "";
	    String dd="";
	    if(month < 10) {
	    	mm = "0" + month;
	    }else {
	    	mm = month+"";
	    }
	    if(date < 10) {
	    	dd = "0" + date;
	    }else {
	    	dd= date+"";
	    }
	    String today=year+"/"+mm+"/"+dd;
	    
		String o_state = orderDao.getOrderDetail(OCODE).getO_state();
		if(o_state == "결제완료") {
			return new ModelAndView(
					"redirect:/read/readOrder.html");
		}else {
			orderDao.updateOrder(OCODE);
			List<OrderLine> orderList = orderDao.readOrderLine(OCODE);
			Sales sales = new Sales();
			
			for(int i=0; i<orderList.size(); i++) {
				sales.setP_code(orderList.get(i).getP_code());
				sales.setP_size(orderList.get(i).getP_size());
				sales.setS_date(today);
				Sales salesInfo = orderDao.readSales(sales);
				if(salesInfo != null) {
					int s_amount = salesInfo.getS_amount() + orderList.get(i).getO_amount();
					int s_total = salesInfo.getS_total() + orderList.get(i).getOl_total();
					sales.setS_amount(s_amount);
					sales.setS_total(s_total);
					orderDao.updateSales(sales);
				}else {
					sales.setS_amount(orderList.get(i).getO_amount());
					sales.setS_total(orderList.get(i).getOl_total());
					orderDao.insertSales(sales);
				}
			}
		}
		return new ModelAndView(
				"redirect:/read/readOrder.html");
	}
	
	@RequestMapping(value="/read/searchNewOrder.html",
			method=RequestMethod.GET)
	public ModelAndView findNewOrder(Integer pageNo) {
		Calendar cd = Calendar.getInstance();
		int year=cd.get(Calendar.YEAR);
	    int month=cd.get(Calendar.MONTH)+1;
	    int date=cd.get(Calendar.DATE);
	    String mm = "";
	    if(month < 10) {
	    	mm = "0" + month;
	    }else {
	    	mm = month+"";
	    }
	    String today=year+"/"+mm+"/"+date;
	    System.out.println(today);
		SCondition sc= new SCondition();
		sc.setToday(today);
		Integer cnt = orderDao.countNewOrder(today);
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		if(cnt == null) cnt =0;
		int startRow = 0; int endRow=0;
		int pageCnt = 0;
		if(cnt > 0) {
			pageCnt = cnt / 10;
			if(cnt % 10>0) pageCnt++;
			startRow = (currentPage-1)*10 +1;
			endRow = currentPage * 10;
			if(endRow > cnt) endRow = cnt;
		}
		sc.setStartRow(startRow);sc.setEndRow(endRow);
		List<Order> orderList = orderDao.findNewOrder(sc);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","orderList.jsp");
		mav.addObject("ORDER_LIST", orderList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		return mav;
	}
	
	@RequestMapping(value="/read/searchWaiting.html",
			method=RequestMethod.GET)
	public ModelAndView findWaitingOrder(Integer pageNo) {
		Condition c= new Condition();
		Integer cnt = orderDao.countWaitingPay();
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		if(cnt == null) cnt =0;
		int startRow = 0; int endRow=0;
		int pageCnt = 0;
		if(cnt > 0) {
			pageCnt = cnt / 10;
			if(cnt % 10>0) pageCnt++;
			startRow = (currentPage-1)*10 +1;
			endRow = currentPage * 10;
			if(endRow > cnt) endRow = cnt;
		}
		c.setStartRow(startRow);c.setEndRow(endRow);
		List<Order> orderList = orderDao.findWaitingOrder(c);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","orderList.jsp");
		mav.addObject("ORDER_LIST", orderList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		return mav;
	}
	
	@RequestMapping(value="/read/searchOrder.html",
			method=RequestMethod.POST)
	public ModelAndView findByDate(Integer pageNo, String startDate,
			String endDate) {
		if((startDate==null && endDate==null)||
				(startDate.equals("") && endDate.equals(""))){
			return this.readOrder(pageNo);
		}
		Integer cnt = orderDao.getOrderCount();
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		if(cnt == null) cnt =0;
		int startRow = 0; int endRow=0;
		int pageCnt = 0;
		if(cnt > 0) {
			pageCnt = cnt / 10;
			if(cnt % 10>0) pageCnt++;
			startRow = (currentPage-1)*10 +1;
			endRow = currentPage * 10;
			if(endRow > cnt) endRow = cnt;
		}
		SCondition sc = new SCondition();
		sc.setStartRow(startRow);sc.setEndRow(endRow);
		sc.setStartDate(startDate); sc.setEndDate(endDate);
		List<Order> orderList =
				orderDao.findByDate(sc);
		if(orderList==null || orderList.equals("")) {
			return this.readOrder(pageNo);
		}
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","orderList.jsp");
		mav.addObject("ORDER_LIST", orderList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		return mav;
		
	}
	
	
	@RequestMapping(value="/read/readOrder.html",
			method=RequestMethod.GET)
	public ModelAndView readOrder(Integer pageNo) {
		Condition c= new Condition();
		Integer cnt = orderDao.getOrderCount();
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		if(cnt == null) cnt =0;
		int startRow = 0; int endRow=0;
		int pageCnt = 0;
		if(cnt > 0) {
			pageCnt = cnt / 10;
			if(cnt % 10>0) pageCnt++;
			startRow = (currentPage-1)*10 +1;
			endRow = currentPage * 10;
			if(endRow > cnt) endRow = cnt;
		}
		c.setStartRow(startRow);c.setEndRow(endRow);
		List<Order> orderList = orderDao.readOrder(c);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","orderList.jsp");
		mav.addObject("ORDER_LIST", orderList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		return mav;
	}
}





























