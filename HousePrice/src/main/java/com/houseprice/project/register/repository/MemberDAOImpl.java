package com.houseprice.project.register.repository;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.houseprice.project.register.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	private static final String NAMESPACE = "com.houseprice.project.mappers.register.registerMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberVO memberVO) {	
		sqlSession.insert(NAMESPACE + ".insert", memberVO);
	}

	@Override
	public List<MemberVO> selectAll() {
		return sqlSession.selectList(NAMESPACE + ".selectAll");
	}

	@Override
	public void delete(String mid) {
		sqlSession.delete(NAMESPACE + ".delete", mid);
	}

}
