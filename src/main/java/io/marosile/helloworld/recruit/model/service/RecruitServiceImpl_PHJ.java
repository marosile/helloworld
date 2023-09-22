package io.marosile.helloworld.recruit.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.recruit.model.dao.RecruitDAO_PHJ;

@Service
public class RecruitServiceImpl_PHJ implements RecruitService_PHJ{

	@Autowired
	private RecruitDAO_PHJ dao;
}
