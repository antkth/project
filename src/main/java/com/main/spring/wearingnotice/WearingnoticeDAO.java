package com.main.spring.wearingnotice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.spring.product.ProductVO;

@Repository
public class WearingnoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	public void insertwearing(WearingnoticeVO wearingnoticeVO) {
		sqlSession.insert("mapper.wearingnotice.insertwearing",wearingnoticeVO);
	}
}
