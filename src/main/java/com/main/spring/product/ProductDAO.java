package com.main.spring.product;

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
		System.out.println(productVO.getImage());
		sqlSession.insert("mapper.product.proinsert", productVO);
	}
}
