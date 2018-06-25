package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.LoginDao;
import dao.ProductDao;
import model.Condition;
import model.Product;
import model.User;

@Controller
public class HomeController {

	@Autowired
	private LoginDao loginDao;
	@Autowired
	private ProductDao productDao;
	@RequestMapping(value="/home/intro.html",
			method=RequestMethod.GET)
	public ModelAndView intro(String BODY) {
		ModelAndView mav=new ModelAndView(
				"main");
		mav.addObject("BODY",BODY);
		return mav;
	}

	@RequestMapping(value="/home/main.html",
			method=RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mav=new ModelAndView(
				"main");
		int currentPage = 1;
		Condition c = new Condition();
		Integer cnt= productDao.getProductCount(c);
		if(cnt == null) cnt = 0;
		int startRow = 0; int endRow = 0;
		int pageCnt = 0;
		if(cnt > 0) {//게시글이 존재하는 경우
			pageCnt = cnt / 12;
			if(cnt % 12 > 0) pageCnt++;
			startRow = (currentPage-1)*12 + 1;
			endRow = currentPage * 12;
			if(endRow > cnt) endRow = cnt;
		}
		c.setStartRow(startRow); c.setEndRow(endRow);
		List<Product> productList = productDao.readProduct(c);
		mav.addObject("BODY","main_page.jsp");
		mav.addObject("LIST",productList);
		mav.addObject("startRow", startRow);
	    mav.addObject("endRow", endRow);
	    mav.addObject("count", cnt);
	    mav.addObject("currentPage", currentPage);
	    mav.addObject("pageCount",pageCnt);
		return mav;
	}
	@RequestMapping(value="/home/template.html",
			method=RequestMethod.GET)
	public ModelAndView temp() {
		ModelAndView mav=new ModelAndView(
				"template");
		int currentPage = 1;
		Condition c = new Condition();
		Integer cnt= productDao.getProductCount(c);
		if(cnt == null) cnt = 0;
		int startRow = 0; int endRow = 0;
		int pageCnt = 0;
		if(cnt > 0) {//게시글이 존재하는 경우
			pageCnt = cnt / 15;
			if(cnt % 15 > 0) pageCnt++;
			startRow = (currentPage-1)*15 + 1;
			endRow = currentPage * 15;
			if(endRow > cnt) endRow = cnt;
		}
		c.setStartRow(startRow); c.setEndRow(endRow);
		List<Product> productList = productDao.readProduct(c);
		mav.addObject("BODY","main_page.jsp");
		mav.addObject("LIST",productList);
		mav.addObject("startRow", startRow);
	    mav.addObject("endRow", endRow);
	    mav.addObject("count", cnt);
	    mav.addObject("currentPage", currentPage);
	    mav.addObject("pageCount",pageCnt);
		return mav;
	}
	@RequestMapping(value="/home/template.html",
			method=RequestMethod.POST)
	public ModelAndView login(@Valid User user,
			HttpSession session) {
		ModelAndView mav=new ModelAndView("template");
		if(user.getC_id().equals("")) return mav;
		if(user.getC_pwd().equals("")) return mav;
		//DB에서 암호를 불러옴
		String password=loginDao.getPassword(user.getC_id());
		if(!user.getC_pwd().equals(password)) {
			mav.addObject("BODY","loginResult.jsp");
		}else {//로그인 성공

			}
			session.setAttribute("loginUser", user.getC_id());
			mav.addObject("BODY","loginResult.jsp");
		return mav;
	}
	
}






