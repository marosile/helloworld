package io.marosile.helloworld.recruit.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.recruit.model.dto.Recruit;

@Repository
public class RecruitDAO_PHJ {

	private final SqlSessionTemplate sqlSession;

	@Autowired
	public RecruitDAO_PHJ(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	/** 전체 채용 공고 리스트 조회
	 * @return
	 */
	public List<Recruit> allRecruitList() {
		return sqlSession.selectList("trandMapper.allRecruitList");
	}
	
	
}
