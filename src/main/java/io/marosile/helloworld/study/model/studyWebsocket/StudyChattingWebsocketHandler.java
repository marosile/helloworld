package io.marosile.helloworld.study.model.studyWebsocket;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.emory.mathcs.backport.java.util.Collections;
import io.marosile.helloworld.study.model.dto.Message;
import io.marosile.helloworld.study.model.service.StudyChattingService;

public class StudyChattingWebsocketHandler extends TextWebSocketHandler {
	
	private Logger logger = LoggerFactory.getLogger(StudyChattingWebsocketHandler.class);
	
	@Autowired
	private StudyChattingService service;
	
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());

	// 소켓 연결 확인 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("{}연결됨",session.getId());
		sessions.add(session);
	}

	// 소켓 통신 시 메세지의 전송을 다루는 부분
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("전달 받은 내용 : "+ message.getPayload());
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		Message msg = objectMapper.readValue(message.getPayload(), Message.class);
		
		System.out.println("msg:"+msg);
		
		int result = service.insertMessage(msg);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}

}
