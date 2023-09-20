package io.marosile.helloworld.board.model.service;

import java.util.List;
import java.util.Map;

import io.marosile.helloworld.board.model.dto.Board;

public interface BoardService_OHS {


	/** 무한스크롤(최신순, 기본값)
	 * @param parameters
	 * @return List
	 */
	List<Board> loadPosts(Map<String, Object> parameters);
	

	/** 무한스크롤(조회순)
	 * @param parameters
	 * @return List
	 */
	List<Board> loadPostsByReadCount(Map<String, Object> parameters);

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


	

}
