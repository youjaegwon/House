package com.houseprice.project.blog.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.houseprice.project.blog.model.BlogVO;
import com.houseprice.project.blog.model.DownloadFile;
import com.houseprice.project.blog.model.FileForm;
import com.houseprice.project.blog.model.FileUtil;
import com.houseprice.project.blog.model.UploadFile;
import com.houseprice.project.blog.repository.BlogRepository;

@Service
public class BlogService {

	@Autowired
	private BlogRepository repository;
	
public String fileSave(MultipartFile file, int bno) {
		
		System.out.println("==================== Service fileSave ====================");
		System.out.println(file.getOriginalFilename()); // 파일이름
		
		String saveFilename = FileUtil.makeSavedFileName(file.getOriginalFilename());
		System.out.println(saveFilename);
		
		boolean uploadResult = false;
		UploadFile uploadFile = new UploadFile();
		try {
			//파일 저장
			uploadResult = FileUtil.saveFile(saveFilename, file.getBytes());
			//C:\\fileServerTest\\upload\\(savefilename)
			uploadFile.setBfile_path(FileUtil.UPLOAD_PATH+saveFilename);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		FileForm fileForm=null;
		
		if(uploadResult) {
			
			uploadFile.setBno(bno);
			uploadFile.setBfile_originalName(file.getOriginalFilename());
			uploadFile.setBfile_name(saveFilename);
			
			bno = repository.save(uploadFile);
		}
		
		if(bno==0)
			return null;
		
		return FileUtil.getFileDownloadURL(bno);
		
}

public DownloadFile getDownloadFile(int id) {
	//DB에 저장된 파일정보 로드
			
	UploadFile fileInfo= null;
	
	DownloadFile downloadFile = null;
	
			try {
				fileInfo = repository.findById(id);
				System.out.println("저장되어있는 파일참조 가져오기");
				System.out.println(fileInfo.toString());	
				
				//저장되어 있는 파일 참조 가져오기
				File responseFile = FileUtil.getFileFromServer(fileInfo.getBfile_name());
				
//				System.out.println("responseFile:"+responseFile.getAbsolutePath());
				downloadFile = new DownloadFile();
				downloadFile.setFile(responseFile);
				downloadFile.setOriginalFaileName(fileInfo.getBfile_originalName());
			} catch (Exception e) {
				System.out.println("test");
				return null;
			}			
			
			
			return downloadFile;
}

public int insert(BlogVO blogVO) {
	int bno=repository.insert(blogVO);
	
	String result="작성 실패";
	if(bno>0) {
		
		System.out.println(bno);
		
		result="작성 성공";
	}
	
	System.out.println(result);
	
	return bno;
}

public BlogVO select(int bno) {
	
	BlogVO blogVO = repository.select(bno);
	
	return blogVO;
}

public List<BlogVO> selectList(BlogVO blogVO) {
	return repository.selectList(blogVO);
}

public List<BlogVO> selectListSave(BlogVO blogVO) {
	return repository.selectListSave(blogVO);
}

public String delete(int bno) {
	
	int remove=repository.delete(bno);
	
	String result="삭제 실패";
	if(remove>0) {
		result="삭제 성공";
	}
	return result;
}

public int update(BlogVO blogVO) {
	int blog_no = repository.update(blogVO);
	
	String result="수정 실패";
	if(blog_no>0) {
		result="수정 성공";
	}
	
	System.out.println(result);
	return blog_no;
}

public int update2(BlogVO blogVO) {
	
int blog_no = repository.update2(blogVO);
	
	String result="수정 실패";
	if(blog_no>0) {
		result="수정 성공";
	}
	
	System.out.println(result);
	return blog_no;
	
}

public int hitUpdate(int bno) {
	
	return repository.hitUpdate(bno);
}

public void update3(List<Integer> checkArr) {
	
	int i = 0;
	int [] no = new int[checkArr.size()];
	for(Integer bno : checkArr) {
		
		no [i] = repository.update3(bno);
		i++;
	}
	
	for(i = 0; i < checkArr.size(); i++) {
	String result = new String();
	 result="수정 실패";
	if(no[i]>0) {
		result="수정 성공";
		}
	System.out.println(result);
	}
	
}

public void updateN_Y(List<Integer> checkArr) {
	int i = 0;
	int [] no = new int[checkArr.size()];
	for(Integer bno : checkArr) {
		
		no [i] = repository.updateN_Y(bno);
		i++;
	}
	
	for(i = 0; i < checkArr.size(); i++) {
	String result = new String();
	 result="수정 실패";
	if(no[i]>0) {
		result="수정 성공";
		}
	System.out.println(result);
	}
	
}

public void selectDelete(List<Integer> checkArr) {
		int i = 0;
		int [] no = new int[checkArr.size()];
		for(Integer bno : checkArr) {
			
			no [i] = repository.selectDelete(bno);
			i++;
		}
		
		for(i = 0; i < checkArr.size(); i++) {
		String result = new String();
		 result="수정 실패";
		if(no[i]>0) {
			result="수정 성공";
			}
		System.out.println(result);
		}
}

public int pageGetCount() {
	
	return repository.pageGetCount();
}

public int pageGetMain() {
	
	return repository.pageGetMain();
}

public List<BlogVO> mainSelect() {
	
	return repository.mainSelect();
}


}
