package com.houseprice.project.news.repository;

import com.houseprice.project.news.model.NewsVO;

public interface NewsDAO {
	
	// 크롤링 뉴스 저장
	void insert(NewsVO newsVO) throws Exception;
	// 크롤링 뉴스 삭제
	void delete(int ano) throws Exception;
}
