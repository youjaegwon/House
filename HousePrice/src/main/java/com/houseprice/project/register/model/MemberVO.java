package com.houseprice.project.register.model;

import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;


public class MemberVO {
	 //@Pattern(regexp = "/^[a-z0-9+]{5,15}$/", message = "5~15���� ���� �ҹ���, ���ڸ� ����")
	 @Pattern(regexp="^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$",message="4~11 문자나 숫자를 입력해주세요.")
	 private String mid;
	 
	 @Size(min=4,max=10,message="비밀번호는 4~10자리를 입력해주세요.")
	 private String mpw;
	 
     @Size(min=2,max=6,message="이름은 2자리에서 6자리를 입력해주세요")
	 private String mname;
	 
	 @Size(min=10,max=11,message="10~11자리를 입력해주세요.")
	 private String mphone;
	 
	 private Date mdate;
	 
	 @NotEmpty(message="한 목록에 체크해주세요.")
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
