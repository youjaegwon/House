package com.houseprice.project.admin.answer.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.houseprice.project.admin.answer.repository.AdminAnswerDAO;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.PagingVo;
import com.houseprice.project.question.search.QuestionSearchVO;


@Service
public class AdminAnswerServiceImpl implements AdminAnswerService{

	@Autowired
	private AdminAnswerDAO adminanswerDAO;


	@Override
	public List<QuestionVO> listAll(PagingVo paging) throws Exception {
		
		return adminanswerDAO.listAll(paging);
	}

	@Override
	public int countArticles(PagingVo paging) throws Exception {
		
		return adminanswerDAO.countArticles(paging);
	}

	@Override
	public int countArticles2(QuestionSearchVO questionsearchVO) throws Exception {
		
		return adminanswerDAO.countArticles2(questionsearchVO);
	}
	
	@Override
	public List<QuestionVO> searchlist(QuestionSearchVO questionsearchVO) throws Exception {
		
		return adminanswerDAO.searchlist(questionsearchVO);
	}

	
	@Override
	public void questionDelete2(int cno) throws Exception {
		adminanswerDAO.questionDelete2(cno);
		
	}
}
