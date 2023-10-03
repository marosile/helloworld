package io.marosile.helloworld.study.model.dao;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.study.model.dto.Study;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.study.model.dto.Message;

import java.util.List;
import java.util.Map;

@Repository
public class StudyChattingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertMessage(Message msg) {
		
		return sqlSession.insert("studyChattingMapper.insertMessage",msg);
	}


	// 체팅리스트 가져오기
	public Study studyDetail(Map<String, Object> map) {
		return sqlSession.selectOne("studyMapper.studyChattingDetail",map);
	}


	//팔로우 리스트 조회
	public List<Member> getFollowList(String memberId) {
		return sqlSession.selectOne("studyMapper.selectTarget",memberId);
	}

	// 채팅 상대 검색
	public List<Member> selectTarget(Map<String, Object> map) {
		return sqlSession.selectList("studyMapper.selectTarget1", map);
	}
}
