package io.marosile.helloworld.trand.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.trand.model.dto.Trand;

@Repository
public class TrandDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Board> selectTagList(String type) {
		
		return sqlSession.selectList("boardMapper.selectTagList", type);
	}

}
