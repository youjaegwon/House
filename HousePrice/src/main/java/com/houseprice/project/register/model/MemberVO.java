package com.houseprice.project.register.model;

import java.util.Date;

public class MemberVO {
	
	// 사용자 아이디
	private String mid;
	// 사용자 비밀번호
	private String mpw;
	// 사용자 이름
	private String mname;
	// 사용자 휴대폰
	private String mphone;
	// 사용자 가입일
	private Date mdate;
	// 사용자 권한
	private char mauth;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public char getMauth() {
		return mauth;
	}
	public void setMauth(char mauth) {
		this.mauth = mauth;
	}
}
