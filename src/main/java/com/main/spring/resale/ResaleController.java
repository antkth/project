package com.main.spring.resale;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResaleController {

	@Autowired
	private ResaleService resaleService;
	private ModelAndView mav = new ModelAndView();

	  @RequestMapping(value = "/insertResale.res", method = RequestMethod.POST)
	  public ModelAndView insertResale(@ModelAttribute ResaleVO resaleVO, @RequestParam Date startDate) {
		  resaleVO.setRe_date(Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startDate)));
		  resaleService.insertResale(resaleVO);
		  mav.setViewName("resaleList"); 
	  return mav;
	  }
	  
	  @RequestMapping(value = "/ad_resaleList.res", method = RequestMethod.GET)
	  public ModelAndView ad_resaleList(@ModelAttribute ResaleVO resaleVO) {
		  resaleService.checkResale();
		  List list = resaleService.resaleList();
		  mav.addObject("resaleList", list);
		  mav.setViewName("ad_resaleList");
		  return mav;
	  }
	  @RequestMapping(value = "/resaleList.res", method = RequestMethod.GET)
	  public ModelAndView resaleList(@ModelAttribute ResaleVO resaleVO, @RequestParam String id) {
		  List list = resaleService.myResaleList(id);
		  mav.addObject("myResaleList", list);
		  mav.setViewName("resaleList");
		  return mav;
	  }
	 

}
