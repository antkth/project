package com.main.spring.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	public void insertReview(ReviewVO reviewVO) {
		reviewDAO.insertReview(reviewVO);
	}

	public List<ReviewVO> reviewList(int num) {
		return reviewDAO.rivewList(num);
	}
 
	public void deleteReview(int r_num) {
		 reviewDAO.deleteReview(r_num);
	} 

}
