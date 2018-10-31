package com.houseprice.project.admin.answer.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.houseprice.project.admin.answer.service.AdminAnswerService;
import com.houseprice.project.question.paging.PagingVo;
import com.houseprice.project.question.search.QuestionSearchVO;


@Controller
@RequestMapping("/admin/answer")
public class AdminAnswerController {

	private static final Logger logger = LoggerFactory.getLogger(AdminAnswerController.class);

	@Autowired
	AdminAnswerService adminanswerService;
	// 목록 페이지 이동
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(PagingVo paging, Model model) throws Exception {
		logger.info("관리자 답변 리스트 이동...");
		paging.setTotal(adminanswerService.countArticles(paging));
		model.addAttribute("answers", adminanswerService.listAll(paging));
		model.addAttribute("p",paging);
		return "/admin/answer/admin_answer_list";
	}
	// 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("RowCheck") int[] RowCheck, Model model) throws Exception {
		for(int cno : RowCheck) {
			adminanswerService.questionDelete2(cno);
		}
		return "redirect:/admin/answer/list";
	}
	// 검색 결과
	@RequestMapping(value = "/searchlist", method = RequestMethod.GET)
	public String searchlist(QuestionSearchVO questionSearchVO, Model model) throws Exception {
		logger.info("관리자 질문 리스트 이동...");
		questionSearchVO.setTotal(adminanswerService.countArticles2(questionSearchVO));
		model.addAttribute("answers", adminanswerService.searchlist(questionSearchVO));
		model.addAttribute("p",questionSearchVO);
		return "/admin/answer/admin_answer_list";
	}
}
