package com.houseprice.project.admin.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/admin/main")
public class AdminMainController {

	// 관리자 메인 페이지
	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String blogGET() {
		return "/admin/admin_main";
	}
}
