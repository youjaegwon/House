package com.houseprice.project.admin.member.model;

import java.util.Date;
import java.util.List;

import com.houseprice.project.register.model.MemberVO;

public class AdminMemberVO {

	private String mid;
	private Date mdate;
	private String mproyn;
	private int ano;
	private String aname;
	private char amark;
	
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public char getAmark() {
		return amark;
	}
	public void setAmark(char amark) {
		this.amark = amark;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public String getMproyn() {
		return mproyn;
	}
	public void setMproyn(String mproyn) {
		this.mproyn = mproyn;
	}
	@Override
	public String toString() {
		return "AdminMemberVO [mid=" + mid + ", mdate=" + mdate + ", mproyn=" + mproyn + ", ano=" + ano + ", aname="
				+ aname + ", amark=" + amark + "]";
	}
	
}
