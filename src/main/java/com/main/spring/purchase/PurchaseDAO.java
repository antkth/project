package com.main.spring.purchase;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.spring.cart.CartVO;
@Repository
public class PurchaseDAO {
	@Autowired
	private SqlSession sqlSession;
	public int userPoint(String id) {
		return sqlSession.selectOne("mapper.member.userPoint", id);
	}
	public int soloTotalPrice(HashMap map) {
		return sqlSession.selectOne("mapper.cart.soloTotalPrice",map);
	}
	public String zeroCheck(String id) {
		return sqlSession.selectOne("mapper.member.zeroCheck",id);
	}
	public int getpur_num(String id) {
		return sqlSession.selectOne("mapper.purchase.getpur_num",id);
	}
	public void intsertPurchase(PurchaseVO purchaseVO) {
		sqlSession.insert("mapper.purchase.intsertPurchase",purchaseVO);
	}
	public HashMap cartinfo(HashMap map) {
		return sqlSession.selectOne("mapper.cart.cartinfo",map);
	}
	public void decrpoint(HashMap map) {
		sqlSession.update("mapper.member.decrpoint",map);
	}
	public void deletecart(HashMap map) {
		sqlSession.delete("mapper.cart.deletecart",map);
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
	public List getpur_list(String id) {
		return sqlSession.selectList("mapper.purchase.getpur_list",id);
	}
	public void deleteOrderList(int pur_num) {
		sqlSession.delete("mapper.purchase.deleteOrderList",pur_num);
	}
	public List ad_orderList(HashMap map) {
		return sqlSession.selectList("mapper.purchase.ad_orderList", map);
	}
	public void ad_orderStatus(int pur_num) {
		sqlSession.update("mapper.purchase.ad_orderStatus", pur_num);
	}
	public void inventoryChange(HashMap map) {
		sqlSession.update("mapper.product.inventoryChange",map);
	}
}
