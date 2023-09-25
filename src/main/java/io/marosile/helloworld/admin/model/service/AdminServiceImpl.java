package io.marosile.helloworld.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.marosile.helloworld.admin.model.dao.AdminDAO;
import io.marosile.helloworld.member.model.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.admin.model.dto.AdminDTO;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;

	// 신고글 목록 조회
	@Override
	public List<AdminDTO> adminReport() {
		
		return dao.adminReport();
	}

	// 관리자 회원 목록 조회
	@Override
	public Map<String, Object> searchMemberList() {

		// 전체 회원 수
		int memberCount = dao.memberCount();

		List<Member> memberList = dao.searchMemberList();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberCount", memberCount);
		map.put("memberList", memberList);

		return map;
	}

	// 관리자 회원 탈퇴 시키기...
	@Transactional
	@Override
	public int deleteMember(String[] memberIdList) {

		return dao.deleteMember(memberIdList);
	}

	// 관리자 회원 조회 (검색)
	@Override
	public Map<String, Object> selectBoardList(Map<String, Object> paramMap) {

		// 전체 회원 수
		int memberCount = dao.memberCount();

		// 검색한 것의 개수 구하기
		int searchCount = dao.getListCount(paramMap);

		List<Member> memberList = dao.searchMemberList(paramMap);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberCount", memberCount);
		map.put("searchCount", searchCount);
		map.put("memberList", memberList);


		return map;

	}

	// 관리자 기업 담당자 자격 신청 service
	@Override
	public List<AdminDTO> recruitList() {
		return dao.recruitList();
	}


	// 기업 담당자 자격 신청 상세 페이지
	@Override
	public AdminDTO recruitOfficerDetail(String userId) {
		return dao.recruitOfficerDetail(userId);
	}

}
