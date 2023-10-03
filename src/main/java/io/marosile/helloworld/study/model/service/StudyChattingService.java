package io.marosile.helloworld.study.model.service;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.study.model.dto.ChattingRoom;
import io.marosile.helloworld.study.model.dto.Message;
import io.marosile.helloworld.study.model.dto.Study;

import java.util.List;
import java.util.Map;

public interface StudyChattingService {

	int insertMessage(Message msg);


	// 스터디 체팅 상세조회
	Study studyDetail(Map<String, Object> map);

	
	// 팔로우 리스트 조회
	List<Member> getFollowList(String memberId);

	// 스터디 검색
	List<Member> selectTarget(Map<String, Object> map);
}
