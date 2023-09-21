package io.marosile.helloworld.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.board.model.dto.Comment;
import io.marosile.helloworld.board.model.dto.Board;

@Repository
public class BoardDAO_OHS {

	private final SqlSessionTemplate sqlSession;

	@Autowired
	public BoardDAO_OHS(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}


	/**
	 * 게시글 삽입
	 * @param board
	 * @return result
	 */
	public int boardInsert(Board board) {

		int result = sqlSession.insert("boardMapper.boardInsert", board);

		if (result > 0) {
			result = board.getBoardNo();
		}

		return result;
	}

	/**
	 * 게시글 수정
	 * @param board
	 * @return result
	 */
	public int boardUpdate(Board board) {

		int result = sqlSession.insert("boardMapper.boardUpdate", board);

		return result;
	}

	/** 게시글 삭제
	 * @param map
	 * @return result
	 */
	public int boardDelete(int boardNo) {
		
		int result = sqlSession.update("boardMapper.boardDelete", boardNo);
		
		return result;
	}

	/** 최신순, 조회순 조회
	 * @param parameters
	 * @return
	 */
	public List<Board> loadBoardList(Map<String, Object> parameters) {
		
		return sqlSession.selectList("loadBoardList", parameters);
	
	}


	/** 스크롤 - 최신
	 * @param parameters
	 * @return List
	 */
	public List<Board> loadRecentPosts(Map<String, Object> parameters) {
		return sqlSession.selectList("loadRecentPosts", parameters);
	}


	/** 스크롤 - 조회
	 * @param parameters
	 * @return List
	 */
	public List<Board> loadReadCountPosts(Map<String, Object> parameters) {
		return sqlSession.selectList("loadReadCountPosts", parameters);
	}


}
