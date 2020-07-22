package com.main.spring.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ReviewController {
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@ResponseBody
	@RequestMapping(value = "/reviewList.rev", method = RequestMethod.GET)
	public ModelAndView getRivewList(@RequestParam int num, 
									HttpServletRequest request,
									HttpServletResponse response) throws Exception{
		
		List<ReviewVO> rvList = reviewService.getReviewList(num);
		mav.addObject("rvList", rvList);
		mav.setViewName("productInfo.pro");
		System.out.println(rvList.size());
		return mav;
	}
	
	@RequestMapping("/listJson.rev")
	@ResponseBody
	public List<ReviewVO> listJson(@RequestParam int num){
		List<ReviewVO> rvList = reviewService.getReviewList(num);
		return rvList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/reviewAdd.rev", method = RequestMethod.POST)
	public void reviewAdd(ReviewVO reviewVO, HttpSession session) throws Exception{
		
		reviewService.insertReview(reviewVO);
		
	}
	
	
	
}
