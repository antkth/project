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
}
