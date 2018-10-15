package com.houseprice.project.login.model;

public class LoginDTO {

	private String mid;
	private String mpw;
	private boolean usercookie;
	
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
	public boolean isUsercookie() {
		return usercookie;
	}
	public void setUsercookie(boolean usercookie) {
		this.usercookie = usercookie;
	}
	
	
}
