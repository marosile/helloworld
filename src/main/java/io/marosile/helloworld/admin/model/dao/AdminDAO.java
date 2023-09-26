package io.marosile.helloworld.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import io.marosile.helloworld.member.model.dto.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.admin.model.dto.AdminDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 신고글 목록 조회
	public List<AdminDTO> adminReport() {
		
		return sqlSession.selectList("adminMapper.adminReport");
	}

	// 관리자 회원 목록 조회
    public List<Member> searchMemberList() {

		return sqlSession.selectList("adminMapper.searchMemberList");
    }

	// 관리자 회원 탈퇴
    public int deleteMember(String[] memberIdList) {

		int result = 0;

		if(memberIdList !=null && memberIdList.length > 0) {
			for(int i=0; i<memberIdList.length; i++) {
				System.out.println("ajax traditional result : " + i +" : "+ memberIdList[i]);
				String memberId = memberIdList[i];

				result = sqlSession.update("adminMapper.deleteMember", memberId);
			}

			return result;
		}

		return 0;

    }


	// 검색 개수 조회
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("adminMapper.getListCount", paramMap);
	}

	// 검색 리스트 조회
	public List<Member> searchMemberList(Map<String, Object> paramMap) {
		return sqlSession.selectList("adminMapper.searchMemberList1", paramMap);
	}

	// 전체 회원 수 조회
	public int memberCount() {
		return sqlSession.selectOne("adminMapper.memberCount");
	}


	// 관리자 기업 담당자 자격 신청 dao
	public List<AdminDTO> recruitList() {

		List<AdminDTO> recruitList = sqlSession.selectList("adminMapper.recruitList");


		if(recruitList != null){
			for(AdminDTO adminDTO : recruitList){

				/* 향상된 for문을 통해 반복하여 전화번호를 가져온다 */
				String userTel = sqlSession.selectOne("adminMapper.userTel", adminDTO);

				adminDTO.setUserTel(userTel);

			}

		}

		return recruitList;
	}


	// 기업 담당자 자격 신청 상세 페이지
	public AdminDTO recruitOfficerDetail(String userId) {

		return sqlSession.selectOne("adminMapper.recruitOfficerDetail", userId);
	}

	// 기업 담당자 업데이트
	public int recruitOfficerUpdate(AdminDTO cmpnInfo) {
		return sqlSession.update("adminMapper.recruitOfficerUpdate", cmpnInfo);
	}


	// 기업 담당자 승인 회원 자격 테이블에 추가
	public int recruitOfficerInsert(AdminDTO cmpnInfo) {
		return sqlSession.insert("adminMapper.recruitOfficerInsert", cmpnInfo);
	}


	// 현재 등록되어있는 담당자 리스트 뽑아오기
	public List<AdminDTO> recruitListCurr() {

		List<AdminDTO> recruitListCurr = sqlSession.selectList("adminMapper.recruitListCurr");


		if(recruitListCurr != null){
			for(AdminDTO adminDTO : recruitListCurr){

				/* 향상된 for문을 통해 반복하여 전화번호를 가져온다 */
				String userTel = sqlSession.selectOne("adminMapper.userTel", adminDTO);

				adminDTO.setUserTel(userTel);

			}

		}
		return recruitListCurr;
	}

	// 기업 담당자 삭제
	public int recruitOfficerDelete(AdminDTO cmpnInfo) {
		return sqlSession.delete("adminMapper.recruitOfficerDelete", cmpnInfo);
	}

	// autority 테이블에서 삭제
	public int recruitOfficerDelete2(AdminDTO cmpnInfo) {
		return sqlSession.delete("adminMapper.recruitOfficerDelete2", cmpnInfo);
	}

	public int recruitCancel(String userId) {
		return sqlSession.delete("adminMapper.recruitOfficerDelete", userId);
	}
	
	// 전화번호 찾기
	public String findUserTel(String userId) {
		return sqlSession.selectOne("adminMapper.userTel", userId);
	}
}
