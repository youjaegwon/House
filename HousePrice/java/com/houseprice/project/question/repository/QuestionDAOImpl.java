package com.houseprice.project.question.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.Criteria;

@Repository
public class QuestionDAOImpl implements QuestionDAO{

	private static final String NAMESPACE = "com.houseprice.project.mappers.question.questionMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void create(QuestionVO questionVO) throws Exception {
		
		sqlSession.insert(NAMESPACE + ".qcreate", questionVO);
	}

	@Override
	public QuestionVO read(int cno) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".qread", cno);
	}

	@Override
	public void update(QuestionVO questionVO) throws Exception {
		
		sqlSession.update(NAMESPACE + ".qupdate", questionVO);
	}

	@Override
	public List<QuestionVO> listAll(Criteria criteria) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".qlistAll", criteria);
	}
	
	@Override
	public int countArticles(Criteria criteria) throws Exception {
	    return sqlSession.selectOne(NAMESPACE + ".countArticles", criteria);
	}
}
