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
<<<<<<< HEAD
=======
		mav.setViewName("index");

>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}
	@RequestMapping(value = "/singleproduct.tem", method = RequestMethod.GET)
	public ModelAndView singleproduct() {
<<<<<<< HEAD
=======
		mav.setViewName("singleproduct");
>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}
	@RequestMapping(value = "/singleblog.tem", method = RequestMethod.GET)
	public ModelAndView singleblog() {
<<<<<<< HEAD
=======
		mav.setViewName("singleblog");

>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}	
	@RequestMapping(value = "/productlist.tem", method = RequestMethod.GET)
	public ModelAndView productlist() {
<<<<<<< HEAD
=======
		mav.setViewName("productlist");

>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}
	@RequestMapping(value = "/elements.tem", method = RequestMethod.GET)
	public ModelAndView elements() {
<<<<<<< HEAD
=======
		mav.setViewName("elements");

>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}	
	@RequestMapping(value = "/contact.tem", method = RequestMethod.GET)
	public ModelAndView contact() {
<<<<<<< HEAD
=======
		mav.setViewName("contact");

>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}	
	@RequestMapping(value = "/confirmation.tem", method = RequestMethod.GET)
	public ModelAndView confirmation() {
<<<<<<< HEAD
=======
		mav.setViewName("confirmation");

>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}	
	@RequestMapping(value = "/cart.tem", method = RequestMethod.GET)
	public ModelAndView cart() {
<<<<<<< HEAD
=======
		mav.setViewName("cart");

>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}	
	@RequestMapping(value = "/blog.tem", method = RequestMethod.GET)
	public ModelAndView blog() {
<<<<<<< HEAD
=======
		mav.setViewName("blog");

>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}	
	@RequestMapping(value = "/about.tem", method = RequestMethod.GET)
	public ModelAndView about() {
<<<<<<< HEAD
=======
		mav.setViewName("about");

>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}
	@RequestMapping(value = "/login.tem", method = RequestMethod.GET)
	public ModelAndView login() {
<<<<<<< HEAD
=======
		mav.setViewName("login");

>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}	
	@RequestMapping(value = "/insertPro.tem", method = RequestMethod.GET)
	public ModelAndView insertPro() {
<<<<<<< HEAD
=======
		mav.setViewName("insertPro");

>>>>>>> 0e481aa64ae0dca9ccf1ba3cdde80307d69f45c1
		return mav;
	}	
}
