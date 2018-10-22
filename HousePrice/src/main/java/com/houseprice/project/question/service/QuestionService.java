package com.houseprice.project.question.service;

import java.util.List;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.PagingVo;
import com.houseprice.project.question.search.QuestionSearchVO;


public interface QuestionService {

	void create(QuestionVO questionVO) throws Exception;

	QuestionVO read(int cno) throws Exception;

	void update(QuestionVO questionVO) throws Exception;

	List<QuestionVO> listAll(PagingVo paging) throws Exception;
	
	int countArticles(PagingVo paging) throws Exception;
	
	int countArticles2(PagingVo paging) throws Exception;
	
	int countArticles3(QuestionSearchVO questionsearchVO) throws Exception;
	
	void hitupdate(int cno) throws Exception;
	
	List<QuestionVO> mylist(PagingVo paging) throws Exception;
	
	List<QuestionVO> searchlist(QuestionSearchVO questionsearchVO) throws Exception;
}
