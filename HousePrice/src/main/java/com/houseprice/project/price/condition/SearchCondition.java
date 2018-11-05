package com.houseprice.project.price.condition;

public class SearchCondition {
	
	private String keyword;
	private LatLngBounds bounds;
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public LatLngBounds getBounds() {
		return bounds;
	}
	public void setBounds(LatLngBounds bounds) {
		this.bounds = bounds;
	}
	@Override
	public String toString() {
		return "SearchCondition [keyword=" + keyword + ", bounds=" + bounds + "]";
	}	
}
