package com.houseprice.project.admin.member.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.houseprice.project.admin.member.model.AdminMemberVO;


@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO{

	private static final String NAMESPACE = "com.houseprice.project.mappers.admin.memberMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<AdminMemberVO> memberSelectAll() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+ ".selectList");
	}

	@Override
	public int expertUpdate(String mid) throws Exception {
		return sqlSession.update(NAMESPACE+ ".exportUpdate", mid);
	}

	@Override
	public int userUpdate(String mid) throws Exception {
		return sqlSession.update(NAMESPACE+ ".userUpdate", mid);
	}
}
