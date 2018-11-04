package com.houseprice.project.price.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.houseprice.project.price.condition.SearchCondition;
import com.houseprice.project.price.model.ApartPriceVO;

@Repository
public class PriceDAOImpl implements PriceDAO {
	
	private static final String NAMESPACE = "com.houseprice.project.mappers.price.priceMapper";
	
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<ApartPriceVO> search(SearchCondition condition) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".findbyrnum", condition);
	}

}
