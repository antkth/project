package com.main.spring.temporay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class temporayController {
	private ModelAndView mav = new ModelAndView();
	@RequestMapping(value = "/index.tem", method = RequestMethod.GET)
	public ModelAndView index() {
		return mav;
	}
	@RequestMapping(value = "/singleproduct.tem", method = RequestMethod.GET)
	public ModelAndView singleproduct() {
		return mav;
	}
	@RequestMapping(value = "/singleblog.tem", method = RequestMethod.GET)
	public ModelAndView singleblog() {
		return mav;
	}	
	@RequestMapping(value = "/productlist.tem", method = RequestMethod.GET)
	public ModelAndView productlist() {
		return mav;
	}
	@RequestMapping(value = "/elements.tem", method = RequestMethod.GET)
	public ModelAndView elements() {
		return mav;
	}	
	@RequestMapping(value = "/contact.tem", method = RequestMethod.GET)
	public ModelAndView contact() {
		return mav;
	}	
	@RequestMapping(value = "/confirmation.tem", method = RequestMethod.GET)
	public ModelAndView confirmation() {
		return mav;
	}	
	@RequestMapping(value = "/cart.tem", method = RequestMethod.GET)
	public ModelAndView cart() {
		return mav;
	}	
	@RequestMapping(value = "/blog.tem", method = RequestMethod.GET)
	public ModelAndView blog() {
		return mav;
	}	
	@RequestMapping(value = "/about.tem", method = RequestMethod.GET)
	public ModelAndView about() {
		return mav;
	}
	@RequestMapping(value = "/login.tem", method = RequestMethod.GET)
	public ModelAndView login() {
		return mav;
	}	
	@RequestMapping(value = "/insertPro.tem", method = RequestMethod.GET)
	public ModelAndView insertPro() {
		return mav;
	}	
}
