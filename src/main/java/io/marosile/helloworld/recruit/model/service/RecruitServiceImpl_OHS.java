package io.marosile.helloworld.recruit.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.recruit.model.dao.RecruitDAO_OHS;

@Service
public class RecruitServiceImpl_OHS implements RecruitService_OHS{

	@Autowired
	private RecruitDAO_OHS dao;
}
