package controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.CustomerDao;
import model.Condition;
import model.Customer;

@Controller
public class CustomerController {
	@Autowired
	private CustomerDao customerDao;

	@RequestMapping(value="/customer/readDetail.html",
			method=RequestMethod.GET)
	public ModelAndView detail(String CID) {
		List<Customer> cList = customerDao.getCustomerDetail(CID);
		ModelAndView mav=new ModelAndView("main");
		mav.addObject("BODY","customerItemView.jsp");
		//조회 결과를 mav에 저장
		mav.addObject("Customer", cList);
		return mav;
	}
	
	@RequestMapping(value="/customer/read.html",
			method=RequestMethod.GET)
	public ModelAndView readCustomer(Integer pageNo) {
		Condition c = new Condition();
		Integer cnt=customerDao.getCustomerCount();
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		if(cnt == null) cnt = 0;
		int startRow = 0; int endRow = 0;
		int pageCnt = 0;
		if(cnt > 0) {//게시글이 존재하는 경우
			pageCnt = cnt / 10;
			if(cnt % 10 > 0) pageCnt++;
			startRow = (currentPage-1)*10 + 1;
			endRow = currentPage * 10;
			if(endRow > cnt) endRow = cnt;
		}
		List<String> grades=Arrays.asList("S","A","B","C","N","F");
		c.setStartRow(startRow); c.setEndRow(endRow);
		List<Customer> customerList = customerDao.readCustomer(c);
		ModelAndView mav=new ModelAndView("main");
		mav.addObject("BODY","customerListView.jsp");
		mav.addObject("CUSTOMER_LIST",customerList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("grades",grades);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		return mav;
	}
}
