package io.marosile.helloworld.board.model.service;

import java.util.List;
import java.util.Map;

import io.marosile.helloworld.board.model.dto.Board;

public interface BoardService_OHS {

	/** 무한스크롤
	 * @param start
	 * @param end
	 * @return list
	 */
	
	List<Board> loadPosts(Map<String, Object> parameters);

	/** 게시글 삽입
	 * @param board
	 * @return result
	 */
	int boardInsert(Board board);

	/** 게시글 수정
	 * @param board
	 * @return result
	 */
	int boardUpdate(Board board);

	

}
