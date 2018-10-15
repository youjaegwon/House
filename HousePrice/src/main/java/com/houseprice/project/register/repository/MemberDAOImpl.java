package com.houseprice.project.register.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.houseprice.project.register.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	private static final String NAMESPACE = "com.houseprice.project.mappers.register.registerMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberVO memberVO) throws Exception{	
		sqlSession.insert(NAMESPACE + ".insert", memberVO);
	}
}
