package com.houseprice.project.login.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.houseprice.project.login.model.LoginDTO;
import com.houseprice.project.register.model.MemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO{

	private static final String NAMESPACE = "com.houseprice.project.mappers.login.loginMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO login(LoginDTO loginDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".login", loginDTO);
	}

	@Override
	public int updatepw(MemberVO memberVO) throws Exception {
		return sqlSession.update(NAMESPACE + ".update_pw", memberVO);
	}
	

}
