package com.houseprice.project.blog.model.page;

import org.springframework.beans.factory.annotation.Autowired;


public class PageManager {

	private int requestPage;
	
	public PageManager() {}
	public PageManager(int requestPage) {
		this.requestPage = requestPage;
	}

	public PageRowResult getPageRowResult() {		
		PageRowResult pageRowResult = new PageRowResult();
		pageRowResult.setRowStartNumber(((requestPage*PageInfo.ROW_COUNT_PER_PAGE) - PageInfo.ROW_COUNT_PER_PAGE)+1);
		pageRowResult.setRowEndNumber(requestPage*PageInfo.ROW_COUNT_PER_PAGE);
		return pageRowResult;
	}
	
	public PageGroupResult getPageGroupResult(int count) {
		PageGroupResult pageGroupResult = new PageGroupResult();
		
		int requestPageGroupNumber =(int) Math.ceil((double)requestPage/PageInfo.SHOW_PAGE_COUNT);
		pageGroupResult.setGroupStartNumber(((requestPageGroupNumber*PageInfo.SHOW_PAGE_COUNT) - PageInfo.SHOW_PAGE_COUNT )+1);
		pageGroupResult.setGroupEndNumber(requestPageGroupNumber*PageInfo.SHOW_PAGE_COUNT);
		
		
		int totalPageNumber = 0;
		totalPageNumber = (int) Math.ceil((double)count/PageInfo.ROW_COUNT_PER_PAGE);
		
		//마지막 페이지 수
		if(pageGroupResult.getGroupEndNumber()>totalPageNumber) {
			pageGroupResult.setGroupEndNumber(totalPageNumber);
		}
		
		//before, after 유무
		if(pageGroupResult.getGroupStartNumber()==1) {
			pageGroupResult.setBeforePage(false);
		}
		if(pageGroupResult.getGroupEndNumber()==totalPageNumber) {
			pageGroupResult.setAfterPage(false);
		}
		
		//선택페이지 set
		pageGroupResult.setSelectPageNumber(requestPage);
		return pageGroupResult;
	}
}
