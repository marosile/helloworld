package io.marosile.helloworld.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.board.model.dto.Tag;
import io.marosile.helloworld.recruit.model.dto.Recruit;

@Repository
public class TagDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 태그 조회
	public List<Tag> tagSelect(Map<String, Object> map) {
		return sqlSession.selectList("tagMapper.tagSelect", map);
	}
	
	// 태그 삽입 - 일반
	public int insertTag(Tag tag) {
		return sqlSession.insert("tagMapper.tagInsert", tag);
	}

	// 태그 삽입 - 채용공고
	public int insertTag2(Tag tag) {
		return sqlSession.insert("tagMapper.tagInsert2", tag);
	}
	
	// 태그 수정
	public int updateTag(Tag tag) {
		return sqlSession.update("tagMapper.tagUpdate", tag);
	}

	/** 내 매칭공고들의 태그들 가져오기
	 * @param rec
	 * @return List
	 */
	public List<Tag> tagSelects2(Recruit rec) {
		return sqlSession.selectList("tagMapper.tagSelect", rec);
	}


}
