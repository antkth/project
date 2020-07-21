package com.main.spring.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlsession;
	
	public List idCheck(String id) {
		
		return sqlsession.selectList("mapper.member.idcheck",id);
	}

	public void addMember(MemberVO memberVO) {
		sqlsession.insert("mapper.member.addMember",memberVO);
	}

	public MemberVO loginMember(String id) {
		return sqlsession.selectOne("mapper.member.loginMember",id);
	}
	public MemberVO memberinfo(String id) {
		return sqlsession.selectOne("mapper.member.memberinfo",id);
	}
	public void updateMem(MemberVO memberVO) {
		sqlsession.update("mapper.member.updateMem",memberVO);
	}
	public int findIdCheck(MemberVO memberVO) {
		return sqlsession.selectList("mapper.member.findIdCheck",memberVO).size();
	}
	public MemberVO findIdinfo(MemberVO memberVO) {
		return sqlsession.selectOne("mapper.member.findIdinfo", memberVO);
	}
	}
