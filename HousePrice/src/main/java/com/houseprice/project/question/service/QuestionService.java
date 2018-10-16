package com.houseprice.project.question.service;

import com.houseprice.project.login.model.LoginDTO;
import com.houseprice.project.register.model.MemberVO;

public interface QuestionService {

	// 로그인
	MemberVO login(LoginDTO loginDTO) throws Exception;
}
