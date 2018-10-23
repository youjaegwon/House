package com.houseprice.project.admin.question.repository;

import java.util.List;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.PagingVo;
import com.houseprice.project.question.search.QuestionSearchVO;

public interface AdminQuestionDAO {

	List<QuestionVO> listAll(PagingVo paging) throws Exception;

	int countArticles(PagingVo paging) throws Exception;
	
	int countArticles2(QuestionSearchVO questionsearchVO) throws Exception;
	
	List<QuestionVO> searchlist(QuestionSearchVO questionsearchVO) throws Exception;
	
	void questionDelete(int cno) throws Exception;
	
	void questionDelete2(int cno) throws Exception;
}
