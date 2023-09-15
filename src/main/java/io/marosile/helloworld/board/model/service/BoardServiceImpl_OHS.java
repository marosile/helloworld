package io.marosile.helloworld.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.board.model.dao.BoardDAO_OHS;
import io.marosile.helloworld.board.model.dto.Board;

@Service
public class BoardServiceImpl_OHS implements BoardService_OHS {

	@Autowired
	private BoardDAO_OHS dao;
	
	// 무한 스크롤
	@Override
	public List<Board> loadPosts(Map<String, Object> parameters) {
		return dao.loadPost(parameters);
	}

	// 게시글 삽입
	@Override
	public int boardInsert(Board board) {
		return dao.boardInsert(board);
	}

	// 게시글 수정
	@Override
	public Board selectBoard(Map<String, Object> map) {
		return null;
	}

}
