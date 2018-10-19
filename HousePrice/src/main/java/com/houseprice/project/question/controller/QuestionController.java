package com.houseprice.project.question.controller;

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
import com.houseprice.project.question.paging.Criteria;
import com.houseprice.project.question.paging.PageMaker;
import com.houseprice.project.question.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {

	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;
	
	// 목록 페이지 이동
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Criteria criteria, Model model) throws Exception {

	    logger.info("리스트 페이지 이동...");
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCriteria(criteria);
	    pageMaker.setTotalCount(100);
	    model.addAttribute("pageMaker", pageMaker);
	    System.out.println(questionService.countArticles(criteria));
	    model.addAttribute("questions", questionService.listAll(criteria));
	    System.out.println(criteria.getPageStart());
	    System.out.println(criteria.getPerPageNum());
	    
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
}
