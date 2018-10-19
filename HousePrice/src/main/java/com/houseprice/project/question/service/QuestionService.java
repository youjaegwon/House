package com.houseprice.project.question.service;

import java.util.List;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.Criteria;


public interface QuestionService {

	void create(QuestionVO questionVO) throws Exception;

	QuestionVO read(int cno) throws Exception;

	void update(QuestionVO questionVO) throws Exception;

	List<QuestionVO> listAll(Criteria criteria) throws Exception;
	
	int countArticles(Criteria criteria) throws Exception;
}
