package com.houseprice.project.register.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.houseprice.project.register.model.MemberVO;
import com.houseprice.project.register.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void insert(MemberVO memberVO) throws Exception{
		// TODO Auto-generated method stub
		memberDAO.insert(memberVO);
	}
}
