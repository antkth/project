package com.main.spring.qaboard;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class QaboardVO {
	private int qa_num,cur_status;
	private String id,title,content,answer;
	private Timestamp qa_date;
	
	public int getQa_num() {
		return qa_num;
	}
	public void setQa_num(int qa_num) {
		this.qa_num = qa_num;
	}
	public int getCur_status() {
		return cur_status;
	}
	public void setCur_status(int cur_status) {
		this.cur_status = cur_status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Timestamp getQa_date() {
		return qa_date;
	}
	public void setQa_date(Timestamp qa_date) {
		this.qa_date = qa_date;
	}

}