package com.houseprice.project.blog.model;

import java.util.Date;

public class BlogVO {
	
	// 블로그 번호
	private int bno;
	// 블로그 제목
	private String btitle;
	// 블로그 내용
	private String bcontent;
	// 블로그 작성일
	private Date bregdate;
	// 블로그 작성자
	private String mid;
	// 다중 파일 이름 저장
	private String[] files;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Date getBregdate() {
		return bregdate;
	}
	public void setBregdate(Date bregdate) {
		this.bregdate = bregdate;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	
}
