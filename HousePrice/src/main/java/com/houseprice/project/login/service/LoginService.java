package com.houseprice.project.login.service;

import com.houseprice.project.login.model.LoginDTO;
import com.houseprice.project.register.model.MemberVO;

public interface LoginService {

	// 로그인
	MemberVO login(LoginDTO loginDTO) throws Exception;
}
