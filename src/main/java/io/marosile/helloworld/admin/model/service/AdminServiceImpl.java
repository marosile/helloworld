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


	// 기업 담당자 업데이트
	@Transactional
	@Override
	public int recruitOfficerUpdate(AdminDTO cmpnInfo) {
		return dao.recruitOfficerUpdate(cmpnInfo);
	}

	@Transactional
	// 기업 담당자 승인 회원 자격 테이블에 추가
	@Override
	public int recruitOfficerInsert(AdminDTO cmpnInfo) {
		return dao.recruitOfficerInsert(cmpnInfo);
	}

	// 현재 등록되어있는 담당자 리스트 뽑아오기
	@Override
	public List<AdminDTO> recruitListCurr() {
		return dao.recruitListCurr();
	}

	@Transactional
	// 기업 담당자 삭제 시키기
	@Override
	public int recruitOfficerDelete(AdminDTO cmpnInfo) {
		return dao.recruitOfficerDelete(cmpnInfo);
	}

	@Transactional
	// autority 테이블에서 삭제
	@Override
	public int recruitOfficerDelete2(AdminDTO cmpnInfo) {
		return dao.recruitOfficerDelete2(cmpnInfo);
	}

	// 반려하기
	@Override
	public int recruitCancle(String userId) {
		return dao.recruitCancle(userId);
	}

}
