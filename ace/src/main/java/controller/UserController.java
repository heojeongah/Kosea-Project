package controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import model.User;

@Controller
public class UserController {
	@Autowired
	private UserDao userDao;

	@RequestMapping(value="/home/idCheck.html",
			method=RequestMethod.GET)
	public ModelAndView idCheck(String c_id) {
		ModelAndView mav=new ModelAndView("idCheck");
//		mav.addObject(new User());
		String dup = "";
		User user=userDao.checkId(c_id);
		if(user!=null) {
			dup="YES";
		}
		mav.addObject("ID",c_id);
		mav.addObject("DUP",dup);
		return mav;
	}
	
	@RequestMapping(value="/home/userEntry.html",
			method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView put(@Valid User user,
			BindingResult bindingResult) {
		if(bindingResult.getErrorCount()>0) {
			ModelAndView mav=new ModelAndView(
					"main");
			mav.addObject("BODY","userEntry.jsp");
			mav.getModel().putAll(
					bindingResult.getModel());
			return mav;
		}
		ModelAndView mav=new ModelAndView("main");
		//DB에 저장
		userDao.create(user);
		mav.addObject("BODY","userEntrySuccess.jsp");
		mav.addObject("user",user);
		return mav;
	}
	
	
	@RequestMapping(value="/home/entryForm.html",
			method=RequestMethod.GET)
	public ModelAndView writeForm() {
		ModelAndView mav=new ModelAndView("main");
		mav.addObject(new User());
		mav.addObject("BODY","userEntry.jsp");
		return mav;
	}
	
	@RequestMapping(value="/home/qnaForm.html",
			method=RequestMethod.GET)
	public ModelAndView qnaForm() {
		ModelAndView mav=new ModelAndView("main");
		mav.addObject(new User());
		mav.addObject("BODY","qnaInput.jsp");
		return mav;
	}
}







