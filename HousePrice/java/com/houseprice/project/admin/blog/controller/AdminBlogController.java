package com.houseprice.project.admin.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/blog")
public class AdminBlogController {
	// 로그인 페이지
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String blogGET() {
		return "/admin/admin_main";
	}
		
}
