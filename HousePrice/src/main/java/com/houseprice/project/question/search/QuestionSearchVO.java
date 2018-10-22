package com.houseprice.project.question.search;

import com.houseprice.project.question.paging.PagingVo;

public class QuestionSearchVO extends PagingVo{
	
	private String searchType;
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
