package com.houseprice.project.price.service;

import java.util.List;

import com.houseprice.project.price.condition.SearchCondition;
import com.houseprice.project.price.model.ApartPriceVO;

public interface PriceService {
	List<ApartPriceVO> search(SearchCondition condition) throws Exception;
}
