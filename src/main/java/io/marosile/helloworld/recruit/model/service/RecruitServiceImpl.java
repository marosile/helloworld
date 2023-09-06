package io.marosile.helloworld.recruit.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.recruit.model.dao.RecruitDAO;

@Service
public class RecruitServiceImpl implements RecruitService{

	@Autowired
	private RecruitDAO dao;
}
