package com.houseprice.project.question.repository;

import java.util.List;

import com.houseprice.project.login.model.LoginDTO;
import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.register.model.MemberVO;

public interface QuestionDAO {

	// 질문 목록
	List<QuestionVO> selectAll() throws Exception;
}
