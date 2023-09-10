package io.marosile.helloworld.board.model.service;

import java.util.List;

import io.marosile.helloworld.board.model.dto.Board;

public interface BoardService_OHS {

	/** 무한스크롤
	 * @param start
	 * @param end
	 * @return list
	 */
	List<Board> loadPosts(int start, int end);

}
