package com.houseprice.project.answer.service;

import java.util.List;

import com.houseprice.project.answer.model.AnswerVO;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.PagingVo;
import com.houseprice.project.question.search.QuestionSearchVO;


public interface AnswerService {

	void create(AnswerVO answerVO) throws Exception;

	AnswerVO read(int cno) throws Exception;

	void update(AnswerVO questionVO) throws Exception;

	List<QuestionVO> listAll(PagingVo paging) throws Exception;
	
	int countArticles(PagingVo paging) throws Exception;
	
	int countArticles2(PagingVo paging) throws Exception;
	
	int countArticles3(QuestionSearchVO questionsearchVO) throws Exception;
	
	void hitupdate(int cno) throws Exception;
	
	List<QuestionVO> mylist(PagingVo paging) throws Exception;
	
	List<QuestionVO> searchlist(QuestionSearchVO questionsearchVO) throws Exception;
}
