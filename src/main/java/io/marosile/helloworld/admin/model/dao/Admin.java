package io.marosile.helloworld.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.admin.model.dto.AdminDTO;

@Repository
public class Admin {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 신고글 목록 조회
	public List<AdminDTO> adminReport() {
		
		return sqlSession.selectList("adminMapper.adminReport");
	}

}
