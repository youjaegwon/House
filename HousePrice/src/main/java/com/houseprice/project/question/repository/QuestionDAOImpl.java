package com.houseprice.project.question.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.houseprice.project.login.model.LoginDTO;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.register.model.MemberVO;

@Repository
public class QuestionDAOImpl implements QuestionDAO{

	private static final String NAMESPACE = "com.houseprice.project.mappers.question.questionMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<QuestionVO> selectAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".selectall");
	}
	

}
