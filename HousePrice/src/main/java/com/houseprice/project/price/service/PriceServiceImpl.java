package com.houseprice.project.price.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.houseprice.project.price.condition.SearchCondition;
import com.houseprice.project.price.model.ApartPriceVO;
import com.houseprice.project.price.repository.PriceDAO;

@Service
public class PriceServiceImpl implements PriceService{
	
	@Autowired
	private PriceDAO dao;
	@Override
	public List<ApartPriceVO> search(SearchCondition condition) throws Exception {
		return dao.search(condition);
	}

}
