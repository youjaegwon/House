package com.houseprice.project.admin.question.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.houseprice.project.admin.question.service.AdminQuestionService;
import com.houseprice.project.question.paging.PagingVo;
import com.houseprice.project.question.search.QuestionSearchVO;


@Controller
@RequestMapping("/admin/question")
public class AdminQuestionController {

	private static final Logger logger = LoggerFactory.getLogger(AdminQuestionController.class);

	@Autowired
	AdminQuestionService adminquestionService;
	// 목록 페이지 이동
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(PagingVo paging, Model model) throws Exception {
		logger.info("관리자 질문 리스트 이동...");
		paging.setTotal(adminquestionService.countArticles(paging));
		model.addAttribute("questions", adminquestionService.listAll(paging));
		model.addAttribute("p",paging);
		return "/admin/question/admin_question_list";
	}
	// 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("RowCheck") int[] RowCheck, Model model) throws Exception {
		for(int cno : RowCheck) {
			adminquestionService.questionDelete2(cno);
			adminquestionService.questionDelete(cno);
		}
		return "redirect:/admin/question/list";
	}
	// 검색 결과
	@RequestMapping(value = "/searchlist", method = RequestMethod.GET)
	public String searchlist(QuestionSearchVO questionSearchVO, Model model) throws Exception {
		logger.info("관리자 질문 리스트 이동...");
		questionSearchVO.setTotal(adminquestionService.countArticles2(questionSearchVO));
		model.addAttribute("questions", adminquestionService.searchlist(questionSearchVO));
		model.addAttribute("p",questionSearchVO);
		return "/admin/question/admin_question_list";
	}
}
