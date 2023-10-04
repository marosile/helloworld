package io.marosile.helloworld.chat.model.service;

import io.marosile.helloworld.chat.model.dto.ChatRoom;
import io.marosile.helloworld.chat.model.dto.Message;

import java.util.List;
import java.util.Map;

public interface ChatService {

    ChatRoom selectChatRoom(Map<String, Object> map);

    List<ChatRoom> selectChatRoomList(String memberId);

    int insertChatRoom();

    int insertChatSession(int chatRoomNo, List<String> members);

    int insertMessage(Message message);

}
