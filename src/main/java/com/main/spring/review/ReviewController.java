package com.main.spring.review;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private ReviewService reviewService;
	

	@RequestMapping(value = "/reviewList.rev", method = RequestMethod.GET)
	public void rivewList(@RequestParam int num,
							HttpServletRequest request,
							HttpServletResponse response)throws Exception{
		  response.setContentType("text/html;charset=utf-8");

		  List rvList = reviewService.reviewList(num);
		  
		  JSONArray rvArray = new JSONArray();
		  for(int i=0; i<rvList.size(); i++) {
			  JSONObject review = new JSONObject();
			  ReviewVO reviewVO =(ReviewVO)rvList.get(i);
			  review.put("num", reviewVO.getNum());
			  review.put("r_num",reviewVO.getR_num()); 
			  review.put("content", reviewVO.getContent());
			  review.put("id", reviewVO.getId()); 
			  review.put("score", reviewVO.getScore()); 
			  review.put("date",new SimpleDateFormat("yyyy-MM-dd").format(reviewVO.getDate()));
			  rvArray.add(review);
			  
		}
			response.getWriter().print(rvArray);
	}
	
	@ResponseBody
	@RequestMapping(value = "/reviewAdd.rev", method = RequestMethod.POST)
	public void reviewAdd(ReviewVO reviewVO, HttpSession session) throws Exception{
		reviewService.insertReview(reviewVO);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/reviewDel.rev", method = RequestMethod.POST)
	public void reviewDel(@RequestParam int r_num,
						  HttpServletRequest request,
						  HttpServletResponse response)throws Exception {
		
		 reviewService.deleteReview(r_num);
	}
	
	
	
	
}
