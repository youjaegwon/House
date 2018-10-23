package com.houseprice.project.admin.member.repository;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.houseprice.project.admin.member.model.AdminMemberVO;
import com.houseprice.project.question.paging.PagingVo;


@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO{

	private static final String NAMESPACE = "com.houseprice.project.mappers.admin.memberMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<AdminMemberVO> memberSelectAll(PagingVo paging) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+ ".selectList",paging);
	}

	@Override
	public int expertUpdate(String mid) throws Exception {
		return sqlSession.update(NAMESPACE+ ".expertUpdate", mid);
	}

	@Override
	public int userUpdate(String mid) throws Exception {
		return sqlSession.update(NAMESPACE+ ".userUpdate", mid);
	}

	@Override
	public List<AdminMemberVO> findByMid(AdminMemberVO AdminMemberVO) {
		
		return sqlSession.selectList(NAMESPACE+".findBymid",AdminMemberVO);
	}

	@Override
	public int countArticles(PagingVo paging) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".countArticles", paging);
	}

	@Override
	public int countArticles2(PagingVo paging) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countArticles2", paging);
	}
}
