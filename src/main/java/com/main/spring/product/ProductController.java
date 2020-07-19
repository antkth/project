package com.main.spring.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	private ModelAndView mav = new ModelAndView();
	@Autowired
	private ProductService productService;
	@RequestMapping(value = "/insertPro.pro", method = RequestMethod.GET)
	public ModelAndView insertPro() {
		return mav;
	}
	@RequestMapping(value = "/insertItem.pro", method = RequestMethod.POST)
	public ModelAndView insertItem(@RequestParam ProductVO productVO) {
		return mav;
	}
	
}
