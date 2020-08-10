package com.main.spring.wearingnotice;

import org.springframework.stereotype.Component;

@Component
public class WearingnoticeVO {
	private String id,email,name;
	private int wea_num,num;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getWea_num() {
		return wea_num;
	}
	public void setWea_num(int wea_num) {
		this.wea_num = wea_num;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}
