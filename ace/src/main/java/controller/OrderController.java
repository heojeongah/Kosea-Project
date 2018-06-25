package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.OrderDao;
import model.Condition;
import model.Order;
import model.Qna;

@Controller
public class OrderController {

	@Autowired
	private OrderDao orderDao;
	
	@RequestMapping(value="/home/getOrderDetail.html",
			method=RequestMethod.GET)
	public ModelAndView detail(String o_code,HttpSession session) {
		ModelAndView mav=new ModelAndView("main");
		String c_id=(String)session.getAttribute("loginUser");
		System.out.println(c_id);
		if(c_id==null||c_id.equals("")) {
			mav.addObject("BODY","login.jsp");
			mav.addObject("LOGIN","no");
		}else {
		List<Order> order_list = orderDao.getOrderDetail(o_code);
		mav.addObject("DETAIL",order_list.get(0));
		mav.addObject("LIST",order_list);
		mav.addObject("BODY","order_detail.jsp");
		}
		return mav;
	}

	@RequestMapping(value="/order/itemCancel.html",
			method=RequestMethod.GET)
	public ModelAndView delete(String ol_code,String o_code) {
		ModelAndView mav=new ModelAndView("main");
		orderDao.deleteOrderLine(ol_code);
		if(orderDao.getOrderLineCount(o_code)==0) {
			orderDao.deleteDeliveryInfo(o_code);
			orderDao.deleteOrderInfo(o_code);
		}
		mav.addObject("DELETE","OK");
		mav.addObject("BODY","commentResult.jsp");
		return mav;
	}
	@RequestMapping(value="/order/orderCancel.html",
			method=RequestMethod.GET)
	public ModelAndView deleteOrder(String o_code) {
		ModelAndView mav=new ModelAndView("main");
		List<Order> orders=orderDao.getOrderDetail(o_code);
		for(Order order:orders) {
			orderDao.deleteOrderLine(order.getOl_code());
		}
		if(orderDao.getOrderLineCount(o_code)==0) {
			orderDao.deleteDeliveryInfo(o_code);
			orderDao.deleteOrderInfo(o_code);
		}
		mav.addObject("DELETE","OK");
		mav.addObject("BODY","commentResult.jsp");
		return mav;
	}
	
	@RequestMapping(value="/home/getOrderList.html",
			method=RequestMethod.GET)
	public ModelAndView OrderList(Integer pageNo,HttpSession session) {
//		User user = userDao
//		System.out.println("OK"+qna_id);
		ModelAndView mav=new ModelAndView("main");
		String c_id=(String)session.getAttribute("loginUser");
		System.out.println(c_id);
		if(c_id==null||c_id.equals("")) {
			mav.addObject("BODY","login.jsp");
			mav.addObject("LOGIN","no");
		}else {
			Condition c=new Condition();
			Integer cnt=orderDao.getOrderCount();
			int currentPage = 0;
			if(pageNo == null) currentPage = 1;
			else currentPage = pageNo;
			if(cnt == null) cnt = 0;
			int startRow = 0; int endRow = 0;
			int pageCnt = 0;
			if(cnt > 0) {//게시글이 존재하는 경우
				pageCnt = cnt / 5;
				if(cnt % 5 > 0) pageCnt++;
				startRow = (currentPage-1)*5 + 1;
				endRow = currentPage * 5;
				if(endRow > cnt) endRow = cnt;
			}
			c.setStartRow(startRow); c.setEndRow(endRow);
			c.setC_id(c_id);
			List<Order> order_list = orderDao.readOrder(c);
			
			mav.addObject("LIST",order_list);
			mav.addObject("BODY","read_order.jsp");
		}
		return mav;
	}
}
