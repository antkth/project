package com.main.spring.product;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class ProductVO {
	private String name,origin,manufacturer,category1,category2,category3,image;
	private int num,price,inventory,real_price,wishCheck;
	private Timestamp exp_date;

	public ProductVO() {}
	
	
	public ProductVO(String name, String origin, String manufacturer, String category1, String category3, String image,
			int price,Timestamp exp_date) {
		this.name = name;
		this.origin = origin;
		this.manufacturer = manufacturer;
		this.category1 = category1;
		this.category3 = category3;
		this.image = image;
		this.price = price;
		this.exp_date = exp_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public int getReal_price() {
		return real_price;
	}
	public void setReal_price(int real_price) {
		this.real_price = real_price;
	}
	public int getWishCheck() {
		return wishCheck;
	}
	public void setWishCheck(int wishCheck) {
		this.wishCheck = wishCheck;
	}
	public Timestamp getExp_date() {
		return exp_date;
	}
	public void setExp_date(Timestamp exp_date) {
		this.exp_date = exp_date;
	}
	
}