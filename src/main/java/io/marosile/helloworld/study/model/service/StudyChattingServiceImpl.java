package io.marosile.helloworld.study.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.common.utility.Util;
import io.marosile.helloworld.study.model.dao.StudyChattingDAO;
import io.marosile.helloworld.study.model.dto.Message;

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
	
}
