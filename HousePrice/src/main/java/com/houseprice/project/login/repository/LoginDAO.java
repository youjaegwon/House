package com.houseprice.project.login.repository;

import com.houseprice.project.login.model.LoginDTO;
import com.houseprice.project.register.model.MemberVO;

public interface LoginDAO {

	// 로그인
	MemberVO login(LoginDTO loginDTO) throws Exception;
	// 비밀번호 변경
	int updatepw(MemberVO memberVO) throws Exception;
}
