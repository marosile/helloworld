package io.marosile.helloworld.chat.model.dao;

import io.marosile.helloworld.chat.model.dto.ChatRoom;
import io.marosile.helloworld.chat.model.dto.Message;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ChatDAO {

    @Autowired
    private SqlSessionTemplate session;

    public ChatRoom selectChatRoom(Map<String, Object> map) {
        return session.selectOne("chatMapper.selectChatRoom", map);
    }

    public List<ChatRoom> selectChatRoomList(String memberId) {
        return session.selectList("chatMapper.selectChatRoomList", memberId);
    }

    public int insertChatRoom() {
        Map<String, Object> map = new HashMap<>();
        session.insert("chatMapper.insertChatRoom", map);
        return Integer.parseInt(map.get("chatRoomNo").toString());
    }

    public int insertChatSession(int chatRoomNo, List<String> members) {
        Map<String, Object> map = new HashMap<>();
        map.put("chatRoomNo", chatRoomNo);
        map.put("members", members);
        System.out.println(map);
        return session.insert("chatMapper.insertChatSession", map);
    }

    public int insertMessage(Message message) {
        return session.insert("chatMapper.insertMessage", message);
    }
}
