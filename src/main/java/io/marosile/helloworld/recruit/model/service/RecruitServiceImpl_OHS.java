package io.marosile.helloworld.recruit.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.marosile.helloworld.recruit.model.dao.RecruitDAO_OHS;
import io.marosile.helloworld.recruit.model.dto.EmploymentTest;
import io.marosile.helloworld.recruit.model.dto.Recruit;

@Service
public class RecruitServiceImpl_OHS implements RecruitService_OHS{

	@Autowired
	private RecruitDAO_OHS dao;

	// 내 채용공고 매칭 테스트 결과 삽입
	@Override
	public int insertMyResult(EmploymentTest EmploymentTest) {
		return dao.insertMyResult(EmploymentTest);
	}

	// 내 사용가능 기술 Tag 테이블로
	@Override
	public int insertMyStacksToTag(Map<String, Object> myStacks) {
		return dao.insertMyStacksToTag(myStacks);
	}


	// 채용공고 테스트 했는지 확인
	@Transactional
	@Override
	public int checkMyResume(String memberId) {
		return dao.checkMyResume(memberId);
	}

	// 내 매칭 공고 가져오기
	@Override
	public List<Recruit> matchingRecruit(EmploymentTest employmentTest) {
		return dao.matchingRecruit(employmentTest);
	}
}
