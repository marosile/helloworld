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


}
