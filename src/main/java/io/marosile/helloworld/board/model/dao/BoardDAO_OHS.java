package io.marosile.helloworld.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.board.model.dto.Board;

@Repository
public class BoardDAO_OHS {

	private final SqlSessionTemplate sqlSession; 

    @Autowired
    public BoardDAO_OHS(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }
	

	/** 무한스크롤
	 * @param parameters
	 * @return list
	 */
	public List<Board> loadPost(Map<String, Object> parameters) {
		return sqlSession.selectList("loadPost", parameters);
	}


	
	/** 게시글 삽입
	 * @param board
	 * @return result
	 */
	public int boardInsert(Board board) {
		
		int result = sqlSession.insert("boardMapper.boardInsert", board);
		
		if(result > 0) {
			result = board.getBoardNo();
		}
		
		return result;
	}


	/** 게시글 수정
	 * @param board
	 * @return result
	 */
	public int boardUpdate(Board board) {
		
		int result = sqlSession.insert("boardMapper.boardUpdate", board);
		
		return result;
	}

}
