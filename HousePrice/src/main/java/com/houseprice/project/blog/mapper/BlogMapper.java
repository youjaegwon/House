package com.houseprice.project.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.houseprice.project.blog.model.BlogVO;
import com.houseprice.project.blog.model.UploadFile;
public interface BlogMapper {

	//이미지 업로드
	@Insert("INSERT INTO h_bfile VALUES(#{bfile_name}, sysdate, #{bfile_path}, #{id}, #{bfile_originalName}, #{bno})")
	@SelectKey(statement="SELECT SEQ_H_BFILE.NEXTVAL FROM DUAL",keyProperty="id",before=true,resultType=Integer.class)
	int save(UploadFile uploadFile);

	//이미지 다운로드
	@Select("SELECT * FROM h_bfile WHERE ID=#{id}")
	UploadFile findById(int id);

	//게시물 인서트
	@Insert("INSERT INTO h_blog (BNO, BTITLE, BCONTENT, BREGDATE, MID, Y_N, hit) VALUES(#{bno}, #{btitle}, #{bcontent}, TO_DATE(sysdate, 'YYYY-MM-DD'), #{mid},'미게시',0)")
	@SelectKey(statement="SELECT SEQ_H_BLOG.NEXTVAL FROM DUAL",keyProperty="bno",before=true,resultType=int.class)
	int insert(BlogVO blogVO);

	//상세페이지 셀렉트
	@Select("SELECT bno, bcontent, mid , btitle , hit, bregdate FROM H_BLOG WHERE BNO = #{bno}")
	BlogVO select(int bno);

	//게시물 목록
	@Select("<![CDATA[select bno, btitle, bcontent, bregdate,fid,mid,hit from(select b.bno bno, nvl(btitle, '미정') btitle, nvl(bcontent, '미정') bcontent, bregdate, nvl(fid, 0) fid, mid, Y_N, hit from (select b.bno, btitle, bcontent, bregdate, Y_N, (select id from h_bfile f where f.bno = b.bno and rownum<2) fid, mid ,hit from h_blog b order by bno desc) b left join h_bfile f on b.fid = f.id where Y_N ='게시' order by bno desc)]]>")
	List<BlogVO> selectList();

	//게시물 삭제
	@Delete("DELETE FROM H_BLOG WHERE BNO=#{BNO }")
	int delete(int bno);
	
	//게시물 작성
	@Update("UPDATE H_BLOG SET BTITLE = #{btitle}, BCONTENT = #{bcontent}, BREGDATE = sysdate, Y_N='게시' WHERE BNO = #{bno}")
	int update(BlogVO blogVO);

	//게시물 수정
	@Update("UPDATE H_BLOG SET BTITLE = #{btitle}, BCONTENT = #{bcontent}, BREGDATE = sysdate WHERE BNO = #{bno}")
	int update2(BlogVO blogVO);

	//블로그 관리 리스트
	@Select("<![CDATA[select rn, b.bno bno, nvl(btitle, '미정') btitle, nvl(bcontent, '미정') bcontent, bregdate, nvl(fid, 0) fid, mid, Y_N from (select rownum rn, b.bno, btitle, bcontent, bregdate, Y_N, (select id from h_bfile f where f.bno = b.bno and rownum<2) fid, mid from h_blog b order by bno desc) b left join h_bfile f on b.fid = f.id where rn between #{startLow} and #{endLow} order by rn asc]]>")
	List<BlogVO> selectListSave(BlogVO blogVO);

	@Update("UPDATE H_BLOG SET HIT = HIT+1 WHERE BNO = #{bno}")
	int hitUpdate(int bno);

	//게시여부 수정 = 게시
	@Update("UPDATE H_BLOG SET BREGDATE = sysdate, Y_N='게시' WHERE BNO = #{bno}")
	int update3(Integer bno);

	//게시여부 수정 = 미게시
	@Update("UPDATE H_BLOG SET BREGDATE = sysdate, Y_N='미게시' WHERE BNO = #{bno}")
	int updateN_Y(Integer bno);

	//관리자 페이지에서 삭제
	@Delete("DELETE FROM H_BLOG WHERE BNO=#{BNO }")
	int selectDelete(Integer bno);

	//페이징 총 페이지 겟수
	@Select("SELECT COUNT(*) count FROM H_BLOG")
	int pageGetCount();

}
