package controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.LoginDao;
import model.Cart;
import model.CartItem;

@Controller
public class CartController {
	@Autowired
	private LoginDao loginDao;
	@Autowired
	private Cart cart;
	
	@RequestMapping(value="/cart/deleteCart.html",
			method=RequestMethod.GET)
	public ModelAndView deleteCart(String p_code, Integer p_size,
		HttpSession session) throws ServletException{
		String id=(String)session.getAttribute(
				"loginUser");
		Cart cart=(Cart)session.getAttribute("CART");
		cart.deleteItem(p_code, id, p_size);
		return new ModelAndView(
				"redirect:/cart/show.html");
	}
	
	@RequestMapping(value="/cart/addCart.html",
			method=RequestMethod.GET)
	public ModelAndView addCart(String p_code,Integer o_amount, String p_name,
			Integer size,	HttpSession session)  throws ServletException{
		String id=(String)session.getAttribute(
				"loginUser");
		if(id == null) {
			ModelAndView mav=new ModelAndView(
					"redirect:/login/login.html");
			mav.addObject("RESULT","nologin");
			return mav;
		}
		Cart cart=(Cart)session.getAttribute("CART");
		if(cart == null) cart = this.cart;
		cart.addCart(p_code, o_amount, id, size);
		session.setAttribute("CART", cart);
		ModelAndView mav = new ModelAndView(
				"redirect:/product/readDetail.html?code="+p_code+"&num="+o_amount);
		return mav;
	}
	
	@RequestMapping(value="/cart/show.html",
			method=RequestMethod.GET)
	public ModelAndView showCart(HttpSession session) {
		ModelAndView mav = new ModelAndView("main");
		String id=(String)session.getAttribute("loginUser");
		if(id == null) {
			ModelAndView mav2=new ModelAndView(
					"redirect:/login/login.html");
			return mav2;
		}
		
		List<CartItem> cartList = cart.getCart(id);
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
		mav.addObject("totalAmount", totalAmount);
		mav.addObject("BODY", "cartListView.jsp");
		mav.addObject("CART_LIST", cartList);
		return mav;
	}

}


























