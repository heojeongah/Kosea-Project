package controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.QnaDao;
import dao.ReadDeliveryDao;
import dao.ReadOrderDao;
import model.Condition;
import model.Qna;

@Controller
public class AdminMainController {

	@Autowired
	private ReadOrderDao orderDao;
	@Autowired
	private ReadDeliveryDao deliDao;
	@Autowired
	private QnaDao qnaDao;
	@RequestMapping(value="/admin/main.html",
			method=RequestMethod.GET)
	public ModelAndView temp(HttpSession session) {
		ModelAndView mav=new ModelAndView(
				"main");
		Condition c = new Condition();
		c.setStartRow(1);c.setEndRow(3);
		List<Qna> qnaList = qnaDao.getQna(c);
		mav.addObject("LIST",qnaList);
		
		Calendar cd = Calendar.getInstance();
		int year=cd.get(Calendar.YEAR);
	    int month=cd.get(Calendar.MONTH)+1;
	    int date=cd.get(Calendar.DATE);
	    String mm = "";
	    if(month < 10) {
	    	mm = "0" + month;
	    }else {
	    	mm = month+"";
	    }
	    String today=year+"/"+mm+"/"+date;
		int count = orderDao.countNewOrder(today);
		int countPay = orderDao.countWaitingPay();
		int countState = deliDao.countState();
		int countState2= deliDao.countState2();
		mav.addObject("BODY","main_page.jsp");
		mav.addObject("countNewOrder", count);
		mav.addObject("countWaitingPay",countPay);
		mav.addObject("state1",countState);
		mav.addObject("state2",countState2);
		return mav;
	}
}






