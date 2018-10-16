package com.houseprice.project.question.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/question")
public class QuestionController {

	@RequestMapping(value="/move", method=RequestMethod.GET)
	public String question() {
		return "/question/question_list";
	}
}
