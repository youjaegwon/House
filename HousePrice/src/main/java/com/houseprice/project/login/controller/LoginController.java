package com.houseprice.project.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
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

	// 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		return "/login/login";
	}

	// 로그인
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO loginDTO, Model model) throws Exception {

		MemberVO memberVO = loginService.login(loginDTO);
		
		if (memberVO == null || !BCrypt.checkpw(loginDTO.getMpw(), memberVO.getMpw())) {
			return;
		}
		
		model.addAttribute("member",memberVO);
	}
	// 로그아웃
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
	
	// 권한 없는 사용자 관리자 페이지 접근시 에러 페이지 요청
    @RequestMapping(value= "/admin", method = RequestMethod.GET)
    public String admin() {
        return "/login/adminerror";
    }
    
    //비밀번호 찾기 페이지
    @RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String findpwGET() {
		return "/login/findpw";
	}
    
    //비밀번호 찾기
    @RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public String findpwPOST(LoginDTO loginDTO, Model model) throws Exception{
    	MemberVO memberVO = loginService.login(loginDTO);
    	System.out.println(memberVO.getMid());
    	//아이디 없으면
    	if(memberVO == null) {
    		return "/login/findpwError";
    	}
    	// 임시 비밀번호 생성
    	String pw = "";
    	for (int i = 0; i < 9; i++) {
    		pw += (char) ((Math.random() * 26) + 97);
    	}
    	memberVO.setMpw(pw);
    	// 비밀번호 암호화
    	String hashpw = BCrypt.hashpw(memberVO.getMpw(), BCrypt.gensalt());
    	memberVO.setMpw(hashpw);
    	loginService.updatepw(memberVO);
    	model.addAttribute("pw", pw);
		return "/login/findpwSuccess";
	}
}
