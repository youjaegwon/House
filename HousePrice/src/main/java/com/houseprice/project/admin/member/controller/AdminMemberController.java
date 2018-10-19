package com.houseprice.project.admin.member.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.houseprice.project.admin.member.model.AdminMemberVO;
import com.houseprice.project.admin.member.service.AdminMemberService;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminmemberService;
	// 로그인 페이지
	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String memberGET(Model model) throws Exception{
		List<AdminMemberVO> member = adminmemberService.memberSelectAll();
		model.addAttribute("member", member);
		return "/admin/member/admin_member_list";
	}
	//
	@RequestMapping(value = "/exportUpdate", method = RequestMethod.POST)
	public String exportUpdate(@RequestParam String mid, Model model) throws Exception{
		adminmemberService.expertUpdate(mid);
		return "redirect:/admin/member/move";
	}
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public String userUpdate(@RequestParam String mid, Model model) throws Exception{
		adminmemberService.userUpdate(mid);
		return "/admin/member/move";
	}
}
