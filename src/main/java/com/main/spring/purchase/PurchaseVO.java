package com.main.spring.purchase;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class PurchaseVO {
	private int num,pur_num,qty,price,pur_status;
	private String id;
	private Timestamp put_date;
	
	public PurchaseVO() {}
	


	public PurchaseVO(int num, int qty, int price, String id) {
		this.num = num;
		this.qty = qty;
		this.price = price;
		this.id = id;
	}



	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPur_num() {
		return pur_num;
	}
	public void setPur_num(int pur_num) {
		this.pur_num = pur_num;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPur_status() {
		return pur_status;
	}
	public void setPur_status(int pur_status) {
		this.pur_status = pur_status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getPut_date() {
		return put_date;
	}
	public void setPut_date(Timestamp put_date) {
		this.put_date = put_date;
	}
	
}
