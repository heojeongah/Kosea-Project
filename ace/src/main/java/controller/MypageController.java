package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.MypageDao;
import model.User;

@Controller
public class MypageController {
	@Autowired
	private MypageDao myDao;

	
	@RequestMapping(value="/home/checkPwd.html",
			method=RequestMethod.POST)
	public ModelAndView checkPwd(HttpSession session, 
			String Pwd) {
		ModelAndView mav = new ModelAndView("main");
		String id = (String)session.getAttribute("loginUser");
		User user = myDao.getById(id);
		if(user.getC_pwd().equals(Pwd)) {
			mav=new ModelAndView(
					"redirect:/home/getOrderList.html");		
		}
		return mav;
	}
	
	@RequestMapping(value="/home/check.html",
			method=RequestMethod.GET)
	public ModelAndView check(HttpSession session) {
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY", "check_pwd.jsp");
		return mav;
	}
	
	@RequestMapping(value="/home/change.html",
			method=RequestMethod.GET)
	public ModelAndView change(HttpSession session) {
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY", "change_pwd.jsp");
		return mav;
	}
	
	@RequestMapping(value="/home/changePwd.html",
			method=RequestMethod.POST)
	public ModelAndView updatePwd(String oldPwd, String newPwd,
			String newPwd2, HttpSession session) {
		ModelAndView mav = new ModelAndView("main");
		String id = (String)session.getAttribute("loginUser");
		User user = myDao.getById(id);
		if(user.getC_pwd().equals(oldPwd) &&
				!user.getC_pwd().equals(newPwd)) {
			if(newPwd.equals(newPwd2)) {
				user.setC_pwd(newPwd);
				myDao.updatePwd(user);
				mav.addObject("BODY", "result_user_update.jsp");
			}
		}
		return mav;
	}
	
	@RequestMapping(value="/home/update.html",
			method=RequestMethod.POST)
	public ModelAndView update(String phone, String addr,
			String email, HttpSession session) {
		ModelAndView mav = new ModelAndView("main");
		String id = (String)session.getAttribute("loginUser");
		User user = myDao.getById(id);
		user.setC_phone(phone);
		user.setC_addr(addr);
		user.setC_email(email);
		myDao.update(user);
		mav.addObject("BODY", "result_user_update.jsp");
		return mav;
	}
	@RequestMapping(value="/home/update_info.html",
			method=RequestMethod.GET)
	public ModelAndView updateInfo(HttpSession session) {
		ModelAndView mav = new ModelAndView("main");
		String id = (String)session.getAttribute("loginUser");
		User user = myDao.getById(id);
		mav.addObject("user", user);
		mav.addObject("BODY", "update_user_info.jsp");
		return mav;
	}
	
//	@RequestMapping(value="/home/getUserDetail.html",
//			method=RequestMethod.GET)
//	public ModelAndView getDetail(HttpSession session) {
//		ModelAndView mav = new ModelAndView("main");
//		String id = (String)session.getAttribute("loginUser");
//		if(id == null || id.equals("")) {
//			mav.addObject(new User());
//			mav.addObject("BODY", "login.jsp");
//		}else {
//			User user = myDao.getById(id);
//			mav.addObject("BODY", "update_user_info.jsp");
//			mav.addObject("user", user);
//		}
//		return mav;
//	}
}
