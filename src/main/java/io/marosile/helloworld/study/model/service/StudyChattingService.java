package io.marosile.helloworld.study.model.service;

import io.marosile.helloworld.study.model.dto.ChattingRoom;
import io.marosile.helloworld.study.model.dto.Message;

import java.util.List;

public interface StudyChattingService {

	int insertMessage(Message msg);

	// 체팅페이지
	List<ChattingRoom> selectRoomList(int memberNum);
}
