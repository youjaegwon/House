package com.houseprice.project.admin.answer.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.PagingVo;
import com.houseprice.project.question.search.QuestionSearchVO;

@Repository
public class AdminAnswerDAOImpl implements AdminAnswerDAO{

	private static final String NAMESPACE = "com.houseprice.project.mappers.admin.answerMapper";
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<QuestionVO> listAll(PagingVo paging) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".qlistAll", paging);
	}
	
	@Override
	public int countArticles(PagingVo paging) throws Exception {
	    return sqlSession.selectOne(NAMESPACE + ".countArticles", paging);
	}
	@Override
	public int countArticles2(QuestionSearchVO questionsearchVO) throws Exception {
	    return sqlSession.selectOne(NAMESPACE + ".countArticles2", questionsearchVO);
	}
	
	@Override
	public List<QuestionVO> searchlist(QuestionSearchVO questionsearchVO) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".qsearchlistAll", questionsearchVO);
	}

	@Override
	public void questionDelete2(int cno) throws Exception {
		
		sqlSession.delete(NAMESPACE+".qdelete2", cno);
	}
}
