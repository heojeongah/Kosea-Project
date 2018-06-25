package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.CommentDao;
import model.Comment;
import model.SCondition;

@Controller
public class CommentController {

	@Autowired
	private CommentDao comDao;
	
	@RequestMapping(value="/read/readDetail.html",
			method=RequestMethod.GET)
	public ModelAndView readDetail(String COMMENT_ID) {
		Comment comment = comDao.getCommentDetail(COMMENT_ID);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","commentDetail.jsp");
		mav.addObject("comment",comment);
		return mav;
	}
	
	@RequestMapping(value="/read/readComment.html",
			method=RequestMethod.GET)
	public ModelAndView readComment(Integer pageNo) {
		SCondition sc = new SCondition();
		Integer cnt = comDao.getCommentCount();
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		if(cnt == null) cnt =0;
		int startRow = 0; int endRow=0;
		int pageCnt = 0;
		if(cnt > 0) {
			pageCnt = cnt / 10;
			if(cnt % 10>0) pageCnt++;
			startRow = (currentPage-1)*10 +1;
			endRow = currentPage * 10;
			if(endRow > cnt) endRow = cnt;
		}
		sc.setStartRow(startRow);sc.setEndRow(endRow);
		List<Comment> comList = comDao.readCommentList(sc);

		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY", "commentList.jsp");
		mav.addObject("COMMENT_LIST",comList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		return mav;
	}
}














