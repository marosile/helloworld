package io.marosile.helloworld.board.model.service;

import java.util.List;
import java.util.Map;

import io.marosile.helloworld.board.model.dto.Board;

public interface BoardService_PHJ {

	/** 게시판 목록 조회
	 * @param boardCode
	 * @return
	 */
	List<Board> selectBoardList(int boardCode);

	
	/** 게시글 상세 조회
	 * @param map
	 * @return
	 */
	Board selectBoard(Map<String, Object> map);


	/** 북마크 확인 여부 서비스 
	 * @param map
	 * @return
	 */
	int bookMarkCheck(Map<String, Object> map);


	/** 북마크 처리 서비스
	 * @param map
	 * @return
	 */
	int bookMark(Map<String, Object> map);

}
