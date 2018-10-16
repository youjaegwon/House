package com.houseprice.project.question.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.houseprice.project.login.model.LoginDTO;
import com.houseprice.project.login.repository.LoginDAO;
import com.houseprice.project.register.model.MemberVO;


@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private LoginDAO loginDAO;

	@Override
	public MemberVO login(LoginDTO loginDTO) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.login(loginDTO);
	}
}
