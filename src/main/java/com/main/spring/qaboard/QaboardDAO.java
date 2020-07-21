package com.main.spring.qaboard;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QaboardDAO {
	@Autowired
	private SqlSession sqlSession;
	public void insertQaboard(QaboardVO qaboardVO) {
		sqlSession.insert("mapper.qaboard.insertQaboard",qaboardVO);
	}
	public int getqa_num(String id) {
		int qa_num = sqlSession.selectList("mapper.qaboard.getqa_num",id).size()+1;
		return qa_num;
	}
	public List qalist(String id) {
		return sqlSession.selectList("mapper.qaboard.qalist",id);
	}
	public List ad_qalist() {
		return sqlSession.selectList("mapper.qaboard.ad_qalist");
	}
	public QaboardVO qaread(HashMap map) {
		return sqlSession.selectOne("mapper.qaboard.qaread",map);
	}
	public void updatead_update(QaboardVO qaboardVO) {
		sqlSession.update("mapper.qaboard.updatead_update",qaboardVO);
	}
}
