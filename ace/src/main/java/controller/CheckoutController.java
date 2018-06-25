package controller;

import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.MypageDao;
import dao.OrderDao;
import model.Cart;
import model.CartItem;
import model.CheckOut;
import model.OrderLine;
import model.Sales;
import model.User;

@Controller
public class CheckoutController {

	@Autowired
	private MypageDao myDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private Cart cart;

	public String today() {
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH)+1;
		String mon=String.valueOf(month);
		if(month<10) mon="0"+month;
		int date=today.get(Calendar.DATE);
		String day=String.valueOf(date);
		if(date<10) day="0"+date;
		return year+"/"+mon+"/"+day;
	}
	@RequestMapping(value="/checkout/purchase.html",
			method=RequestMethod.POST)
	public ModelAndView checkout(CheckOut check,HttpSession session) {
		ModelAndView mav=new ModelAndView("main");
		String c_id = (String)session.getAttribute("loginUser");
		check.setC_id(c_id);
		int ocode=orderDao.getMaxOcode()+1;
		System.out.println(ocode+"ocode");
		String o_code=String.valueOf(ocode);
		check.setO_code(o_code);
		List<CartItem> cartList = cart.getCart(c_id);
		OrderLine ol = new OrderLine();
		ol.setO_code(o_code);
		check.setO_date(today());
		if(check.getO_pay().equals("신용카드")||check.getO_pay().equals("휴대폰")) {
			check.setO_state("결제완료");
		}else {
			check.setO_state("미결제");
		}
		String dnumber=String.valueOf(orderDao.getMaxDNumber()+1);
		check.setD_number(dnumber);
		check.setD_state("배송준비중");
	
		orderDao.addOrderInfo(check);
		orderDao.addDeliveryInfo(check);		
		for(CartItem item:cartList) {
			Integer ol_code=orderDao.getMaxOLcode()+1;
			ol.setOl_code(String.valueOf(ol_code));
			ol.setOl_total(item.getP_price()*item.getC_amount());
			ol.setO_amount(item.getC_amount());
			ol.setP_code(item.getP_code());
			ol.setP_size(item.getP_size());
			if(check.getO_state().equals("결제완료")) {
				//주문이 결제완료 상태이면 sales_info 테이블에 insert/update한다
				Sales s = new Sales();
				s.setP_code(item.getP_code());
				s.setP_size(item.getP_size());
				s.setS_date(check.getO_date());
				Sales sales=orderDao.getSales(s);
				if(sales!=null) {//같은날 같은 상품의 주문이 존재할때
					s.setS_amount(sales.getS_amount()+item.getC_amount());
					s.setS_total(s.getS_amount()*item.getP_price());
					orderDao.updateSales(s);
				}else {//같은날 같은 상품의 주문이 존재하지 않을때
					s.setS_total(item.getP_price()*item.getC_amount());
					s.setS_amount(item.getC_amount());
					orderDao.addSales(s);
				}
			}
			orderDao.addOrderLine(ol);
		}
		orderDao.emptyCart(c_id);
		mav.addObject("RESULT","OK");
		mav.addObject("BODY","orderResult.jsp");
		return mav;
	}
	
	@RequestMapping(value="/checkout/show.html",
			method=RequestMethod.GET)
	public ModelAndView purchaseOrder(HttpSession session) {
		String c_id = (String)session.getAttribute("loginUser");
		if(c_id==null) {
			ModelAndView mav=new ModelAndView(
					"redirect:/login/login.html");
			mav.addObject("RESULT","nologin");
			return mav;
		}
		ModelAndView mav=new ModelAndView("main");
		CheckOut check = new CheckOut();
		List<CartItem> cartList = cart.getCart(c_id);
		int totalAmount = 0;
		if(cartList.size()>0) {
			Iterator it = cartList.iterator();
			while(it.hasNext()) {
				CartItem cartItem=(CartItem)it.next();
				int total=cartItem.getP_price() * 
						cartItem.getC_amount();
				totalAmount = totalAmount + total;
			}
			mav.addObject("SIZE","YES");
		}else {
			mav.addObject("SIZE","NO");
		}
		check.setO_total(totalAmount);
		User customer=myDao.getById(c_id);
		mav.addObject("LIST", cartList);
		mav.addObject("customer",customer);
		mav.addObject("checkOut", check);
		mav.addObject("BODY", "purchase_order.jsp");
		return mav;
	}
}
