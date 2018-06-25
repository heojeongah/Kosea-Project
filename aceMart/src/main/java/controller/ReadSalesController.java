package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.ReadSalesDao;
import model.Condition;
import model.SCondition;
import model.Sales;

@Controller
public class ReadSalesController {
	@Autowired
	private ReadSalesDao salesDao;
	
	
	
	@RequestMapping(value="/read/readMonthly.html",
			method=RequestMethod.GET)
	public ModelAndView findByMonthly() {
		ArrayList list = new ArrayList();
		ModelAndView mav = new ModelAndView("main");
		list.add(salesDao.getMonthlyTotal("2018/01"));
		list.add(salesDao.getMonthlyTotal("2018/02"));
		list.add(salesDao.getMonthlyTotal("2018/03"));
		list.add(salesDao.getMonthlyTotal("2018/04"));
		list.add(salesDao.getMonthlyTotal("2018/05"));
		list.add(salesDao.getMonthlyTotal("2018/06"));
		list.add(salesDao.getMonthlyTotal("2018/07"));
		list.add(salesDao.getMonthlyTotal("2018/08"));
		list.add(salesDao.getMonthlyTotal("2018/09"));
		list.add(salesDao.getMonthlyTotal("2018/10"));
		list.add(salesDao.getMonthlyTotal("2018/11"));
		list.add(salesDao.getMonthlyTotal("2018/12"));
		mav.addObject("BODY","monthlySales.jsp");
		mav.addObject("LIST",list);
		return mav;
		
	}
	
	@RequestMapping(value="/read/searchRange.html",
			method=RequestMethod.POST)
	public ModelAndView findByRange(Integer pageNo,
			String startDate, String endDate) {
		if((startDate==null && endDate==null)||
				(startDate.equals("") && endDate.equals(""))){
			return this.readDailySalesRange(pageNo);
		}
		Integer cnt = salesDao.getSalesCount();
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
		int s_sum = salesDao.getSumByRange(sc).intValue();
		List<Sales> salesList =
				salesDao.findByRange(sc);
		if(s_sum == 0) {
			if(salesList==null || salesList.isEmpty()) {
				return this.readDailySales(pageNo);
			}
		}
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","rangeSales.jsp");
		mav.addObject("SALES_LIST", salesList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		mav.addObject("s_sum", s_sum);
		return mav;
	}
	
	@RequestMapping(value="/read/readSalesRange.html",
			method=RequestMethod.GET)
	public ModelAndView readDailySalesRange(Integer pageNo) {
		Condition c= new Condition();
		Integer cnt = salesDao.getSalesCount();
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
		int s_sum = salesDao.getSum().intValue();
		c.setStartRow(startRow);c.setEndRow(endRow);
		List<Sales> salesList = salesDao.readSales(c);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","rangeSales.jsp");
		mav.addObject("SALES_LIST",salesList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		mav.addObject("s_sum",s_sum);
		return mav;
	}
	
	@RequestMapping(value="/read/search.html",
			method=RequestMethod.POST)
	public ModelAndView findByDate(Integer pageNo,String s_date) {
		if(s_date==null || s_date.equals("")) {
			return this.readDailySales(pageNo);
		}
		Integer cnt = salesDao.getSalesCount();
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
		sc.setS_date(s_date);
		List<Sales> salesList =
				salesDao.findByDate(sc);
		if(salesList==null || salesList.isEmpty()) {
			return this.readDailySales(pageNo);
		}
		int s_sum = salesDao.getSumByDate(s_date).intValue();
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","salesList.jsp");
		mav.addObject("SALES_LIST", salesList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		mav.addObject("s_sum",s_sum);
		return mav;
		
	}
	
	@RequestMapping(value="/read/readSales.html",
			method=RequestMethod.GET)
	public ModelAndView readDailySales(Integer pageNo) {
		Condition c= new Condition();
		Integer cnt = salesDao.getSalesCount();
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
		int s_sum = salesDao.getSum().intValue();
		System.out.println(s_sum);
		c.setStartRow(startRow);c.setEndRow(endRow);
		List<Sales> salesList = salesDao.readSales(c);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","salesList.jsp");
		mav.addObject("SALES_LIST",salesList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		mav.addObject("s_sum", s_sum);
		return mav;
	}
}













