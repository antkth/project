package com.main.spring.resale;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.spring.purchase.PurchaseVO;

@Repository
public class ResaleDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	public void insertResale(ResaleVO resaleVO) {
		sqlSession.insert("mapper.resale.insertResale", resaleVO);
	}
	public List checkResale() {
		return sqlSession.selectList("mapper.resale.checkResale");
	}
	public int userPoint(String id) {
		return sqlSession.selectOne("mapper.member.userPoint", id);
	}
	public int getPrice(int num) {
		return sqlSession.selectOne("mapper.product.getPrice", num);
	}
	public void decrpoint(HashMap map) {
		sqlSession.update("mapper.member.decrpoint", map);
	}
	public void re_addCart(HashMap map) {
		sqlSession.insert("mapper.cart.re_addCart", map);
	}
	public int numcheck() {
		return sqlSession.selectOne("mapper.cart.numcheck");
	}
	public void re_intsertPurchase(HashMap map) {
		sqlSession.insert("mapper.purchase.re_intsertPurchase", map);
	}
	public void deletecart(HashMap map) {
		sqlSession.delete("mapper.cart.deletecart", map);
	}
	public void updateResale(HashMap map2) {
		sqlSession.update("mapper.resale.updateResale", map2);
	}
	public List resaleList() {
		return sqlSession.selectList("mapper.resale.resaleList");
	}
	public List myResaleList(String id) {
		return sqlSession.selectList("mapper.resale.myResaleList", id);
	}
	public void delResale(int re_num) {
		sqlSession.delete("mapper.resale.delResale", re_num);
	}
	public void inventoryChange(HashMap map) {
		sqlSession.update("mapper.product.inventoryChange",map);
	}
	
}
