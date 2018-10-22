package com.houseprice.project.question.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.houseprice.project.question.model.QuestionVO;
import com.houseprice.project.question.paging.PagingVo;
import com.houseprice.project.question.search.QuestionSearchVO;
import com.houseprice.project.question.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {

	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);

	@Autowired
	private QuestionService questionService;

	// 목록 페이지 이동
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(PagingVo paging, Model model) throws Exception {

		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		String year = (String)simpleDate.format(date);
		int qnew = 0;
		List<QuestionVO> list = questionService.listAll(paging);
		for(QuestionVO qv : list) {
			qv.setCregdate(qv.getCregdate().substring(0, 10));
			if(year.equals(qv.getCregdate())) {
				qnew = 1;
			}
		}
		logger.info("리스트 페이지 이동...");
		paging.setTotal(questionService.countArticles(paging));
		model.addAttribute("questions", questionService.listAll(paging));
		model.addAttribute("p",paging);
		model.addAttribute("year",qnew);
		return "/question/question_list";
	}

	// 등록 페이지 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {
		logger.info("질문 작성 페이지 이동...");
		return "/question/question_write";
	}

	// 등록 처리
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(QuestionVO questionVO,
			RedirectAttributes redirectAttributes) throws Exception {

		logger.info("질문 작성 페이지 등록...");
		logger.info(questionVO.toString());
		questionService.create(questionVO);
		redirectAttributes.addFlashAttribute("msg", "writeSuccess");

		return "redirect:/question/list";
	}

	// 조회 페이지 이동
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam int cno,
			Model model) throws Exception {

		logger.info("질문 상세 페이지 이동...");
		questionService.hitupdate(cno);
		model.addAttribute("question", questionService.read(cno));

		return "/question/question_read";
	}

	// 수정 페이지 이동
	@RequestMapping(value= "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam int cno, Model model) throws Exception {

		logger.info("질문 수정 페이지 이동...");
		model.addAttribute("question", questionService.read(cno));

		return "/question/question_modify";
	}

	// 수정 페이지 이동
	@RequestMapping(value= "/modify", method = RequestMethod.POST)
	public String modifyPOST(String mid,QuestionVO questionVO, RedirectAttributes redirectAttributes) throws Exception {

		logger.info("질문 수정 등록...");
		questionService.update(questionVO);
		redirectAttributes.addFlashAttribute("msg", "modifySuccess");
		return "redirect:/question/list";
	}

	// 마이페이지 내질문 이동
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypagelist(PagingVo paging, Model model) throws Exception {

		List<QuestionVO> list = questionService.listAll(paging);
		logger.info("마이 페이지 내질문 이동...");
		paging.setTotal(questionService.countArticles2(paging));
		model.addAttribute("questions", questionService.mylist(paging));
		model.addAttribute("p",paging);
		return "/mypage/myquestion_list";
	}
	// 마이페이지 내질문 이동
	@RequestMapping(value = "/mypagesearch", method = RequestMethod.GET)
	public String mypagesearchlist(QuestionSearchVO questionsearchVO, Model model) throws Exception {

		List<QuestionVO> list = questionService.listAll(questionsearchVO);
		logger.info("마이페이지 검색...");
		PagingVo paging = new PagingVo();
		paging.setTotal(questionService.countArticles3(questionsearchVO));
		model.addAttribute("questions", questionService.searchlist(questionsearchVO));
		model.addAttribute("p",paging);
		return "/mypage/myquestion_list";
	}
}
