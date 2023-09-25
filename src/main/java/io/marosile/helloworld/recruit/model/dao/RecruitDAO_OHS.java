package io.marosile.helloworld.recruit.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.recruit.model.dto.EmploymentTest;
import io.marosile.helloworld.recruit.model.dto.Recruit;

@Repository
public class RecruitDAO_OHS {

	private final SqlSessionTemplate sqlSession;

	@Autowired
	public RecruitDAO_OHS(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	/** 내 채용공고 매칭 테스트 결과 삽입
	 * @param testResult
	 * @return result
	 */
	public int insertMyResult(EmploymentTest EmploymentTest) {
		return sqlSession.insert("recruitMapper.insertMyResult", EmploymentTest);
	}

	/** 내 사용가능 기술 Tag 테이블로
	 * @param myStacks
	 * @return
	 */
	public int insertMyStacksToTag(Map<String, Object> myStacks) {
		return sqlSession.insert("tagMapper.insertMyStacksToTag", myStacks);
	}

	/** 채용공고 테스트 했는지 확인
	 * @param memberId
	 * @return result
	 */
	public int checkMyResume(String memberId) {
		return sqlSession.selectOne("recruitMapper.checkMyResume", memberId);
	}

	/** 내 매칭 공고 가져오기
	 * @param employmentTest
	 * @return list
	 */
	public List<Recruit> matchingRecruit(EmploymentTest employmentTest) {
		return sqlSession.selectList("recruitMapper.matchingRecruit", employmentTest);
	}
	
	
	
}
