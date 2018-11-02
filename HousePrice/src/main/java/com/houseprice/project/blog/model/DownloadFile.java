package com.houseprice.project.blog.model;

import java.io.File;

public class DownloadFile {
	private File file;
	private String originalFaileName;

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getOriginalFaileName() {
		return originalFaileName;
	}

	public void setOriginalFaileName(String originalFaileName) {
		this.originalFaileName = originalFaileName;
	}

	@Override
	public String toString() {
		return "DownloadFile [file=" + file + ", originalFaileName=" + originalFaileName + "]";
	}

}
