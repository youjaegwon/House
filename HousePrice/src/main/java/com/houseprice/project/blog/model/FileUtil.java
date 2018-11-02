package com.houseprice.project.blog.model;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class FileUtil {
	
	//파일 저장 경로
	//public static final String UPLOAD_PATH = "C:\\sts-bundle\\workSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\house\\resources\\img\\"; // 이 폴더경로를 만들어야 한다 !!; // 이 폴더경로를 만들어야 한다 !!
	public static final String UPLOAD_PATH="C:\\fileServerTest\\upload\\";
	
	public static String makeSavedFileName(String originalfilename) {
		
		UUID uid = UUID.randomUUID();
		
		String savefilename = uid.toString()+originalfilename;
		return savefilename;
	}
	
	// 파일 서버 파일 저장하기
	public static boolean saveFile(String savefilename, byte[] fileData) {
		// 그냥 비어있는 파일
		// C:\\fileServerTest\\upload\\(savefilename)
		File target = new File(UPLOAD_PATH, savefilename);
		
		try {
			// 비어있는 파일을 채워 만들어줌(실제데이터)
			// C:\\fileServerTest\\upload\\(savefilename) <-- 데이터 들어가는중
			FileCopyUtils.copy(fileData, target);
		
		} catch (IOException e) {
			
			System.out.println("파일저장 실패입니당!");
			
			return false;
			
		}
		
		return true;
	}
	
	//파일 서버에서 저장된 파일 가져오기
	public static File getSaveFile(String savefilename) {
		
		File downloadfile = new File(UPLOAD_PATH, savefilename);
		
		return downloadfile;
	}
	
	//파일 서버에서 저장된 파일 가져오기
		public static File getFileFromServer(String fileName) {
			File downLoadFile = new File(UPLOAD_PATH, fileName);
			return downLoadFile;		
		}

		public static String getFileDownloadURL(int id) {
			return "/blog/filedownload?id="+id;
		}
	
}
