package io.marosile.helloworld.recruit.model.service;

import java.util.List;

import io.marosile.helloworld.recruit.model.dto.EmploymentTest;
import io.marosile.helloworld.recruit.model.dto.Recruit;

public interface RecruitService_PHJ {

	/** 전체 채용 공고 리스트 조회
	 * @return
	 */
	List<Recruit> allRecruitList();

	/** 상세의 상세페이지
	 * @param boardNo
	 * @return
	 */
	Recruit moreDetail(int boardNo);

	/** 로그인한 회원의 이력서 정보 조회
	 * @param memberId
	 * @return
	 */
	EmploymentTest selectResume(String memberId);

	/** 로그인한 멤버의 채용 리스트 조회
	 * @param memberId
	 * @return
	 */
	List<Recruit> noticeList(String memberId);

}
