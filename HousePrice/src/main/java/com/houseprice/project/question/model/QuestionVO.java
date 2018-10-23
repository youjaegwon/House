package com.houseprice.project.question.model;

import java.util.Date;

public class QuestionVO {
	
	// 문의 번호
	private int cno;
	// 문의 제목
	private String ctitle;
	// 문의 내용
	private String ccontent;
	// 작성일
	private String cregdate;
	// 조회수
	private int chit;
	// 작성자
	private String mid;
	// 답변 여부
	private String answered;
	// 테이블 번호
	private int rnum;
	// 새글 여부
	private int qnew;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCregdate() {
		return cregdate;
	}
	public void setCregdate(String cregdate) {
		this.cregdate = cregdate;
	}
	public int getChit() {
		return chit;
	}
	public void setChit(int chit) {
		this.chit = chit;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getAnswered() {
		return answered;
	}
	public void setAnswered(String answered) {
		this.answered = answered;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getQnew() {
		return qnew;
	}
	public void setQnew(int qnew) {
		this.qnew = qnew;
	}
	
}
