package controller;
import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.CommentDao;
import model.Comment;
import model.Product;
import model.User;


@Controller
public class CommentController {
	@Autowired
	private CommentDao commentDao;
	
	@RequestMapping(value="/comment/delete.html",
			method=RequestMethod.GET)
	public ModelAndView delete(String code,HttpSession session,String c_id) {
		String id=(String)session.getAttribute("loginUser");
		if(id==null||id.equals("")) {
			ModelAndView mav=
					new ModelAndView("main");
			mav.addObject(new User());
			mav.addObject("BODY","login.jsp");
			mav.addObject("RESULT","nologin");
			return mav;
		}
		ModelAndView mav=new ModelAndView("main");
		if(id.equals(c_id)) {
			commentDao.deleteComment(code);
			mav.addObject("DELETE","OK");
		}else {
			mav.addObject("DELETE","NOK");
		}
		mav.addObject("BODY","commentResult.jsp");
		return mav;
	}

	
	
	@RequestMapping(value="/comment/writeForm.html",
			method=RequestMethod.GET)
	public ModelAndView writeForm(String ol_code, String p_code,HttpSession session) {
		String id=(String)session.getAttribute("loginUser");
		System.out.println("후기작성폼");
		if(id==null||id.equals("")) {
			ModelAndView mav=
					new ModelAndView("main");
			mav.addObject(new User());
			mav.addObject("BODY","login.jsp");
			mav.addObject("RESULT","nologin");
			return mav;
		}
		ModelAndView mav=new ModelAndView("main");
		Comment com = new Comment();
		com.setOl_code(ol_code);
		mav.addObject("comment", com);
		mav.addObject("p_code", p_code);
		
		mav.addObject("BODY","commentInput.jsp");
		return mav;
	}
	
	@RequestMapping(value="/comment/write.html",
			method=RequestMethod.POST)
	public ModelAndView write(@Valid Comment comment,
			BindingResult bindingResult,String ol_code,String p_code,
			HttpSession session) {
		String id=(String)session.getAttribute("loginUser");
//		if(bindingResult.getErrorCount()>0) {
//			ModelAndView mav=
//					new ModelAndView("main");
//			mav.addObject("BODY","commentInput.jsp");
//			mav.getModel().putAll(
//					bindingResult.getModel());
//			return mav;
//		}
		
		int wg = comment.getW_grade()*10;
		comment.setW_grade(wg);
		comment.setC_id(id);
		comment.setOl_code(ol_code);
		System.out.println(comment.getW_grade());
		MultipartFile multiFile=comment.getImage();
		String fileName=null; String path=null;
		OutputStream os = null;
		if(multiFile != null) {
			fileName=multiFile.getOriginalFilename();
			ServletContext context = 
					session.getServletContext();
			path=context.getRealPath(
					"/upload/"+fileName);
			try {
				os=new FileOutputStream(path);
				BufferedInputStream bis = 
					new BufferedInputStream(
						multiFile.getInputStream());
				byte[] buffer = new byte[8106];
				int read = 0;
				while((read=bis.read(buffer))>0) {
					os.write(buffer, 0, read);
				}
				if(os !=null) os.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			comment.setC_image(fileName);
		}
		
		//DB에 삽입
		Integer maxId=commentDao.getMaxCommentId();
		//product 상품평점 update
		Comment info=commentDao.getCommentGrade(p_code);
		System.out.println("sum:"+info.getSum()+" count:"+info.getNum());
		
		int avg=(info.getSum()+comment.getW_grade())/(info.getNum()+1);
		Product pGrade=new Product();
		pGrade.setP_grade(String.valueOf(avg));
		pGrade.setP_code(p_code);
		commentDao.updateProductGrade(pGrade);
		
		if(maxId == null) maxId = 0;
		comment.setComment_id(String.valueOf(maxId+1));
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH)+1;
		int date=today.get(Calendar.DATE);
		String w_date=year+"년"+month+"월"+date+"일";
		comment.setW_date(w_date);
		commentDao.insertComment(comment);
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("BODY","commentResult.jsp");
		
		return mav;

	}
}









