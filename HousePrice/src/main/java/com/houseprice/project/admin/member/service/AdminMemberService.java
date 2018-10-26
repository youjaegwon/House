package com.houseprice.project.admin.member.service;

import java.util.List;
import com.houseprice.project.admin.member.model.AdminMemberVO;
import com.houseprice.project.question.paging.PagingVo;


public interface AdminMemberService {

	// 회원정보 출력
	List<AdminMemberVO> memberSelectAll(PagingVo paging) throws Exception;
	// 전문가 권한 변경
	int expertUpdate(String mid) throws Exception;
	// 일반 사용자 권한 변경
	int userUpdate(String mid) throws Exception;
	//아이디 검색
	List<AdminMemberVO> findBymid(PagingVo paging);
	
	int countArticles(PagingVo paging) throws Exception;
	
	int countArticles2(PagingVo paging) throws Exception;
}
