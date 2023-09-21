package io.marosile.helloworld.admin.model.dao;

import java.util.List;
import java.util.Map;

import io.marosile.helloworld.member.model.dto.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.admin.model.dto.AdminDTO;

@Repository
public class Admin {
	
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
}
