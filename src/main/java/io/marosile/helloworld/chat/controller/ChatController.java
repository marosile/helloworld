package io.marosile.helloworld.chat.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.marosile.helloworld.chat.model.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService service;

    @PostMapping("/getChatRoom")
    @ResponseBody
    public String getChatRoom(int chatRoomNo, String memberId) throws JsonProcessingException {
        Map<String, Object> map = new HashMap<>();
        map.put("chatRoomNo", chatRoomNo);
        map.put("memberId", memberId);
        return new ObjectMapper().writeValueAsString(service.selectChatRoom(map));
    }

    @PostMapping("/getChatRooms")
    @ResponseBody
    public String getChatRooms(String memberId) throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(service.selectChatRoomList(memberId));
    }

    @PostMapping("/addChatRoom")
    @ResponseBody
    public int addChatRoom(@RequestBody List<String> members) throws JsonProcessingException {
        System.out.println(members);
        return service.insertChatSession(service.insertChatRoom(), members);
    }

}
