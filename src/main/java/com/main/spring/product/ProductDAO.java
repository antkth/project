package com.main.spring.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	public int numcheck() {
		return sqlSession.selectList("mapper.product.numcheck").size();
	}
	public void proinsert(ProductVO productVO) {
		sqlSession.insert("mapper.product.proinsert", productVO);
	}
	public List getProductList6(int number, String category1, String category3) {
		Map maplist = new HashMap();
		maplist.put("number", number);
		maplist.put("category1", category1);
		maplist.put("category3", category3);
		return sqlSession.selectList("mapper.product.getProductList6", maplist);
	}
	public ProductVO getProductInfo(int num) {
		return sqlSession.selectOne("mapper.product.getProductInfo", num);
	}
	public List getKeyList(HashMap map) {
		return sqlSession.selectList("mapper.product.getKeyList", map);
	}
	public int getAllProduct(HashMap map) {
		
		return sqlSession.selectOne("mapper.product.getAllProduct", map);
		
	}
	
	public double getScoreAVG(int num) {
		return sqlSession.selectOne("mapper.review.scoreAVG", num);
	}
	public int getReviewTotal(int num) {
		return sqlSession.selectOne("mapper.review.numcheck", num);
	}
	
}
