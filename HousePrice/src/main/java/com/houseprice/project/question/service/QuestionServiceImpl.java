package com.houseprice.project.question.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.PagingVo;
import com.houseprice.project.question.repository.QuestionDAO;
import com.houseprice.project.question.search.QuestionSearchVO;


@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionDAO questionDAO;

	@Override
	public void create(QuestionVO questionVO) throws Exception {
		
		questionDAO.create(questionVO);
	}

	@Override
	public QuestionVO read(int cno) throws Exception {
		
		return questionDAO.read(cno);
	}

	@Override
	public void update(QuestionVO questionVO) throws Exception {
		
		questionDAO.update(questionVO);
	}

	@Override
	public List<QuestionVO> listAll(PagingVo paging) throws Exception {
		
		return questionDAO.listAll(paging);
	}

	@Override
	public int countArticles(PagingVo paging) throws Exception {
		
		return questionDAO.countArticles(paging);
	}

	@Override
	public int countArticles2(PagingVo paging) throws Exception {
		
		return questionDAO.countArticles2(paging);
	}
	
	@Override
	public int countArticles3(QuestionSearchVO questionsearchVO) throws Exception {
		
		return questionDAO.countArticles3(questionsearchVO);
	}
	
	@Override
	public void hitupdate(int cno) throws Exception {
		
		questionDAO.hitupdate(cno);
	}

	@Override
	public List<QuestionVO> mylist(PagingVo paging) throws Exception {
		
		return questionDAO.mylist(paging);
	}
	@Override
	public List<QuestionVO> searchlist(QuestionSearchVO questionsearchVO) throws Exception {
		
		return questionDAO.searchlist(questionsearchVO);
	}
}
