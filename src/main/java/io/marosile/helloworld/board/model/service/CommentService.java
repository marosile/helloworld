package io.marosile.helloworld.board.model.service;

import java.util.List;

import io.marosile.helloworld.board.model.dto.Comment;

public interface CommentService {

	
	/** 댓글 목록 조회
	 * @param boardNo
	 * @return List
	 */
	List<Comment> select(int boardNo);

	
	/** 댓글 삽입
	 * @param comment
	 * @return result
	 */
	int insert(Comment comment);

}
