package com.houseprice.project.register.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
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
	public String insert( MemberVO ms/*,BindingResult bindingResult*/,Model model) {
		
//		if(bindingResult.hasErrors()) {
//			
//			return "/register/membership";
//		}
		// 비밀번호 암호화
		String hashpw = BCrypt.hashpw(ms.getMpw(), BCrypt.gensalt());
		ms.setMpw(hashpw);
		
		String result=service.insert(ms);
		model.addAttribute("ms", result);
		System.out.println("가입성공");
			return "/login/login";
		

	}
	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
    public Map<Object, Object> idcheck(@RequestBody String mid) {
        
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = service.idcheck(mid);
        map.put("cnt", count);
        
        return map;
    }
	//비밀번호 재확인
//	@RequestMapping(value="/checkPw",method=RequestMethod.GET)
//	public String pwcheck(@RequestParam String mpw,Model model) {
//		MemberVO membership=service.findByid(mid);
//		
//		
//		model.addAttribute("check", membership);
//		
//		MemberVO memberVO = loginService.login(loginDTO);
//		
//		if (memberVO == null || !BCrypt.checkpw(loginDTO.getMpw(), memberVO.getMpw())) {
//			return;
//		}
//		return "/register/checkPw";
//		
//	}
	// 회원가입
	@RequestMapping(value="/membership", method=RequestMethod.GET)
	public String membership(MemberVO membership,Model model) {
		
		return "/register/membership";
	}
	
	// 마이페이지 이동
		@RequestMapping(value="/detail", method=RequestMethod.GET)
		public String detail() { 
			return "/register/checkPw";
		}
	// 마이페이지 패스워드 체크
	@RequestMapping(value="/detail", method=RequestMethod.POST)
	public String detail(@RequestParam String mid,@RequestParam String mpw,Model model) { 
		MemberVO membership=service.findByid(mid);
		model.addAttribute("member", membership);
		if(!BCrypt.checkpw(mpw, membership.getMpw())) {
			return "/register/findpwError";
		}
//		membership.setMpw(null);
		return "/register/memberdetail";
	}
	//정보변경
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(MemberVO membership,Model model, HttpServletRequest request) {
		// 비밀번호 암호화
		String hashpw = BCrypt.hashpw(membership.getMpw(), BCrypt.gensalt());
		membership.setMpw(hashpw);
		String result=service.update(membership);
		model.addAttribute("result", result);
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();
		return "/register/result";
	}
	
}
