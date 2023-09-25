package io.marosile.helloworld.recruit.model.service;

import java.util.List;

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

}
