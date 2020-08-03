package com.main.spring.member;

import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

class MyAuthentication extends Authenticator { //아이디 패스워드 인증받기 함수
	  PasswordAuthentication pa;
	  public MyAuthentication(){
	    pa=new PasswordAuthentication("gimt94566@gmail.com","66549tmig!");        
	  }
	  @Override
	  protected PasswordAuthentication getPasswordAuthentication() {
	    return pa;
	  }
	}
@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	public int idCheck(String id) {		
		return memberDAO.idCheck(id).size();
	}
	public void addMember(MemberVO memberVO) {
		memberDAO.addMember(memberVO);
	}
	public String loginMember(MemberVO memberVO) {
		String msg="";
		List list = memberDAO.idCheck(memberVO.getId());
		if(list.size()==0) {
			msg="아이디를확인해주세요.";
		}else {
			MemberVO VO = memberDAO.loginMember(memberVO.getId());
			if(memberVO.getPwd().equals(VO.getPwd())) {
				msg="login";
			}else {
				msg="비밀번호를확인해주세요.";
			}
		}
		return msg;
	}
	public MemberVO memMod(String id) {
		return memberDAO.memberinfo(id);
	}
	public void updateMem(MemberVO memberVO) {
		memberDAO.updateMem(memberVO);
	}
	public MemberVO findId(MemberVO memberVO) {
		if(memberDAO.findIdCheck(memberVO)>0) {
			memberVO = memberDAO.findIdinfo(memberVO);
		}else {
			memberVO.setId("admin");
		}
		return memberVO;
	}
	public void SendEmail(MemberVO memberVO){
		try {
			  Properties props = new Properties();
			props.put("mail.smtp.user", "gimt94566@gmail.com");
			props.put("mail.smtp.host", "smtp.googlemail.com");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			  Authenticator myauth=new MyAuthentication(); 
			  Session sess=Session.getInstance(props, myauth);
			  InternetAddress addr = new InternetAddress();
			  addr.setPersonal("gimt94566","UTF-8");
			  addr.setAddress("gimt94566@gmail.com");
			  Message msg = new MimeMessage(sess);
			  msg.setFrom(addr);         
			  msg.setSubject(MimeUtility.encodeText("귀하의 아이디 비밀번호입니다", "utf-8","B"));
			  String content = "귀하의 아이디는 <br>"+memberVO.getId()+"<br>이며 귀하의 비밀번호는 <br>"+memberVO.getPwd()+"<br>입니다.";
			  msg.setContent(content, "text/html;charset=utf-8");
			  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(memberVO.getEmail()));
			  Transport.send(msg);
		}catch (Exception e) {
			e.printStackTrace();
		}
}
	public void addpoint(HashMap map) {
		memberDAO.addpoint(map);
	}
	public void updateaddr(MemberVO memberVO) {
		memberDAO.updateaddr(memberVO);
	}
	public int totalCheck(String id) {
		return memberDAO.totalCheck(id);
	}
	
}
