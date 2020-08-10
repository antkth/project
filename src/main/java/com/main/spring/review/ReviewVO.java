package com.main.spring.review;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class ReviewVO {
	private String content,id;
	private int num, score, r_num;
	private Timestamp date;
	private double socreAVG;
	
	public double getSocreAVG() {
		return socreAVG;
	}

	public void setSocreAVG(double socreAVG) {
		this.socreAVG = socreAVG;
	}

	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
}
