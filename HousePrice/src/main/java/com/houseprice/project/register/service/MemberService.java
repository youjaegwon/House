package com.houseprice.project.register.service;

import java.util.List;

import com.houseprice.project.register.model.MemberVO;

public interface MemberService {

	// 회원 입력
	void insert(MemberVO memberVO);
	// 회원 목록
	List<MemberVO> selectAll();
	// 회원 삭제
	void delete(String mid);
}
