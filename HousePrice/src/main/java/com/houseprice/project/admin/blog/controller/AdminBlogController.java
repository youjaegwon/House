package com.houseprice.project.admin.blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.houseprice.project.blog.model.BlogVO;
import com.houseprice.project.blog.model.page.PageGroupResult;
import com.houseprice.project.blog.model.page.PageInfo;
import com.houseprice.project.blog.model.page.PageManager;
import com.houseprice.project.blog.service.BlogService;

@Controller
@RequestMapping("/admin/blog")
public class AdminBlogController {
	
	@Autowired
	private BlogService service;
	
	// 로그인 페이지
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String blogGET() {
		return "/admin/admin_main";
	}
	
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
		
		return "admin/blog/admin_blog_list";
	}
		
}
