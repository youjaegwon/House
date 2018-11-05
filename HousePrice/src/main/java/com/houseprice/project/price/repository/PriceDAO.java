package com.houseprice.project.price.repository;

import java.util.List;

import com.houseprice.project.price.condition.SearchCondition;
import com.houseprice.project.price.model.ApartPriceVO;


public interface PriceDAO {
	List<ApartPriceVO> search(SearchCondition condition) throws Exception;
}
