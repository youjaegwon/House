package com.houseprice.project.blog.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.houseprice.project.blog.model.BlogVO;
import com.houseprice.project.blog.model.DownloadFile;
import com.houseprice.project.blog.model.page.PageGroupResult;
import com.houseprice.project.blog.model.page.PageInfo;
import com.houseprice.project.blog.model.page.PageManager;
import com.houseprice.project.blog.service.BlogService;



@Controller
@RequestMapping("/blog")
public class BlogController {
	
	@Autowired
	private BlogService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model, String message, HttpServletRequest request) {
		
		System.out.println(request.getParameter("reqPage"));
		
		int requestPage=1;
		if(request.getParameter("reqPage") != null) { requestPage= Integer.parseInt(request.getParameter("reqPage")); }
		
		BlogVO blogVO = new BlogVO();
		
		int count = service.pageGetMain();
		
		PageManager pageManager = new PageManager(requestPage);
		PageGroupResult pageGroupResult = pageManager.getPageGroupResult(count);
		int endLow = PageInfo.ROW_COUNT_PER_PAGE * requestPage;
		int startLow = endLow -(PageInfo.ROW_COUNT_PER_PAGE - 1);
		
		blogVO.setStartLow(startLow);
		blogVO.setEndLow(endLow);
		
		List<BlogVO> list=service.selectList(blogVO);
		
		model.addAttribute("list", list);
		model.addAttribute("message", message);
		
		model.addAttribute("pageGroupResult", pageGroupResult);
		
		return "blog/main";
	}
	
	//저장된 글
	@RequestMapping(value = "/selectSave", method = RequestMethod.GET)
	public String selectSave(Model model, String message, HttpServletRequest request) {
		
		int requestPage=1;
		if(request.getParameter("reqPage") != null) { requestPage= Integer.parseInt(request.getParameter("reqPage")); }
		
		BlogVO blogVO = new BlogVO();
		
		int count = service.pageGetCount();
		System.out.println(count+count+count+count+count+count+count+count+count+count+count+count);
		
		PageManager pageManager = new PageManager(requestPage);
		PageGroupResult pageGroupResult = pageManager.getPageGroupResult(count);
		int endLow = PageInfo.ROW_COUNT_PER_PAGE * requestPage;
		int startLow = endLow -(PageInfo.ROW_COUNT_PER_PAGE - 1);
		
		blogVO.setStartLow(startLow);
		blogVO.setEndLow(endLow);
		
		List<BlogVO> list=service.selectListSave(blogVO);
		
		model.addAttribute("list", list);
		model.addAttribute("message", message);
		
		model.addAttribute("pageGroupResult", pageGroupResult);
		
		return "blog/manageList";
	}
	
	// 글작성 페이지
	@RequestMapping(value = "/blogInsert", method = RequestMethod.POST)
	public String InsertGO(BlogVO blogVO ,Model model) {
		
		int bno = service.insert(blogVO);	
		
		model.addAttribute("bno", bno);
		
		return "blog/blogInsert";
	}
	
	//블로그 목록 -> 디테일 
	@RequestMapping(value = "/updateGO", method = RequestMethod.POST)
	public String updateGO(@RequestParam(value = "bno") int bno, Model model) {
		
		BlogVO blogVO = service.select(bno);
		
		model.addAttribute("data", blogVO);
		
		return "blog/blogModify";
	}
	
	@RequestMapping(value = "/updateSaveGO", method = RequestMethod.POST)
	public String updateSaveGO(@RequestParam(value = "bno") int bno, Model model) {
		
		BlogVO blogVO = service.select(bno);
		
		model.addAttribute("data", blogVO);
		
		return "blog/blogUpdate";
	}
	
	//글작성 페이지
	@RequestMapping(value = "/blogUpdate", method = RequestMethod.POST)
	public String insert(Model model, BlogVO blogVO) {
		
		int bno = service.update(blogVO);
		
		model.addAttribute("bno", bno);
		
		return "redirect:/blog/blogDetail";
		
	}
	
	//글게시 페이지
	@ResponseBody
	@RequestMapping(value = "/updateY_N", method = RequestMethod.POST)
	public String updateY_N(@RequestParam(value = "checkArrRoom[]", required=true) List<Integer> checkArr, Model model) {
		
		service.update3(checkArr);
		
		return null;
	}
	//글게시 페이지
	@ResponseBody
	@RequestMapping(value = "/updateN_Y", method = RequestMethod.POST)
	public String updateN_Y(@RequestParam(value = "checkArrRoom[]", required=true) List<Integer> checkArr, Model model) {
		
		service.updateN_Y(checkArr);
		
		return null;
	}
	
	//관리자 리스에서 삭제
	@ResponseBody
	@RequestMapping(value = "/selectDelete", method = RequestMethod.POST)
	public String selectDelete(@RequestParam(value = "checkArrRoom[]", required=true) List<Integer> checkArr, Model model) {
		
		service.selectDelete(checkArr);
		
		return null;
			
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@RequestParam("btitle") String btitle, @RequestParam("bno") int bno, Model model, @RequestParam("bcontent") String bcontent,BlogVO blogVO) {
		
		blogVO.setBno(bno);
		blogVO.setBcontent(btitle);
		blogVO.setBcontent(bcontent);
		
		System.out.println(blogVO.getBno());
		bno = service.update2(blogVO);
		
		model.addAttribute("bno", bno);
		
		return "redirect:/blog/blogDetail";
	}
	
	//삭제
	@RequestMapping(value = "/blogDelete", method = RequestMethod.POST)
	public String delete(Model model, @RequestParam(value="bno") int bno) {
		
		String result=service.delete(bno);
		model.addAttribute("message",result);
		
		return "redirect:/";
		
	}
	
	
	//상세
			@RequestMapping(value = "/blogDetail", method = RequestMethod.GET)
			public String blogDetail(@RequestParam(value = "bno") int bno, Model model) {
				
				System.out.println(bno);
				
				model.addAttribute("bno", bno);
				
				return "blog/detail";
		}
			//조회수 증가
			@ResponseBody //ajax 요청할때 success에 리턴시키려면 필요ㄴ
			@RequestMapping(value = "/hitUpdate", method = RequestMethod.POST)
			public BlogVO hitUpdate(@RequestParam(value = "bno") int bno, Model model) {
				
				service.hitUpdate(bno);
				BlogVO blogVO = service.select(bno);
				System.out.println("after");
				
				return blogVO;
			}
			
			//상세
			@RequestMapping(value = "/blogDetailSave", method = RequestMethod.GET)
			public String blogDetailSave(@RequestParam(value = "bno") int bno, Model model) {
				
				BlogVO blogVO = service.select(bno);
				model.addAttribute("data", blogVO);
				
				return "blog/detailSave";
			}
			
		
	@ResponseBody
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public Map<String,String> uploadImage(@RequestParam("file") MultipartFile file,@RequestParam("bno") int bno, Model model, 
			HttpServletRequest request, HttpServletResponse response){
		
		String URL = service.fileSave(file, bno);
		
		Map<String,String> result = new HashMap<String, String>();
		if(URL == null) {
			result.put("success", "false");
		}else {
			result.put("success", "true");
			result.put("data", URL);			
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/filedownload", method=RequestMethod.GET,produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public FileSystemResource filedownload(@RequestParam int id, HttpServletRequest request, HttpServletResponse response) {
		DownloadFile downloadFile = service.getDownloadFile(id);
		String browser = request.getHeader("User-Agent");
		String downloadFileName = null;
		if(browser.contains("Chrome")||
			browser.contains("MSIE")||
			browser.contains("Trident")) {
			try {				
				downloadFileName = URLEncoder.encode(downloadFile.getOriginalFaileName(),"UTF-8").replaceAll("\\+", "%20");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			response.setHeader("Content-Disposition", "attachment;filename="+downloadFileName+";");
		}else {
			try {				
				downloadFileName = 
						new String(downloadFile.getOriginalFaileName().getBytes("UTF-8"),"ISO-8859-1").replaceAll("\\+", "_");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			response.setHeader("Content-Disposition", "attachment;filename="+downloadFileName+";");
		}
		return new FileSystemResource(downloadFile.getFile());
	}
		
}
