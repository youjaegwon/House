package com.houseprice.project.register.repository;

import com.houseprice.project.register.model.MemberVO;

public interface MemberDAO {

	// 회원 입력
	void insert(MemberVO memberVO) throws Exception;
}
