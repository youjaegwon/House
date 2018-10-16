package com.houseprice.project.register.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		String result=service.insert(ms);
		model.addAttribute("ms", result);
		
			return "/login/login";
		

	}
	
	// 회원가입
	@RequestMapping(value="/membership", method=RequestMethod.GET)
	public String membership(MemberVO membership,Model model) {
		
		return "/register/membership";
	}
	
	@RequestMapping("/membership")
	@ResponseBody
	public Map<Object,Object> idcheck(@RequestBody String mid){
		
		int count=0;
		 Map<Object, Object> map = new HashMap<Object, Object>();
		 
	        count = service.idcheck(mid);
	        map.put("cnt", count);
	 
	        return map;
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
