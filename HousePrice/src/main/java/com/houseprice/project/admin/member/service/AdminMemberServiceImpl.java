package com.houseprice.project.admin.member.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.houseprice.project.admin.member.model.AdminMemberVO;
import com.houseprice.project.admin.member.repository.AdminMemberDAO;



@Service
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	private AdminMemberDAO adminmemberDAO;

	@Override
	public List<AdminMemberVO> memberSelectAll() throws Exception {
		// TODO Auto-generated method stub
		return adminmemberDAO.memberSelectAll();
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
}
