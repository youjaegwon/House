package com.houseprice.project.register.service;

import com.houseprice.project.register.model.MemberVO;

public interface MemberService {

	// 회원 입력
	void insert(MemberVO memberVO) throws Exception;
}
