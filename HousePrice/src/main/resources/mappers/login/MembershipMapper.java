package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import model.Membership;

public interface MembershipMapper {
	@Insert("INSERT INTO H_MEMBER (mid,mpw,mname,mphone,mdate,mauth) VALUES (#{mid}, #{mpw}, #{mname}, #{mphone}, sysdate, #{mauth})")
	int insert(Membership membership);
	@Update("UPDATE H_MEMBER SET mid=#{mid}, mpw=#{mpw}, mname=#{mname}, mphone=#{mphone}, mauth=#{mauth}")
	int modify(Membership membership);
	@Delete("DELETE FROM H_MEMBER WHERE mid=#{mid}")
	int remove(String mid);
	@Select("SELECT * FROM H_MEMBER WHERE mid=#{mid}")
	Membership findByid(String mid);
}
