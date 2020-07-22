package com.main.spring.product;

import java.io.File;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.main.spring.review.ReviewService;
import com.main.spring.review.ReviewVO;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	private ModelAndView mav = new ModelAndView();
	int number = 0;	
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductVO productVO;	
	
	@RequestMapping(value = "/index.pro", method = RequestMethod.GET)
	public ModelAndView index() {
		return mav;
	}
	@RequestMapping(value = "/admin/insertPro.pro", method = RequestMethod.GET)
	public ModelAndView insertPro() {
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
	@RequestMapping(value = "/productlist6.pro", method = RequestMethod.GET)
	public void productlist6(@RequestParam String category1,@RequestParam String category3,HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		if(request.getParameter("number")!=null) number=Integer.parseInt(request.getParameter("number"));
		List productlist6 = productService.getProductList6(number, category1, category3 );
		JSONArray productArray = new JSONArray();
		for(int i=0; i<productlist6.size(); i++) {
			JSONObject productInfo = new JSONObject();
			productVO = (ProductVO) productlist6.get(i);
			productInfo.put("image", productVO.getImage());
			productInfo.put("name", productVO.getName());
			productInfo.put("price", productVO.getPrice());
			productInfo.put("num", productVO.getNum());
			productArray.add(productInfo);	
		}
		response.getWriter().print(productArray);
	}	
	@RequestMapping(value = "/productlist.pro", method = RequestMethod.GET)
	public ModelAndView productList(@RequestParam String category1,
									@RequestParam String category3,
									HttpServletRequest request, HttpServletResponse response) throws Exception {
		List productList = productService.getProductList6(number, category1, category3);
		mav.addObject("productList", productList);
		mav.addObject("category1",category1);
		mav.addObject("category3",category3);
		return mav;
	}
	
	@RequestMapping(value = "/productInfo.pro", method = RequestMethod.GET)
	public ModelAndView getProductInfo(@RequestParam int num,
									   HttpServletRequest request,
									   HttpServletResponse response)throws Exception{
		
		productVO = productService.getProductInfo(num);
		mav.addObject("productVO", productVO);
		return mav; 
	}
	
	
	
	
	
	
	//---------------------------------------------------------------------------------------------------	
	
		private String getViewName(HttpServletRequest request) throws Exception {
			String contextPath = request.getContextPath();
			String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
			if (uri == null || uri.trim().equals("")) {
				uri = request.getRequestURI();
			}

			int begin = 0;
			if (!((contextPath == null) || ("".equals(contextPath)))) {
				begin = contextPath.length();
			}

			int end;
			if (uri.indexOf(";") != -1) {
				end = uri.indexOf(";");
			} else if (uri.indexOf("?") != -1) {
				end = uri.indexOf("?");
			} else {
				end = uri.length();
			}

			String fileName = uri.substring(begin, end);
			if (fileName.indexOf(".") != -1) {
				fileName = fileName.substring(0, fileName.lastIndexOf("."));
			}
			if (fileName.lastIndexOf("/") != -1) {
											//  /member/listMembers.do로 요청할 경우
											//	/member/listMembers를 View이름으로 가져오게 하기! ↓ ( .do를 제외한 나머지를 가져오게하기 )
				fileName = fileName.substring(fileName.lastIndexOf("/", 1), fileName.length());
			}
			return fileName;
		}	

	}
