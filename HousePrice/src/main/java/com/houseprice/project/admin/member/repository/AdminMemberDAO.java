package com.houseprice.project.admin.member.repository;

import java.util.List;

import com.houseprice.project.admin.member.model.AdminMemberVO;
import com.houseprice.project.question.paging.PagingVo;


public interface AdminMemberDAO {

	// 회원정보 출력
	List<AdminMemberVO> memberSelectAll(PagingVo paging) throws Exception;
	// 전문가 권한 변경
	int expertUpdate(String mid) throws Exception;
	// 일반 사용자 권한 변경
	int userUpdate(String mid) throws Exception;
	//회원정보 검색
	List<AdminMemberVO> findByMid(AdminMemberVO AdminMemberVO);
	
	int countArticles(PagingVo paging) throws Exception;
	
	int countArticles2(PagingVo paging) throws Exception;
	
}
