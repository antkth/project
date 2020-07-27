package com.main.spring.product;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	private ModelAndView mav = new ModelAndView();
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(value = "/index.pro", method = RequestMethod.GET)
	public ModelAndView index() {
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping(value = "/admin/insertPro.pro", method = RequestMethod.GET)
	public ModelAndView insertPro() {
		mav.setViewName("admin/insertPro");
		return mav;
	}
	@RequestMapping(value = "/admin/insertItem.pro", method = RequestMethod.POST)
	public ModelAndView insertItem(MultipartHttpServletRequest multi
								  )throws Exception {
		String filePath="D:\\workspace_spring\\project\\src\\main\\webapp\\resources\\img_catfood\\";
							
		MultipartFile file = multi.getFile("image");
		String fileName = multi.getFile("image").getOriginalFilename();
		file.transferTo(new File(filePath+fileName));
		ProductVO productVO = new ProductVO(multi.getParameter("name"),
											multi.getParameter("origin"),
											multi.getParameter("manufacturer"),
											multi.getParameter("category1"),
											multi.getParameter("category3"),
											fileName,
											Integer.parseInt(multi.getParameter("price")),
											Timestamp.valueOf(multi.getParameter("exp_date")+" 00:00:00.0"));
		productService.proinsert(productVO);
		mav.setViewName("admin/insertPro");
		return mav;
	}
	@RequestMapping(value = "/productlist.pro", method = RequestMethod.GET)
	public ModelAndView productList(@RequestParam String category1,
									@RequestParam String category3,
									HttpServletRequest request, HttpServletResponse response) throws Exception {
		int number = 0;
		List productList = productService.getProductList6(number, category1, category3);
		mav.addObject("productList", productList);
		mav.addObject("category1",category1);
		mav.addObject("category3",category3);
		mav.setViewName("productlist");
		return mav;
	}
	
	@RequestMapping(value = "/productInfo.pro", method = RequestMethod.GET)
	public ModelAndView getProductInfo(@RequestParam int num,
									   HttpServletRequest request,
									   HttpServletResponse response)throws Exception{
		
		ProductVO productVO = productService.getProductInfo(num);
		int DC = 0;
		if(productVO.getInventory()>50) DC +=10;
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE,31);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date nowdate = format.parse(format.format(cal.getTime()));
		Date exp_date = format.parse(format.format(productVO.getExp_date()));
		if(nowdate.compareTo(exp_date)==1) DC+=10;
		int real_price = Math.round(productVO.getPrice()/100*(100-DC)/100)*100;
		productVO.setReal_price(real_price);
		productService.lastview(request,num,productVO.getName(),productVO.getImage());
		int number = productService.getReviewTotal(num);
		System.out.println(number);
		if(number != 0) {
			double scoreAVG = productService.getScoreAVG(num);
			
			mav.addObject("scoreAVG", scoreAVG);
		}
		mav.addObject("productVO", productVO);
		mav.setViewName("productInfo");
		return mav; 
}
	
	@RequestMapping(value = "/productSearch", method = RequestMethod.GET)
	public ModelAndView productSearch(	@RequestParam(defaultValue = "") String search_key,
										@RequestParam String category1,
										@RequestParam String category3,
										@RequestParam(defaultValue = "1") int nowPage,
										HttpServletRequest request) throws Exception{

		int total= productService.getAllProduct(search_key, category1, category3);
		int pageSize = 9;
		int pageFirst = (nowPage -1) * pageSize;
		int totalPage = total/pageSize + (total%pageSize==0?0:1);
		int blockSize = 5;
		int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
		int blockLast = blockFirst + blockSize -1;
		
		if(blockLast>totalPage) blockLast=totalPage;
		
		List productList = productService.getKeyList(search_key, category1, category3, pageFirst, pageSize);
		HashMap p_map = new HashMap();
		p_map.put("pageSize", pageSize);
		p_map.put("pageFirst", pageFirst);
		p_map.put("totalPage", totalPage);
		p_map.put("blockSize", blockSize);
		p_map.put("blockFirst", blockFirst);
		p_map.put("blockLast", blockLast);
		p_map.put("nowPage", nowPage);
		List list = new ArrayList();
		for(int i = 0 ; i < productList.size() ; i ++) {
			ProductVO productVO = (ProductVO)productList.get(i);
			int DC = 0;
			if(productVO.getInventory()>50) DC +=10;
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE,31);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date nowdate = format.parse(format.format(cal.getTime()));
			Date exp_date = format.parse(format.format(productVO.getExp_date()));
			if(nowdate.compareTo(exp_date)==1) DC+=10;
			int real_price = Math.round(productVO.getPrice()/100*(100-DC)/100)*100;
			productVO.setReal_price(real_price);
			list.add(productVO);
		}
	
		mav.addObject("productList", list);
		mav.addObject("search_key", search_key);
		mav.addObject("category1", category1);
		mav.addObject("category3", category3);
		mav.addObject("p_map", p_map);
		mav.setViewName("productlist");
		return mav;
	}
	@RequestMapping(value = "/chegecategory.pro", method = RequestMethod.GET)
	public ModelAndView chegecategory(HttpServletRequest request) {
		if(request.getSession().getAttribute("chegecategory")==null||request.getSession().getAttribute("chegecategory").equals("1")) {
			request.getSession().setAttribute("chegecategory","0");
		}else {
			request.getSession().setAttribute("chegecategory","1");
		}
		mav.setViewName("index");
		return mav;
	}

}
