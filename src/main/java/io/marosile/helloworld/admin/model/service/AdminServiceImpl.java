package io.marosile.helloworld.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.admin.model.dao.Admin;
import io.marosile.helloworld.admin.model.dto.AdminDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private Admin dao;

	// 신고글 목록 조회
	@Override
	public List<AdminDTO> adminReport() {
		
		return dao.adminReport();
	}

}
