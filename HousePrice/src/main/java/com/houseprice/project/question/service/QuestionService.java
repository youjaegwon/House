package com.houseprice.project.question.service;

import java.util.List;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.PagingVo;


public interface QuestionService {

	void create(QuestionVO questionVO) throws Exception;

	QuestionVO read(int cno) throws Exception;

	void update(QuestionVO questionVO) throws Exception;

	List<QuestionVO> listAll(PagingVo paging) throws Exception;
	
	int countArticles(PagingVo paging) throws Exception;
	
	void hitupdate(int cno) throws Exception;
}
