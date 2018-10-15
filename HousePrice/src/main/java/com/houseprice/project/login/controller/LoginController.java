package com.houseprice.project.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.houseprice.project.login.model.LoginDTO;
import com.houseprice.project.login.service.LoginService;
import com.houseprice.project.register.model.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private LoginService loginService;

	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		return "/login/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO loginDTO, Model model) throws Exception {

		MemberVO memberVO = loginService.login(loginDTO);
		
		if (memberVO == null /*|| !BCrypt.checkpw(loginDTO.getUserPw(), userVO.getUserPw())*/) {
			return;
		}
		model.addAttribute("member",memberVO);
	}
	// 로그아웃 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request,
	                     HttpServletResponse response,
	                     HttpSession httpSession) throws Exception {

	    Object object = httpSession.getAttribute("login");
	    if (object != null) {
	        httpSession.removeAttribute("login");
	        httpSession.invalidate();
	    }

	    return "/login/logout";
	}

}