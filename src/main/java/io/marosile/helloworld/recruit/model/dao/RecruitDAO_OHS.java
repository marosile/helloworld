package io.marosile.helloworld.recruit.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecruitDAO_OHS {

	private final SqlSessionTemplate sqlSession;

	@Autowired
	public RecruitDAO_OHS(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
}
