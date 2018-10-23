package com.houseprice.project.news.data;

import java.util.List;

import com.houseprice.project.news.model.NewsVO;
import com.houseprice.project.news.naver_API.Naver_API;

public class TestMain {

	public static void main(String[] args) {
		Naver_API naverapi = new Naver_API();
//		naverapi.dateParsing("23 Oct 2018");
		List<NewsVO> resultList = naverapi.search("강서구");
		
		for(NewsVO vo : resultList) {
			System.out.println(vo.getAno());
			System.out.println(vo.getAtitle());
			System.out.println(vo.getAoriginallink());
			System.out.println(vo.getApubDate());
			System.out.println("---------------------------------------------");
			System.out.println(vo.getDescription());
			System.out.println("---------------------------------------------");
		}
	}

}
