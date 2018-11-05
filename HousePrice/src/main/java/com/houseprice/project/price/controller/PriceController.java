package com.houseprice.project.price.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.houseprice.project.price.condition.SearchCondition;
import com.houseprice.project.price.model.ApartPriceVO;
import com.houseprice.project.price.service.PriceService;

@Controller
@RequestMapping("/price")
public class PriceController {
	
	private static final Logger logger = LoggerFactory.getLogger(PriceController.class);
	
	@Autowired
	private PriceService service;
	
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String showMap() throws Exception {
		
		return "/price/page";
	}
	
	
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchData(@RequestBody SearchCondition condition, Model model ) throws Exception {
		System.out.println("params:"+condition.toString());
		List<ApartPriceVO> searchResult = service.search(condition);
		model.addAttribute("searchResult", searchResult);
		return "/price/search";
	}
	
}
