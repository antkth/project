package com.main.spring.qaboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class QaboardController {
	@Autowired
	private QaboardService qaboardService; 
	private ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "/qaboard/qalist.qab" , method = RequestMethod.GET)
	public ModelAndView qalist(HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		List list = qaboardService.qalist(id);
		mav.addObject("list",list);
		mav.setViewName("qaboard/qalist");
		return mav;
	}
	@RequestMapping(value = "/qaboard/qawrite.qab" , method = RequestMethod.GET)
	public ModelAndView qawite() {
		mav.setViewName("qaboard/qawrite");
		return mav;
	}
	@RequestMapping(value = "/qaboard/insertQaboard.qab" , method = RequestMethod.POST)
	public ModelAndView insertQaboard(@ModelAttribute QaboardVO qaboardVO,
									  HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		qaboardService.insertQaboard(qaboardVO, id);
		mav.setViewName("redirect:/qaboard/qalist.qab");
		return mav;
	}
	@RequestMapping(value = "/admin/ad_qalist.qab" , method = RequestMethod.GET)
	public ModelAndView ad_qalist(HttpServletRequest request) {
		List list = qaboardService.ad_qalist();
		mav.addObject("list",list);
		mav.setViewName("admin/ad_qalist");
		return mav;
	}
	@RequestMapping(value = "/qaboard/qaread.qab" , method = RequestMethod.GET)
	public ModelAndView qaread(@RequestParam int qa_num,HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		mav.addObject("info",qaboardService.qaread(id, qa_num));
		mav.setViewName("qaboard/qaread");
		return mav;
	}
	@RequestMapping(value = "/admin/ad_qaread.qab" , method = RequestMethod.GET)
	public ModelAndView ad_qaread(@RequestParam int qa_num,
								  @RequestParam String id,
								  HttpServletRequest request) {
		mav.addObject("info",qaboardService.qaread(id, qa_num));
		mav.setViewName("admin/ad_qaread");
		return mav;
	}
	@RequestMapping(value = "/admin/ad_update.qab" , method = RequestMethod.POST)
	public ModelAndView ad_update(@ModelAttribute QaboardVO qaboardVO,
								  HttpServletRequest request) {
		qaboardService.updatead_update(qaboardVO);
		mav.setViewName("redirect:/admin/ad_qalist.qab");
		return mav;
	}
}
