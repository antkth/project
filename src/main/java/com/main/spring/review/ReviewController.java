package com.main.spring.review;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	private ReviewVO reviewVO;
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/reviewList.rev", method = RequestMethod.GET) public
	 * ModelAndView getRivewList(@RequestParam int num, HttpServletRequest request,
	 * HttpServletResponse response) throws Exception{
	 * 
	 * List<ReviewVO> rvList = reviewService.getReviewList(num);
	 * mav.addObject("rvList", rvList); mav.setViewName("productInfo.pro");
	 * System.out.println(rvList.size()); return mav; }
	 */
	
	@ResponseBody
	@RequestMapping(value = "/reviewList.rev", method = RequestMethod.GET)
	public void rivewList(@RequestParam int num,
							HttpServletRequest request,
							HttpServletResponse response){
		List<ReviewVO> rvList = reviewService.getReviewList(num);
		
		JSONArray rvArray = new JSONArray();
		for(int i=0; i<rvList.size(); i++) {
			JSONObject review = new JSONObject();
			reviewVO =(ReviewVO)rvList.get(i);
			review.put("num", reviewVO.getNum());
			review.put("r_num", reviewVO.getR_num());
			review.put("content", reviewVO.getContent());
			review.put("id", reviewVO.getId());
			review.put("date", reviewVO.getDate());
			rvArray.add(review);
		}
		try {
			response.getWriter().print(rvArray);
		} catch (IOException e) {
			System.out.println("Err : " + e.getMessage());
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/reviewAdd.rev", method = RequestMethod.POST)
	public void reviewAdd(ReviewVO reviewVO, HttpSession session) throws Exception{
		
		reviewService.insertReview(reviewVO);
		
	}
	
	
	
}
