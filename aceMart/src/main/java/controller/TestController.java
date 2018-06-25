package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class TestController {

	@RequestMapping(value="/read/readMonth.html",
			method=RequestMethod.GET)
	public ModelAndView temp(HttpSession session) {
		ModelAndView mav=new ModelAndView(
				"main");
		mav.addObject("BODY","test.jsp");
		ArrayList arr = new ArrayList();
		int x=10;
		for(int i=0;i<10;i++) {
			arr.add(x);
			x++;
		}
		mav.addObject("LIST", arr);
		return mav;
	}
}
