package io.marosile.helloworld.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.board.model.dto.Tag;

@Repository
public class TagDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertTag(Tag tag) {

		return sqlSession.insert("tagMapper.tagInsert", tag);
	}

	

	
}
