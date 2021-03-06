package com.main.spring.inventory;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.spring.product.ProductVO;

@Repository
public class InventoryDAO {
	
	@Autowired
	SqlSession sqlSession;

	public int getAllProducts(HashMap map) {
		return sqlSession.selectOne("mapper.inventory.getAllProducts", map);
	}
	public List getInvList(HashMap map) {
		return sqlSession.selectList("mapper.inventory.getInvList", map);
	}
	public List getNoSearch(HashMap map) {
		return sqlSession.selectList("mapper.inventory.getNoSearch", map);
	}
	public void getUpdateInv(int num)  {	
		sqlSession.update("mapper.inventory.getUpdateInv", num);
	}
	public void getUpdateW_date(int num) {
		sqlSession.update("mapper.inventory.getUpdateW_date", num);
	}
	public void getSubInv(int num) {
		sqlSession.update("mapper.inventory.getSubInv", num);
	}
	public int getInventory(int num) {
		return sqlSession.selectOne("mapper.inventory.getInventory", num);
	}
	public void setZero(int num) {
		sqlSession.update("mapper.inventory.setZero", num);		
	}
	public void addCalendar(ProductVO productVO) {
		sqlSession.update("mapper.inventory.addCalendar", productVO);
	}
	public void addexp_date(HashMap map) {
		sqlSession.update("mapper.product.addexp_date",map);
	}
	public List getWearingList(int num) {
		return sqlSession.selectList("mapper.inventory.getWearingList", num);
	}
	public List getId(int num) {
		return sqlSession.selectList("mapper.wearingnotice.getId", num);
	}
	public String getName(int num) {
		return sqlSession.selectOne("mapper.wearingnotice.getName", num);
	}
	public String getEmail(String id) {
		return sqlSession.selectOne("mapper.wearingnotice.getEmail", id);
	}
	public void delWearing(int num) {
		sqlSession.delete("mapper.wearingnotice.delWearing", num);
	}
}
