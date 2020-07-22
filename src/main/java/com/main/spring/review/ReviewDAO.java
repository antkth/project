package com.main.spring.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int numcheck() {
		return sqlSession.selectList("mapper.review.numcheck").size();
	}
	
	public void insertReview(ReviewVO reviewVO) {
		sqlSession.insert("mapper.review.insertReview", reviewVO);
	}

	
	public List getReviewList(int num) {
		
		return sqlSession.selectList("mapper.review.reviewList", num);
		
	}


}
