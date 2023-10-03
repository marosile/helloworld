package io.marosile.helloworld.study.model.service;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.study.model.dto.ChattingRoom;
import io.marosile.helloworld.study.model.dto.Study;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.common.utility.Util;
import io.marosile.helloworld.study.model.dao.StudyChattingDAO;
import io.marosile.helloworld.study.model.dto.Message;

import java.util.List;
import java.util.Map;

@Service
public class StudyChattingServiceImpl implements StudyChattingService {

	@Autowired
	private StudyChattingDAO dao;

	// 메세지 삽입 
	@Override
	public int insertMessage(Message msg) {

		msg.setMessageContent(Util.XSSHandling(msg.getMessageContent()));
		return dao.insertMessage(msg);
	}


	// 스터디 체팅 상세조회
	@Override
	public Study studyDetail(Map<String, Object> map) {
		return dao.studyDetail(map);
	}


	// 팔로우 리스트 조회
	@Override
	public List<Member> getFollowList(String memberId) {
		return dao.getFollowList(memberId);
	}

	// 채팅 상대 검색
	@Override
	public List<Member> selectTarget(Map<String, Object> map) {
		return dao.selectTarget(map);
	}


}