package io.marosile.helloworld.board.model.service;

import java.util.List;
import java.util.Map;

import io.marosile.helloworld.board.model.dto.Board;

public interface BoardService_OHS {

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

	/** 게시글 삭제
	 * @param map
	 * @return result
	 */
	int boardDelete(int boardNo);

	/** 조회순 최신순 10개 , 검색어 확인
	 * @param parameters
	 * @return
	 */
	List<Board> loadBoardList(Map<String, Object> parameters);

	/** 무한스크롤 - 최신순
	 * @param parameters
	 * @return List
	 */
	List<Board> loadRecentPosts(Map<String, Object> parameters);

	/** 무한스크롤 - 조회순
	 * @param parameters
	 * @return List
	 */
	List<Board> loadReadCountPosts(Map<String, Object> parameters);

}
