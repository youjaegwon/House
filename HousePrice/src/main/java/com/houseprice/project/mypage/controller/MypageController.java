package com.houseprice.project.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/mypage")
public class MypageController {

	// 마이 페이지 이동
	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String mypageGET() {
		return "/mypage/mypage_main";
	}
}
