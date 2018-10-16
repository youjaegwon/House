package com.houseprice.project.register.controller;

import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.houseprice.project.register.model.MemberVO;
import com.houseprice.project.register.service.MembershipService;

@Controller
@RequestMapping("/register")
public class MembershipController {
	
	@Autowired
	MembershipService service;
	
	// db insert 
	@RequestMapping(value="/membership", method=RequestMethod.POST)
	public String insert(@Valid MemberVO ms,BindingResult bindingResult,Model model) {
		
		if(bindingResult.hasErrors()) {
			return "/register/membership";
		}
		// 비밀번호 암호화
		String hashpw = BCrypt.hashpw(ms.getMpw(), BCrypt.gensalt());
		ms.setMpw(hashpw);
		
		String result=service.insert(ms);
		model.addAttribute("ms", result);
		
			return "/login/login";
		

	}
	
	// 회원가입
	@RequestMapping(value="/membership", method=RequestMethod.GET)
	public String membership(MemberVO membership,Model model) {
		
		return "/register/membership";
	}
	

	// 정보변경
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	@ModelAttribute("member")
	public MemberVO detail(@RequestParam String mid) { 
		
		MemberVO membership=service.findByid(mid);
		return membership;
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(MemberVO membership,Model model) {
		
		String result=service.update(membership);
		model.addAttribute("result", result);
		return "/register/result";
	}
	
}
