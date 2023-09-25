package io.marosile.helloworld.recruit.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.recruit.model.dto.EmploymentTest;
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
		return sqlSession.selectList("recruitMapper.allRecruitList");
	}

	/** 상세의 상세페이지
	 * @param boardNo
	 * @return
	 */
	public Recruit moreDetail(int boardNo) {
		return sqlSession.selectOne("recruitMapper.moreDetail", boardNo );
	}

	/** 로그인한 회원의 이력서 정보 조회
	 * @param memberId
	 * @return
	 */
	public EmploymentTest selectResume(String memberId) {
		return sqlSession.selectOne("employmentMapper.selectResume", memberId);
	}
	
	
}
