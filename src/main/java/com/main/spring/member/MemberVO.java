package com.main.spring.member;

import org.springframework.stereotype.Component;

@Component
public class MemberVO {
	private String id,pwd,name,email,phone,addr1,addr2,addr3,addr4,d_addr1,d_addr2,d_addr3,d_addr4;
	private int point,u_point;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getAddr4() {
		return addr4;
	}
	public void setAddr4(String addr4) {
		this.addr4 = addr4;
	}
	public String getD_addr1() {
		return d_addr1;
	}
	public void setD_addr1(String d_addr1) {
		this.d_addr1 = d_addr1;
	}
	public String getD_addr2() {
		return d_addr2;
	}
	public void setD_addr2(String d_addr2) {
		this.d_addr2 = d_addr2;
	}
	public String getD_addr3() {
		return d_addr3;
	}
	public void setD_addr3(String d_addr3) {
		this.d_addr3 = d_addr3;
	}
	public String getD_addr4() {
		return d_addr4;
	}
	public void setD_addr4(String d_addr4) {
		this.d_addr4 = d_addr4;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int u_point) {
		this.u_point = u_point;
	}

}