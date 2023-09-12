package io.marosile.helloworld.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.board.model.dto.Board;

@Repository
public class BoardDAO_PHJ {
	
	@Autowired
	private SqlSessionTemplate sqlSession2;

	
	// 게시글 목록 조회
	public List<Board> selectBoardList(int boardCode) {
		return sqlSession2.selectList("boardMapper.selectBoardList", boardCode);
	}

	// 게시글 상세 조회
	public Board selectBoard(Map<String, Object> map) {
		return sqlSession2.selectOne("boardMapper.selectBoard", map);
	}

}
