package com.main.spring.inventory;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
