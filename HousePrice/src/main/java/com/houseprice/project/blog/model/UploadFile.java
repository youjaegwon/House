package com.houseprice.project.blog.model;

public class UploadFile {
	
	private int id;
	private int bno;
	private String bfile_originalName;
	private String bfile_name; 
	private String bfile_path;
	private String bregdate;
	
	public int getId() {
		return id;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBfile_originalName() {
		return bfile_originalName;
	}

	public void setBfile_originalName(String bfile_originalName) {
		this.bfile_originalName = bfile_originalName;
	}

	public int getBno() {
		return bno;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBfile_name() {
		return bfile_name;
	}

	public void setBfile_name(String bfile_name) {
		this.bfile_name = bfile_name;
	}

	public String getBfile_path() {
		return bfile_path;
	}

	public void setBfile_path(String bfile_path) {
		this.bfile_path = bfile_path;
	}

	public String getBregdate() {
		return bregdate;
	}

	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}
	
	@Override
	public String toString() {
		return "UploadFile [id=" + id + ", bfile_name=" + bfile_name
				+ ", bfile_originalName=" + bfile_originalName + "]";
	}

	
}
