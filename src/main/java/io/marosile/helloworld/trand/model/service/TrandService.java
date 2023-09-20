package io.marosile.helloworld.trand.model.service;

import java.util.List;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.board.model.dto.Comment;
import io.marosile.helloworld.trand.model.dto.Trand;

public interface TrandService {

	
	/** 트렌드 리스트 조회(태그별)
	 * @param type
	 * @return
	 */
	List<Board> selectTagList(String type);

	/** 트렌드 리스트 조회
	 * @return
	 */
	List<Board> selectTrandList();

	/** 트렌드 상세페이지 (게시글)
	 * @param boardNo
	 * @return
	 */
	Board selectTrandDetail(int boardNo);

	/** 트렌드 상세페이지 (댓글 목록)
	 * @param boardNo
	 * @return
	 */
	List<Comment> selectComment(int boardNo);

}
