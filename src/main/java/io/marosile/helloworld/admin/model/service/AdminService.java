package io.marosile.helloworld.admin.model.service;

import java.util.List;

import io.marosile.helloworld.admin.model.dto.AdminDTO;

public interface AdminService {

	/** 신고글 목록 조회
	 * @return
	 */
	List<AdminDTO> adminReport();



}
