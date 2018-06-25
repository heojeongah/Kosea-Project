package controller;

import java.util.Calendar;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.QnaDao;
import model.Qna;

@Controller
public class QnaController {
	@Autowired
	private QnaDao qnaDao;
	
	@RequestMapping(value="/qna/updateDo.html",
			method=RequestMethod.POST)
	public ModelAndView updateDo(Qna qna,
			BindingResult bindingResult, 
			HttpSession session) {

		ModelAndView mav=new ModelAndView("main");
		qnaDao.updateWritingInfo(qna);
		mav.addObject("BODY",
			"update_result_ok.jsp?id="+
					qna.getQna_id());		//위, 글번호로 글 검색 왜? 암호를 비교하기 위해
//		if(qna.getW_pwd().equals(
//				info.getW_pwd())) {//암호가 일치
//		}else {//암호가 불일치
//			mav.addObject("BODY",
//				"update_result.jsp?id="+
//						qna.getC_id());
//		}
		return mav;
	}
	
	@RequestMapping(value="/qna/writeModify.html",
			method=RequestMethod.POST)
	public ModelAndView writeModify(String qna_id) {
		ModelAndView mav=new ModelAndView("main");
		Qna qna=qnaDao.getWritingInfoById(
				qna_id);
		System.out.println("OK"+qna.getQna_id());
		mav.addObject(qna);
		mav.addObject("BODY","update_form.jsp");
		return mav;
	}

	@RequestMapping(value="/qna/delete.html",
			method=RequestMethod.POST)
	public ModelAndView delete(Integer qna_id) {
		ModelAndView mav=new ModelAndView("main");
		qnaDao.deleteQna(qna_id);
		mav.addObject("DELETE","OK");
		mav.addObject("BODY","qnaResult.jsp");
		return mav;
	}
	
	
	
	@RequestMapping(value="/qna/qna.html",
			method=RequestMethod.POST)
	public ModelAndView write(@Valid Qna qna,
			BindingResult bindingResult,
			HttpSession session,
			String c_id,
			Integer parent_id, 
			Integer group_id,
			Integer order_no
			) {
		if(bindingResult.getErrorCount()>0) {
			ModelAndView mav=
					new ModelAndView("main");
			mav.addObject("BODY","qnaInput.jsp");
			mav.getModel().putAll(
					bindingResult.getModel());
			return mav;
		}
		
		Integer maxId=qnaDao.getMaxId();
		if(maxId == null) maxId = 0;
		if(qna.getParent_id() == null) {//원글
			qna.setParent_id(0);
			qna.setOrder_no(0);
			System.out.println("원글");
			//그룹ID증가
			Integer gId=qnaDao.selectMaxGoupId();
			if(gId == null) gId = 0;
			qna.setGroup_id(gId+1);
		}else {//답글인 경우
			System.out.println("답글");
			qna.setC_id(c_id);
			qna.setParent_id(parent_id);
			qna.setGroup_id(group_id);
			qna.setOrder_no(order_no);
			
			qnaDao.updateGoupIdReply(qna);
		}
		String id=(String)session.getAttribute(
				"loginUser");
		qna.setC_id(id);
		System.out.println("아이디"+id);
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH)+1;
		int date=today.get(Calendar.DATE);
		String w_Date=year+"년"+month+"월"+date+"일";
		qna.setW_date(w_Date);
		qna.setW_state("미답변");
		qnaDao.insertQna(qna);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("OK","ok");
		mav.addObject("BODY",
				"qnaResult.jsp?QNA_ID="+(maxId+1));
		return mav;
	}
	
	
	@RequestMapping(value="/qna/writeForm.html",
			method=RequestMethod.GET)
	public ModelAndView writeForm() {
		ModelAndView mav=new ModelAndView("main");
		mav.addObject(new Qna());
		mav.addObject("BODY","qnaInput.jsp");
		return mav;
	}
}







