package io.marosile.helloworld.recruit.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import io.marosile.helloworld.recruit.model.dto.Company;
import io.marosile.helloworld.recruit.model.dto.EmploymentTest;
import io.marosile.helloworld.recruit.model.dto.Recruit;

public interface RecruitService_OHS {

	/** 내 채용공고 매칭 테스트 결과 삽입
	 * @param testResult
	 * @return result
	 */
	int insertMyResult(EmploymentTest EmploymentTest);

	/** 내 사용가능 기술 Tag 테이블로
	 * @param myStacks
	 * @return result
	 */
	int insertMyStacksToTag(Map<String, Object> myStacks);

	/** 채용공고 테스트 했는지 확인
	 * @param memberId
	 * @return result
	 */
	int checkMyResume(String memberId);

	/** 내 매칭 공고 가져오기
	 * @param employmentTest
	 * @return List
	 */
	List<Recruit> matchingRecruit(EmploymentTest employmentTest);

	/** 기업담당자 신청
	 * @param company
	 * @return result
	 */
	int companyInsert(Company company);

}
