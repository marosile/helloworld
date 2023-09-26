package io.marosile.helloworld.admin.model.service;

import java.util.List;
import java.util.Map;

import io.marosile.helloworld.admin.model.dto.AdminDTO;
import io.marosile.helloworld.member.model.dto.Member;

public interface AdminService {

	/** 신고글 목록 조회
	 * @return
	 */
	List<AdminDTO> adminReport();


	/** 관리자 회원 목록 조회
	 * @return
	 */
	Map<String, Object> searchMemberList();


	/**관리자 회원 탈퇴 시키기..
	 * @return
	 * */
    int deleteMember(String[] memberIdList);


	/** 게시글 목록 조회(검색)
	* @return
	* */
	Map<String, Object> selectBoardList(Map<String, Object> paramMap);


	// 기업 담당자 자격 신청 목록
	List<AdminDTO> recruitList();

	// 기업 담당자 자격 신청 상세 페이지
	AdminDTO recruitOfficerDetail(String userId);

	// 기업 담당자 승인 업데이트 버튼
	int recruitOfficerUpdate(AdminDTO cmpnInfo);

	// 기업 담당자 승인 회원 자격 테이블에 추가
	int recruitOfficerInsert(AdminDTO cmpnInfo);

	// 현재 등록되어있는 담당자 리스트 뽑아오기
	List<AdminDTO> recruitListCurr();

	// 기업 담당자 삭제
	int recruitOfficerDelete(AdminDTO cmpnInfo);

	// autority 테이블에서 삭제
	int recruitOfficerDelete2(AdminDTO cmpnInfo);
}
