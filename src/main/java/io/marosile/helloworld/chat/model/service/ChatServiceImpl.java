package io.marosile.helloworld.chat.model.service;

import io.marosile.helloworld.chat.model.dao.ChatDAO;
import io.marosile.helloworld.chat.model.dto.ChatRoom;
import io.marosile.helloworld.chat.model.dto.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatDAO dao;

    @Override
    public ChatRoom selectChatRoom(Map<String, Object> map) {
        return dao.selectChatRoom(map);
    }

    @Override
    @Transactional
    public List<ChatRoom> selectChatRoomList(String memberId) {
        return dao.selectChatRoomList(memberId);
    }

    @Override
    public int insertChatRoom() {
        return dao.insertChatRoom();
    }

    @Override
    public int insertChatSession(int chatRoomNo, List<String> members) {
        return dao.insertChatSession(chatRoomNo, members);
    }

    @Override
    public int insertMessage(Message message) {
        return dao.insertMessage(message);
    }

}
