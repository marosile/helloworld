package io.marosile.helloworld.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.board.model.dto.Tag;

@Repository
public class TagDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 태그 조회
	public List<Tag> tagSelect(Map<String, Object> map) {
		return sqlSession.selectList("tagMapper.tagSelect", map);
	}
	
	// 태그 삽입
	public int insertTag(Tag tag) {
		return sqlSession.insert("tagMapper.tagInsert", tag);
	}

	// 태그 수정
	public int updateTag(Tag tag) {
		return sqlSession.update("tagMapper.tagUpdate", tag);
	}

}
