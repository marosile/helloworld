package io.marosile.helloworld.study.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.study.model.dto.Message;

@Repository
public class StudyChattingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	public int insertMessage(Message msg) {
		
		return sqlsession.insert("studyChattingMapper.insertMessage",msg);
	}
}
