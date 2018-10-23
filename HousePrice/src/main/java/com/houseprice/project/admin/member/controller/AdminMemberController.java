package com.houseprice.project.admin.member.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.houseprice.project.admin.member.model.AdminMemberVO;
import com.houseprice.project.admin.member.service.AdminMemberService;
import com.houseprice.project.question.paging.PagingVo;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminmemberService;
	// 회원관리 페이지
	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String memberGET(PagingVo paging,Model model) throws Exception{
		
		List<AdminMemberVO> member = adminmemberService.memberSelectAll(paging);
		paging.setTotal(adminmemberService.countArticles(paging));
		model.addAttribute("member", member);
		model.addAttribute("p", paging);
		return "/admin/member/admin_member_list";
	}
	//
	@RequestMapping(value = "/expertUpdate", method = RequestMethod.POST)
	public String expertUpdate(@RequestParam String mid, Model model) throws Exception{
		adminmemberService.expertUpdate(mid);
		return "redirect:/admin/member/move";
	}
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public String userUpdate(@RequestParam String mid, Model model) throws Exception{
		adminmemberService.userUpdate(mid);
		return "/admin/member/move";
	}
	@RequestMapping(value ="/findBymid",method=RequestMethod.GET)
	public String searchId(@ModelAttribute("searchId") AdminMemberVO adminmemberVO,Model model,PagingVo paging ) throws Exception {
		
		List<AdminMemberVO> idlist= adminmemberService.findBymid(adminmemberVO);
		paging.setTotal(adminmemberService.countArticles2(paging));
		model.addAttribute("idlist", idlist);
		model.addAttribute("p", paging);
		if(adminmemberVO.getMid() != null && adminmemberVO.getMid().trim().length()>0)
			model.addAttribute("searchId", adminmemberVO.getMid());
		return "/admin/member/admin_member_list";
	}
}
