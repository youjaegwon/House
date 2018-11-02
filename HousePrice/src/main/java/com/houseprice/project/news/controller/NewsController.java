package com.houseprice.project.news.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.houseprice.project.news.model.NewsVO;
import com.houseprice.project.news.naver_API.Naver_API;
import com.houseprice.project.question.paging.PagingVo;

@Controller
@RequestMapping("/news")
public class NewsController {

	Naver_API naver_api = new Naver_API();
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);


	// 목록 페이지 이동
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(PagingVo paging, Model model, String keyword) throws Exception {
		List<NewsVO> list = null;
		if(keyword != null) {
			 list = naver_api.search(keyword);
		}
		logger.info("리스트 페이지 이동...");
		model.addAttribute("news_crawling", list);
		return "/news/news_crawling_list";
	}
	
	@RequestMapping(value = "/crawling_save", method = RequestMethod.POST)
	public String save(List<NewsVO> selected_num) {
		
		return null;
	}

}
