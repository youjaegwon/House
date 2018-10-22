package com.houseprice.project.question.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.PagingVo;
import com.houseprice.project.question.search.QuestionSearchVO;

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
	public List<QuestionVO> listAll(PagingVo paging) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".qlistAll", paging);
	}
	
	@Override
	public int countArticles(PagingVo paging) throws Exception {
	    return sqlSession.selectOne(NAMESPACE + ".countArticles", paging);
	}
	@Override
	public int countArticles2(PagingVo paging) throws Exception {
	    return sqlSession.selectOne(NAMESPACE + ".countArticles2", paging);
	}
	
	@Override
	public int countArticles3(QuestionSearchVO questionsearchVO) throws Exception {
	    return sqlSession.selectOne(NAMESPACE + ".countArticles3", questionsearchVO);
	}
	@Override
	public void hitupdate(int cno) throws Exception {
		
		sqlSession.update(NAMESPACE + ".hitupdate", cno);
	}
	
	@Override
	public List<QuestionVO> mylist(PagingVo paging) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".qmylistAll", paging);
	}
	
	@Override
	public List<QuestionVO> searchlist(QuestionSearchVO questionsearchVO) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".qsearchlistAll", questionsearchVO);
	}
}
