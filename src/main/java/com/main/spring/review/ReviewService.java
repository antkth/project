package com.main.spring.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	public void insertReview(ReviewVO reviewVO) {
		reviewVO.setR_num(reviewDAO.numcheck()+1);
		reviewDAO.insertReview(reviewVO);
	}

	public List<ReviewVO> getReviewList(int num) {
		return reviewDAO.getReviewList(num);
	} 
	
	/*
	 * public void updateReview(ReviewVO reviewVO) {
	 * reviewDAO.updateReview(reviewVO); }
	 * 
	 * public void deleteReview(int r_num) { reviewDAO.deleteReview(r_num); }
	 */

}
