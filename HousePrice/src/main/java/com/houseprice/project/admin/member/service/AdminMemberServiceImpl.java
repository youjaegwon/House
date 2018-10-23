package com.houseprice.project.admin.member.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.houseprice.project.admin.member.model.AdminMemberVO;
import com.houseprice.project.admin.member.repository.AdminMemberDAO;
import com.houseprice.project.question.paging.PagingVo;



@Service
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	private AdminMemberDAO adminmemberDAO;

	@Override
	public List<AdminMemberVO> memberSelectAll(PagingVo paging) throws Exception {
		// TODO Auto-generated method stub
		return adminmemberDAO.memberSelectAll(paging);
	}

	@Override
	public int expertUpdate(String mid) throws Exception {
		 
		return adminmemberDAO.expertUpdate(mid);
	}

	@Override
	public int userUpdate(String mid) throws Exception {
		// TODO Auto-generated method stub
		return adminmemberDAO.userUpdate(mid);
	}

	@Override
	public List<AdminMemberVO> findBymid(AdminMemberVO adminMemberVO) {
		
		return adminmemberDAO.findByMid(adminMemberVO);
	}

	@Override
	public int countArticles(PagingVo paging) throws Exception {
		
		return adminmemberDAO.countArticles(paging);
	}

	@Override
	public int countArticles2(PagingVo paging) throws Exception {
		
		return adminmemberDAO.countArticles2(paging);
	}
}
