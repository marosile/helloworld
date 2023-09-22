package io.marosile.helloworld.recruit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.recruit.model.dao.RecruitDAO_PHJ;
import io.marosile.helloworld.recruit.model.dto.Recruit;

@Service
public class RecruitServiceImpl_PHJ implements RecruitService_PHJ{

	@Autowired
	private RecruitDAO_PHJ dao;

	// 전체 채용 공고 리스트 조회
	@Override
	public List<Recruit> allRecruitList() {
		return dao.allRecruitList();
	}
}
