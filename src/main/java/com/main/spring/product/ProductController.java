package com.main.spring.product;

import java.io.File;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
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
		return mav;
	}
	@RequestMapping(value = "/admin/insertPro.pro", method = RequestMethod.GET)
	public ModelAndView insertPro() {
		return mav;
	}
	@RequestMapping(value = "/admin/insertItem.pro", method = RequestMethod.POST)
	public ModelAndView insertItem(MultipartHttpServletRequest multi
								  )throws Exception {
		String filePath="D:\\workspace_spring\\project\\src\\main\\webapp\\WEB-INF\\views\\Productimage\\";
		MultipartFile file = multi.getFile("image");
		String fileName = multi.getFile("image").getOriginalFilename();
		System.out.println(fileName);
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
	
}
