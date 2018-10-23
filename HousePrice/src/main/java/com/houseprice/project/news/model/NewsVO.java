package com.houseprice.project.news.model;

public class NewsVO {
	
	//뉴스번호
	private int ano;
	//검색 결과 문서의 총 개수
	private String atitle;
	//검색 결과 문서의 제공 언론사 하이퍼텍스트 link를 나타낸다.
	private String aoriginallink;
	//검색 결과 문서가 네이버에 제공된 시간이다.
	private String apubDate;
	//게시여부
	private char ayn;
	
	private String description;
	
	public int getAno() {
		return ano;
	}
	
	
	
	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public String getAoriginallink() {
		return aoriginallink;
	}
	public void setAoriginallink(String aoriginallink) {
		this.aoriginallink = aoriginallink;
	}
	public String getApubDate() {
		return apubDate;
	}
	public void setApubDate(String apubDate) {
		this.apubDate = apubDate;
	}
	public char getAyn() {
		return ayn;
	}
	public void setAyn(char ayn) {
		this.ayn = ayn;
	}
	
}
