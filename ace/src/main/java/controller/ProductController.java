package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.CommentDao;
import dao.ProductDao;
import model.Comment;
import model.Condition;
import model.Product;

@Controller
public class ProductController {
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private ProductDao productDao;

	@RequestMapping(value="/product/productSearch.html",
			method=RequestMethod.GET)
	public ModelAndView productSearch(Integer pageNo,String sp) {
		ModelAndView mav=new ModelAndView(
				"main");
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		Condition c = new Condition();
		c.setValue(sp);
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
		mav.addObject(new Product());
		c.setStartRow(startRow); c.setEndRow(endRow);
		c.setValue(sp);
		List<Product> product=productDao.getProductSearch(c);
		mav.addObject("BODY","productSearch.jsp");
		mav.addObject("LIST",product);
		mav.addObject("startRow", startRow);
	    mav.addObject("endRow", endRow);
	    mav.addObject("count", cnt);
	    mav.addObject("currentPage", currentPage);
	    mav.addObject("pageCount",pageCnt);
	    mav.addObject("sp",sp);
		return mav;
	}
	
	@RequestMapping(value="/product/kudoType.html",
			method=RequestMethod.GET)
	public ModelAndView kudoInput(Integer pageNo) {
		ModelAndView mav=new ModelAndView(
				"main");
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		Condition c = new Condition();
		c.setP_type("구두");
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
		mav.addObject(new Product());
		c.setStartRow(startRow); c.setEndRow(endRow);
		List<Product> type=productDao.getTypeSearch(c);
		mav.addObject("BODY","product.jsp");
		mav.addObject("LIST",type);
	    mav.addObject("cate","구두");
		mav.addObject("startRow", startRow);
	    mav.addObject("endRow", endRow);
	    mav.addObject("count", cnt);
	    mav.addObject("currentPage", currentPage);
	    mav.addObject("pageCount",pageCnt);
		return mav;
	}
	
	@RequestMapping(value="/product/sneakersType.html",
			method=RequestMethod.GET)
	public ModelAndView typeInput(Integer pageNo) {
		ModelAndView mav=new ModelAndView(
				"main");
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		Condition c = new Condition();
		c.setP_type("운동화");
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
		mav.addObject(new Product());
		c.setStartRow(startRow); c.setEndRow(endRow);
		List<Product> type=productDao.getTypeSearch(c);
		mav.addObject("BODY","product.jsp");
		mav.addObject("LIST",type);
		mav.addObject("startRow", startRow);
	    mav.addObject("endRow", endRow);
	    mav.addObject("count", cnt);
	    mav.addObject("cate","운동화");
	    mav.addObject("currentPage", currentPage);
	    mav.addObject("pageCount",pageCnt);
		return mav;
	}
	
	@RequestMapping(value="/product/readDetail.html",
			method=RequestMethod.GET)
	public ModelAndView detail(String code,Integer pageNo,Integer num) {
		//후기 검색을 위한 condition
		Condition c = new Condition();
		Integer cnt=commentDao.getCommentCount();
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
		c.setP_code(code);
		c.setStartRow(startRow); c.setEndRow(endRow);//여기까지
		
		List<Product> pList = productDao.getProductDetail(code);
		List<Comment> cList = commentDao.getCommentDetail(c);
		ModelAndView mav=new ModelAndView("main");
		mav.addObject("BODY","productItemView.jsp");
		mav.addObject("PRODUCT_ITEM",pList.get(0));
		mav.addObject("ITEMS", pList);
		mav.addObject("ITEM_NUM",num);
		mav.addObject("COMMENTS", cList);
		return mav;
	}
	
	@RequestMapping(value="/product/read.html",
			method=RequestMethod.GET)
	public ModelAndView readProduct(Integer pageNo,String type) {
		Condition c = new Condition();
		ModelAndView mav=new ModelAndView("main");
		if(type!=null) {
			if(type.equals("run")) {
				c.setP_type("운동화");
			}
			if(type.equals("kudo")) {
				c.setP_type("구두");
			}
			if(type.equals("sandal")) {
				c.setP_type("샌들");
			}
			if(type.equals("sports")) {
				c.setP_type("스포츠");
			}
		}
		Integer cnt=productDao.getProductCount(c);
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
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
		List<Product> productList =null;
		if(type!=null) {
			productList=productDao.getTypeSearch(c);
			mav.addObject("cate", type);
		}else {
			productList= productDao.readProduct(c);
		}
		mav.addObject("BODY","product.jsp");
		mav.addObject("LIST",productList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		return mav;
	}
}
