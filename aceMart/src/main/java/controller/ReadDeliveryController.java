package controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.ReadDeliveryDao;
import model.Delivery;
import model.SCondition;

@Controller
public class ReadDeliveryController {
	@Autowired
	private ReadDeliveryDao deliDao;
	
	@RequestMapping(value="/read/searchByState.html",
			method=RequestMethod.POST)
	public ModelAndView getByState(Integer pageNo, String state) {
		SCondition sc = new SCondition();
		Integer cnt = deliDao.getDeliveryCount();
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
		sc.setD_state(state);
		if(state==null) {
			return new ModelAndView(
					"redirect:/read/readDelivery.html");
		}else {
		List<Delivery> delList = deliDao.getByState(sc);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY", "deliveryList.jsp");
		mav.addObject("DELIVERY_LIST", delList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		return mav;
		}
	}
	
	@RequestMapping(value="/read/updateState.html",
			method=RequestMethod.GET)
	public ModelAndView updateState(String DNUMBER) {
		String d_state = deliDao.getDeliveryDetail(DNUMBER).getD_state();
		Delivery deliveryInfo = new Delivery();
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
		if(d_state == "배송중" || d_state == "배송완료") {
			return new ModelAndView(
					"redirect:/read/readDelivery.html");
		}else {
			deliveryInfo.setD_number(DNUMBER);
			deliveryInfo.setD_sdate(today);
			deliDao.updateState(deliveryInfo);
		}
		return new ModelAndView(
				"redirect:/read/readDelivery.html");
	}
	
	@RequestMapping(value="/read/readDeliveryDetail.html",
			method=RequestMethod.GET)
	public ModelAndView readDetail(String DNUMBER) {
		Delivery delivery = deliDao.getDeliveryDetail(DNUMBER);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","deliveryDetail.jsp");
		mav.addObject("delivery", delivery);
		return mav;
	}
	
	@RequestMapping(value="/read/readDelivery.html",
			method=RequestMethod.GET)
	public ModelAndView readDelivery(Integer pageNo) {
		SCondition sc = new SCondition();
		Integer cnt = deliDao.getDeliveryCount();
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
		List<Delivery> deliList = deliDao.readDelivery(sc);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY", "deliveryList.jsp");
		mav.addObject("DELIVERY_LIST", deliList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		return mav;
	}
}















