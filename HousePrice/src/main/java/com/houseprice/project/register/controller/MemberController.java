package com.houseprice.project.register.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.houseprice.project.register.model.MemberVO;
import com.houseprice.project.register.service.MemberService;

@Controller
@RequestMapping("register")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	// 회원가입 이동
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String memberinsertGET() {

	    logger.info("memberinsert GET...");

	    return "/register/insert";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String writePOST(MemberVO memberVO, Model model){

	    logger.info("memberinsert POST...");
	    logger.info(memberVO.toString());
	    memberService.insert(memberVO);
	    model.addAttribute("message", "회원가입성공");

	    return "redirect:/register/list";
	}

	// 회원목록 이동
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model){

	    logger.info("list ...");
	    model.addAttribute("members", memberService.selectAll());

	    return "/register/list";
	}

	// 회원 삭제
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("mid") String mid, Model model){

	    logger.info("remove ...");
	    memberService.delete(mid);
	    model.addAttribute("msg", "회원 삭제");

	    return "redirect:/register/list";
	}

}
