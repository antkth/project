package com.main.spring.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;

	
	public int numcheck() {
		return sqlSession.selectList("mapper.cart.numcheck").size();
	}
	
	public void addCart(CartVO cartVO) {
		sqlSession.insert("mapper.cart.addCart", cartVO);
	}

	public List getCartList(String id) {

		return sqlSession.selectList("mapper.cart.cartList", id);
		 
	}
	
	public int getTotalPrice(String id) {
		return sqlSession.selectOne("mapper.cart.getTotalPrice",id);
	}

	public int totalCheck(String id) {
		return sqlSession.selectOne("mapper.cart.totalCheck",id);
	}
	public void deletecart(HashMap map) {
		sqlSession.delete("mapper.cart.deletecart",map);
	}
}
