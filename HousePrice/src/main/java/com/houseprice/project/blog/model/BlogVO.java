package com.houseprice.project.blog.model;

public class BlogVO {
	
	//게시여부
	private String y_n; 
	// 블로그 번호
	private int bno;
	// 블로그 제목
	private String btitle="";
	// 블로그 내용
	private String bcontent="";
	// 블로그 작성일
	private String bregdate;
	// 블로그 작성자
	private String mid="";
	// 첫번째 사진 경로
	private int fid;
	// 조회수
	private int hit;
	// paging start low
	private int startLow;
	// paging end low
	private int endLow;
	
	
	public int getStartLow() {
		return startLow;
	}
	public void setStartLow(int startLow) {
		this.startLow = startLow;
	}
	public int getEndLow() {
		return endLow;
	}
	public void setEndLow(int endLow) {
		this.endLow = endLow;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBregdate() {
		return bregdate;
	}
	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getY_n() {
		return y_n;
	}
	public void setY_n(String y_n) {
		
		this.y_n = y_n;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
