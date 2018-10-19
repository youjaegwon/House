package com.houseprice.project.register.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.houseprice.project.register.model.MemberVO;



@Repository
public class MembershipRepository {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="com.houseprice.project.mappers.register.registerMapper";
	
	public int insert(MemberVO membership) {
		
		return sqlSession.insert(NAMESPACE+ ".insert", membership);
	}
	public int update(MemberVO membership) {
		return sqlSession.update(NAMESPACE+".update",membership);
	}
	public MemberVO findByid(String mid) {
		return sqlSession.selectOne(NAMESPACE+".findByid",mid);
	}
	public List<MemberVO> selectAll(){
		return sqlSession.selectList(NAMESPACE);
	}
}
