package com.houseprice.project.question.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.Criteria;
import com.houseprice.project.question.repository.QuestionDAO;


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
	public List<QuestionVO> listAll(Criteria criteria) throws Exception {
		
		return questionDAO.listAll(criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		
		return questionDAO.countArticles(criteria);
	}

	
}
