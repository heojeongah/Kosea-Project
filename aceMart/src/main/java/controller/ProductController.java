package controller;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

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

import dao.ProductDao;
import model.PCondition;
import model.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductDao productDao;

	@RequestMapping(value="/product/read.html",
			method=RequestMethod.POST)
	public ModelAndView readProduct(String searchOption,String keyword,Integer pageNo) {
		PCondition c = new PCondition();
		List<Product> productList=null;
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		int startRow = 0; int endRow = 0;
		int pageCnt = 0;
		Integer cnt=null;		
		if(cnt == null) cnt = 0;
		if(keyword==null||keyword.equals("")) {
			cnt=productDao.getProductCount();
			if(cnt > 0) {//게시글이 존재하는 경우
				pageCnt = cnt / 10;
				if(cnt % 10 > 0) pageCnt++;
				startRow = (currentPage-1)*10 + 1;
				endRow = currentPage * 10;
				if(endRow > cnt) endRow = cnt;
			}
			c.setStartRow(startRow); c.setEndRow(endRow);
			productList = productDao.readProduct(c);
		} else{
			if(searchOption.equals("brand")) {
				cnt=productDao.getProductBrandCount(keyword);
				if(cnt > 0) {//게시글이 존재하는 경우
					pageCnt = cnt / 10;
					if(cnt % 10 > 0) pageCnt++;
					startRow = (currentPage-1)*10 + 1;
					endRow = currentPage * 10;
					if(endRow > cnt) endRow = cnt;
				}
				c.setStartRow(startRow); c.setEndRow(endRow);
				c.setP_brand(keyword);
				productList=productDao.readProductBrand(c);
			}
			if(searchOption.equals("type")) {
				cnt=productDao.getProductTypeCount(keyword);
				if(cnt > 0) {//게시글이 존재하는 경우
					pageCnt = cnt / 10;
					if(cnt % 10 > 0) pageCnt++;
					startRow = (currentPage-1)*10 + 1;
					endRow = currentPage * 10;
					if(endRow > cnt) endRow = cnt;
				}
				c.setStartRow(startRow); c.setEndRow(endRow);
				c.setP_type(keyword);
				productList=productDao.readProductType(c);
			}
			if(searchOption.equals("code")) {
				List<Product> pList=productDao.getProductDetail(keyword);
				productList=new ArrayList(); 
				productList.add(pList.get(0));
			}
		}
		ModelAndView mav=new ModelAndView("main");
		mav.addObject("BODY","productListView.jsp");
		mav.addObject("PRODUCT_LIST",productList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		return mav;
	}

	@RequestMapping(value="/product/read.html",
			method=RequestMethod.GET)
	public ModelAndView read(Integer pageNo) {
		PCondition c = new PCondition();
		List<Product> productList=null;
		int currentPage = 0;
		if(pageNo == null) currentPage = 1;
		else currentPage = pageNo;
		int startRow = 0; int endRow = 0;
		int pageCnt = 0;
		Integer cnt=null;		
		if(cnt == null) cnt = 0;

		cnt=productDao.getProductCount();
		if(cnt > 0) {//게시글이 존재하는 경우
			pageCnt = cnt / 10;
			if(cnt % 10 > 0) pageCnt++;
			startRow = (currentPage-1)*10 + 1;
			endRow = currentPage * 10;
			if(endRow > cnt) endRow = cnt;
		}
		c.setStartRow(startRow); c.setEndRow(endRow);
		productList = productDao.readProduct(c);
		ModelAndView mav=new ModelAndView("main");
		mav.addObject("BODY","productListView.jsp");
		mav.addObject("PRODUCT_LIST",productList);
		mav.addObject("startRow", startRow);
		mav.addObject("endRow", endRow);
		mav.addObject("count", cnt);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pageCount",pageCnt);
		return mav;
	}
	
	@RequestMapping(value="/product/delete.html",
			method=RequestMethod.GET)
	public ModelAndView delete(String p_code) {
		productDao.deleteProduct(p_code);
		return new ModelAndView("redirect:/product/read.html");
	}
	@RequestMapping(value="/product/update.html",
			method=RequestMethod.POST)
	public ModelAndView update(@Valid Product product,
			HttpSession session) {

		Product info = productDao.getProductDetail(product.getP_code()).get(0);
		MultipartFile[] multiFile =product.getImage();
		String fileName=null; String path=null;
		OutputStream os = null;

		if(multiFile.length==1) {
			System.out.println("no images");
			product.setP_image1(info.getP_image1());
			product.setP_image2(info.getP_image2());
			product.setP_image3(info.getP_image3());
		}else {
			for(int i=0;i<multiFile.length;i++) {
				fileName=multiFile[i].getOriginalFilename();
				ServletContext context = 
						session.getServletContext();
				path=context.getRealPath(
						"/upload/"+fileName);
				try {
					os=new FileOutputStream(path);
					BufferedInputStream bis = 
						new BufferedInputStream(
							multiFile[i].getInputStream());
					byte[] buffer = new byte[8106];
					int read = 0;
					while((read=bis.read(buffer))>0) {
						os.write(buffer, 0, read);
					}
					if(os !=null) os.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				if(i==0) {
					if(fileName==null||fileName.equals("")) {
						fileName=info.getP_image1();
					}
					System.out.println("image1:"+fileName);
					product.setP_image1(fileName);
				}else if(i==1) {
					if(fileName==null||fileName.equals("")) {
						fileName=info.getP_image2();
					}
					System.out.println("image2");
					product.setP_image2(fileName);
				}else {
					if(fileName==null||fileName.equals("")) {
						fileName=info.getP_image3();
					}
					System.out.println("image3");
					product.setP_image3(fileName);
				}
			}
		}
		System.out.println("size:"+product.getP_size());
		System.out.println("name:"+product.getP_name());
		System.out.println("image1:"+product.getP_image1());
		product.setP_intro("");product.setP_grade(info.getP_grade());
		//DB에 삽입
		productDao.updateProduct(product);
		return new ModelAndView("redirect:/product/read.html");
	}
	@RequestMapping(value="/product/add.html",
			method=RequestMethod.POST)
	public ModelAndView write(@Valid Product product,
			HttpSession session) {
		System.out.println("name:"+product.getP_name());
		System.out.println("image1:"+product.getP_image1());
//		if(bindingResult.getErrorCount()>0) {
//			ModelAndView mav=
//					new ModelAndView("main");
//			mav.addObject("BODY","productInput.jsp");
//			mav.getModel().putAll(
//					bindingResult.getModel());
//			return mav;
//		}
		MultipartFile[] multiFile =product.getImage();
		String fileName=null; String path=null;
		OutputStream os = null;
		for(int i=0;i<multiFile.length;i++) {
			if(multiFile != null) {
				fileName=multiFile[i].getOriginalFilename();
				ServletContext context = 
						session.getServletContext();
				path=context.getRealPath(
						"/upload/"+fileName);
				try {
					os=new FileOutputStream(path);
					BufferedInputStream bis = 
						new BufferedInputStream(
							multiFile[i].getInputStream());
					byte[] buffer = new byte[8106];
					int read = 0;
					while((read=bis.read(buffer))>0) {
						os.write(buffer, 0, read);
					}
					if(os !=null) os.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				if(i==0) {
					product.setP_image1(fileName);
				}else if(i==1) {
					product.setP_image2(fileName);
				}else {
					product.setP_image3(fileName);
				}
			}
		}

		System.out.println("size:"+product.getP_size());
		System.out.println("brand:"+product.getP_brand());
		System.out.println("name:"+product.getP_name());
		System.out.println("image1:"+product.getP_image1());
		product.setP_intro("");
		product.setP_grade("");
		//DB에 삽입
		productDao.insertProduct(product);

		return new ModelAndView("redirect:/product/read.html");
	}
	@RequestMapping(value="/product/updateForm.html",
			method=RequestMethod.GET)
	public ModelAndView produpdate(String p_code) {
		ModelAndView mav=new ModelAndView("main");
		List<Product> product = productDao.getProductDetail(p_code);
		mav.addObject("BODY","productModify.jsp");
		List<String> brands=productDao.getBrands();
		List<String> types=productDao.getTypes();
		mav.addObject("brands",brands);
		mav.addObject("types",types);
		mav.addObject("product",product.get(0));
		return mav;
	}
	
	@RequestMapping(value="/product/productTemplate.html",
			method=RequestMethod.GET)
	public ModelAndView bbsInput() {
		ModelAndView mav=new ModelAndView("main");
		mav.addObject(new Product());
		List<String> brands=productDao.getBrands();
		List<String> types=productDao.getTypes();
		mav.addObject("BODY","productInput.jsp");
		mav.addObject("brands",brands);
		mav.addObject("types",types);
		return mav;
	}
	@RequestMapping(value="/product/write.html",
			method=RequestMethod.POST)
	public ModelAndView put(@Valid Product product, BindingResult bindingResult) {
		ModelAndView mav=new ModelAndView("main");
		if(bindingResult.getErrorCount()>0) {
			mav.addObject("BODY","productInput.jsp");
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
			productDao.insertProduct(product);
			return new ModelAndView(
					"redirect:/product/read.html");
	}
	@RequestMapping(value="/product/readDetail.html",
			method=RequestMethod.GET)
	public ModelAndView detail(String PCODE) {
		List<Product> pList = productDao.getProductDetail(PCODE);
		ModelAndView mav=new ModelAndView("main");
		mav.addObject("BODY","productItemView.jsp");
		//조회 결과를 mav에 저장
		mav.addObject("PRODUCT_ITEM",pList.get(0));
		mav.addObject("ITEMS", pList);
		return mav;
	}
	
}
