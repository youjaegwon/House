package com.houseprice.project.register.model;

import java.util.Date;

public class MemberVO {
	
	 private String mid;
	
	
	 private String mpw;
	 
    
	 private String mname;
	 
	 private String mphone;
	 
	 private Date mdate;
	 
	 private String mproyn;
	
	 private int ano;
	 
	 
	
	 public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getMproyn() {
		return mproyn;
	}
	public void setMproyn(String mproyn) {
		this.mproyn = mproyn;
	}
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
	
}
