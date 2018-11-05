package com.houseprice.project.blog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.houseprice.project.blog.model.BlogVO;
import com.houseprice.project.blog.model.UploadFile;

@Repository
public class BlogRepository {
	
	private static final String NAMESPACE = "com.houseprice.project.mappers.blog.blogMapper";
	@Autowired
	private SqlSession sqlSession;
	
	public int save(UploadFile uploadFile) {
		sqlSession.insert(NAMESPACE + ".save", uploadFile);
		return uploadFile.getId();
	}

	public UploadFile findById(int id) {
		return sqlSession.selectOne(NAMESPACE + ".findById", id);
	}

	public int insert(BlogVO blogVO) {
		
		sqlSession.insert(NAMESPACE + ".insert", blogVO);
		return blogVO.getBno();
	}

	public BlogVO select(int bno) {
		
		return sqlSession.selectOne(NAMESPACE + ".select", bno);
	}

	public List<BlogVO> selectList(BlogVO blogVO) {
		System.out.println(blogVO.getEndLow());
		System.out.println(blogVO.getStartLow());
		return sqlSession.selectList(NAMESPACE + ".selectList", blogVO);
	}
	
	public List<BlogVO> selectListSave(BlogVO blogVO) {
		return sqlSession.selectList(NAMESPACE + ".selectListSave", blogVO);
	}

	public int delete(int bno) {
		return sqlSession.delete(NAMESPACE + ".delete" , bno);
	}

	public int update(BlogVO blogVO) {
		
		sqlSession.update(NAMESPACE + ".update", blogVO);
		return blogVO.getBno();
	}

	public int update2(BlogVO blogVO) {
		
		return sqlSession.update(NAMESPACE + ".update2", blogVO);
	}

	public int hitUpdate(int bno) {
		
		return sqlSession.update(NAMESPACE + ".hitUpdate", bno);
	}

	public int update3(Integer bno) {
		return sqlSession.update(NAMESPACE + ".update3", bno);
	}

	public int updateN_Y(Integer bno) {
		return sqlSession.update(NAMESPACE + ".updateN_Y", bno);
	}

	public int selectDelete(Integer bno) {
		return sqlSession.delete(NAMESPACE + ".selectDelete", bno);
	}

	public int pageGetCount() {
		
		return sqlSession.selectOne(NAMESPACE+".pageGetCount");
	}
	
	public int pageGetMain() {
		
		return sqlSession.selectOne(NAMESPACE+".pageGetMain");
	}
	//list 형식으로 받아올라믄 selectList
	public List<BlogVO> mainSelect() {

		return sqlSession.selectList(NAMESPACE+".mainSelect");
	}

	public List<BlogVO> selectFindByBtitle(BlogVO blogVO) {
		return sqlSession.selectList(NAMESPACE+".selectFindByBtitle", blogVO);
	}

	
}
