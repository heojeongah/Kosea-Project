package controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.QnaDao;
import model.Condition;
import model.Qna;

@Controller
public class QnaController {
	@Autowired
	private QnaDao qnaDao;
	@RequestMapping(value="/qna/qnaReplyForm.html",
			method=RequestMethod.GET)
	public ModelAndView qnaReplyForm(Integer qna_id) {
		ModelAndView mav = new ModelAndView("main");
		Qna qna = qnaDao.getQnaInfoById(qna_id);
		qna.setContent(null);
		qna.setC_id(null);
		mav.addObject(qna);
		mav.addObject("title","답변] "+qna.getTitle());
		mav.addObject("BODY","qnaForm.jsp?group_id="+qna.getGroup_id()+
				"&parent_id="+qna_id);
		return mav;
	}
	@RequestMapping(value="/qna/read.html",
			method=RequestMethod.GET)
	public ModelAndView list(Integer SEQNO,
			Integer pageNo) {
		if(pageNo == null) pageNo = 1;
		if(SEQNO != null) {
			int replyPages=
					qnaDao.selectReplyPages(SEQNO);
			int page = replyPages / 3;
			if(replyPages % 3 != 0) page++;
			pageNo = page;
		}//글번호로 페이지번호를 찾음
		int totalPageCount = 0;
		int startRow = 0; int endRow = 0;
		int currentPage = pageNo;
		int count=qnaDao.selectQnaCount();
		if(count > 0) {
			totalPageCount = count / 3;
			if(count % 3 > 0) totalPageCount++;
			startRow=(currentPage-1)*3 + 1;
			endRow=currentPage * 3;
			if(endRow > count) endRow = count;
		}
		Condition c = new Condition();
		c.setStartRow(startRow);c.setEndRow(endRow);
		List<Qna> qnaList = 
			qnaDao.getQna(c);
		ModelAndView mav=new ModelAndView("main");
		mav.addObject("LIST",qnaList);
		mav.addObject("count",count);
		mav.addObject("startRow",startRow);
		mav.addObject("endRow",endRow);
		mav.addObject("pageCount",totalPageCount);
		mav.addObject("currentPage",currentPage);
		mav.addObject("BODY","qnaPage.jsp");
		return mav;
	}
	
	@RequestMapping(value="/qna/writeReply.html",
			method=RequestMethod.POST)
	public ModelAndView qna(@Valid Qna qna,
			BindingResult bindingResult,
			HttpSession session,
			Integer parent_id, 
			Integer group_id,
			Integer order_no) {
		if(bindingResult.getErrorCount()>0) {
			ModelAndView mav=
					new ModelAndView("main");
			mav.addObject("BODY","qnaForm.jsp");
			mav.getModel().putAll(
					bindingResult.getModel());
			return mav;
		}
		//DB에 삽입
		Integer maxId=qnaDao.getMaxQnaId();
		if(maxId == null) maxId = 0;
		Qna info = qnaDao.getQnaInfoById(qna.getQna_id());
		qna.setParent_id(parent_id);
		qna.setGroup_id(group_id);
		qna.setOrder_no(order_no);
		//order_no를 변경
		qnaDao.updateQnaReply(qna);
		qna.setQna_id(maxId + 1);
		qna.setC_id(info.getC_id());
		qna.setW_state("답변완료");
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH)+1;
		int date=today.get(Calendar.DATE);
		String regiestDate=year+"년"+month+"월"+date+"일";
		qna.setW_date(regiestDate);
		qnaDao.insertQna(qna);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","qnaResult.jsp?SEQNO="+(maxId+1));
		return mav;
	}
	

}
