package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.QnaDao;
import dao.ReadDao;
import model.Condition;
import model.Qna;

@Controller
public class ReadController {
	@Autowired
	private ReadDao readDao;
	@Autowired
	private QnaDao qnaDao;

	
	@RequestMapping(value="/read/readDetail.html",
			method=RequestMethod.GET)
	public ModelAndView detail(Integer qna_id,HttpSession session) {
		Qna qna = readDao.getQnaDetail(qna_id);
		System.out.println("OK"+qna_id);
		ModelAndView mav=new ModelAndView("main");
		String c_id=(String)session.getAttribute("loginUser");
		System.out.println(c_id);
		if(c_id==null||c_id.equals("")) {
			mav.addObject("BODY","qnaResult.jsp");
			mav.addObject("LOGIN","no");
		}else if(c_id.equals(qna.getC_id())) {
			
			System.out.println("BOK"+qna.getQna_id());
			mav.addObject("BODY","bbsItemView.jsp");
			//조회 결과를 mav에 저장
			mav.addObject("QNA_ITEM",qna);
		}else {
			mav.addObject("BODY","qnaResult.jsp");
			mav.addObject("NOK","no");
			System.out.println("아이디가 다름");
		}
		return mav;
	}
	
	@RequestMapping(value="/qna/read.html",
			method=RequestMethod.GET)
	public ModelAndView readQna(Integer pageNo,Integer qna_id) {
		Condition c = new Condition();
		Integer cnt=readDao.getQnaCount();
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		if(cnt == null) cnt = 0;
		int startRow = 0; int endRow = 0;
		int pageCnt = 0;
		if(cnt > 0) {//게시글이 존재하는 경우
			pageCnt = cnt / 5;
			if(cnt % 5 > 0) pageCnt++;
			startRow = (currentPage-1)*5 + 1;
			endRow = currentPage * 5;
			if(endRow > cnt) endRow = cnt;
		}
		if(qna_id != null) {
			int replyPages=
					qnaDao.selectReplyPages(qna_id);
			int page = replyPages / 5;
			if(replyPages % 5 != 0) page++;
			pageNo = page;
		}
		c.setStartRow(startRow); c.setEndRow(endRow);
		List<Qna> bbsList = readDao.readQNA(c);
		ModelAndView mav=new ModelAndView("main");
		mav.addObject("BODY","list_view.jsp");
		mav.addObject("BBS_LIST",bbsList);
		mav.addObject("startRow", startRow);
	    mav.addObject("endRow", endRow);
	    mav.addObject("count", cnt);
	    mav.addObject("currentPage", currentPage);
	    mav.addObject("pageCount",pageCnt);
		return mav;
	}
}











