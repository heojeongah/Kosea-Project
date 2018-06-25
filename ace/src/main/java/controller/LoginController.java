package controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.LoginDao;
import model.Cart;
import model.CartItem;
import model.User;

@Controller
@Service
public class LoginController {
	@Autowired  
	private LoginDao loginDao;
	@Autowired
	private Cart cart;
	
	@RequestMapping(value="/login/login.html",
			method=RequestMethod.GET)
	public ModelAndView open() {
//		System.out.println("/login/login.html mapping");
		ModelAndView mav=new ModelAndView("main");
		mav.addObject("BODY","login.jsp");
		mav.addObject(new User());
		return mav;
	}
	@RequestMapping(value="/login/again.html",
			method=RequestMethod.GET)
	public ModelAndView openAgain() {
		System.out.println("openAgain");
		ModelAndView mav=new ModelAndView("login");
		return mav;
	}
	
	@RequestMapping(value="/login/template.html",
		method=RequestMethod.POST)
	public ModelAndView login(@Valid User user,
			BindingResult bindingResult,HttpSession session) {
		System.out.println("/login/template.html mapping");
		if(bindingResult.getErrorCount()>0) {
			System.out.println("error");

			ModelAndView mav=new ModelAndView("main");
			mav.addObject("BODY","login.jsp");
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		ModelAndView mav=new ModelAndView("main");
		//DB에서 암호를 불러옴
		String pwd=loginDao.getPassword(user.getC_id());
		System.out.println(pwd);
		if(!user.getC_pwd().equals(pwd)) {
			mav.addObject("AGAIN","login.jsp");
			mav.addObject("BODY","loginResult.jsp");
		}else {//로그인 성공
			//DB에서 CART정보를 불러온다.
			List<CartItem> cartList =
					cart.getCart(user.getC_id());
			if(cartList != null) {
				Iterator it = cartList.iterator();
				int i = 0;
				while(it.hasNext()) {
					CartItem ci = (CartItem)it.next();
					cart.setCodeList(i, ci.getP_code());
					cart.setNumList(i, ci.getC_amount());
					cart.setSizeList(i, ci.getP_size());
					System.out.println("cartNo:"+i);
					i++;
				}
				session.setAttribute("CART", cart);
			}
			session.setAttribute("loginUser", user.getC_id());
			mav.addObject("BODY","loginResult.jsp");
		}

		return mav;
	}
}






