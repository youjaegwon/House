package com.houseprice.project.blog.model;

import org.springframework.web.multipart.MultipartFile;

public class FileForm {
	
	private String writer;	//이름
	private String title;	//제목
	private MultipartFile upfile;	//파일
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public MultipartFile getUpfile() {
		return upfile;
	}
	public void setUpfile(MultipartFile upfile) {
		this.upfile = upfile;
	}
	@Override
	public String toString() {
		return "FileForm [writer=" + writer + ", title=" + title + ", upfile=" + upfile + "]";
	}
	
}
