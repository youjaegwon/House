package com.houseprice.project.news.repository;

import java.util.List;

import com.houseprice.project.news.model.NewsVO;

public interface NewsDAO {
	
	// 크롤링 뉴스 저장
	void insert(NewsVO newsVO) throws Exception;
	// 크롤링 뉴스 삭제
	void delete(Integer ano) throws Exception;
	// 크롤링 뉴스 조회
	List<NewsVO> listAll() throws Exception;
}
