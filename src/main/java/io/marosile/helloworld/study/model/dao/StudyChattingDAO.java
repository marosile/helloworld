package io.marosile.helloworld.study.model.dao;

import io.marosile.helloworld.study.model.dto.ChattingRoom;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.study.model.dto.Message;

import java.util.List;

@Repository
public class StudyChattingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	public int insertMessage(Message msg) {
		
		return sqlsession.insert("studyChattingMapper.insertMessage",msg);
	}

	// 체팅방 페이지
	public List<ChattingRoom> selectRoomList(int memberNum) {
		return sqlsession.selectList("studyChattingMapper.selectRoomList",memberNum);

	}
}
