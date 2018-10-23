package com.houseprice.project.admin.question.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.houseprice.project.admin.question.repository.AdminQuestionDAO;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.PagingVo;
import com.houseprice.project.question.search.QuestionSearchVO;


@Service
public class AdminQuestionServiceImpl implements AdminQuestionService{

	@Autowired
	private AdminQuestionDAO adminquestionDAO;


	@Override
	public List<QuestionVO> listAll(PagingVo paging) throws Exception {
		
		return adminquestionDAO.listAll(paging);
	}

	@Override
	public int countArticles(PagingVo paging) throws Exception {
		
		return adminquestionDAO.countArticles(paging);
	}

	@Override
	public int countArticles2(QuestionSearchVO questionsearchVO) throws Exception {
		
		return adminquestionDAO.countArticles2(questionsearchVO);
	}
	
	@Override
	public List<QuestionVO> searchlist(QuestionSearchVO questionsearchVO) throws Exception {
		
		return adminquestionDAO.searchlist(questionsearchVO);
	}

	@Override
	public void questionDelete(int cno) throws Exception {
		adminquestionDAO.questionDelete(cno);
		
	}
	
	@Override
	public void questionDelete2(int cno) throws Exception {
		adminquestionDAO.questionDelete2(cno);
		
	}
}
