package com.main.spring.inventory;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;


@Component
public class InventoryVO {	
	
	int num;
	Timestamp w_date;
	int totalnum;
	String category1;
	String name;
	int price;
	String manufacturer;
	Timestamp exp_date;
	int inventory;	

	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Timestamp getW_date() {
		return w_date;
	}
	public void setW_date(Timestamp w_date) {
		this.w_date = w_date;
	}
	public int getTotalnum() {
		return totalnum;
	}
	public void setTotalnum(int totalnum) {
		this.totalnum = totalnum;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public Timestamp getExp_date() {
		return exp_date;
	}
	public void setExp_date(Timestamp exp_date) {
		this.exp_date = exp_date;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	
	
	
	
	
	
	
	
}
