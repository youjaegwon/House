package com.houseprice.project.register.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.houseprice.project.register.model.MemberVO;
import com.houseprice.project.register.repository.MembershipRepository;

@Service
public class MembershipService {
	@Autowired
	MembershipRepository repository;
	
	public String insert(MemberVO membership) {
		
		int insert=repository.insert(membership);
		String result="입력실패";
		if(insert>0) {
			result="입력성공";
		}
		return result;
	}
	public String update(MemberVO membership) {
		
		int update=repository.update(membership);
		String result="변경실패";
		if(update>0) {
			result="변경성공";
		}
		return result;
	}
	public MemberVO findByid(String mid) {
		
		return repository.findByid(mid);
	}
	public List<MemberVO> selectAll(){
		
		return repository.selectAll();
	}
	public int idcheck(String mid) {
		
		return repository.idcheck(mid);
	}
}
