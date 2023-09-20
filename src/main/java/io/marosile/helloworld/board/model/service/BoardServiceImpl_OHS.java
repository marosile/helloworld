package io.marosile.helloworld.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.board.model.dao.BoardDAO_OHS;
import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.common.utility.Util;

@Service
public class BoardServiceImpl_OHS implements BoardService_OHS {

	@Autowired
	private BoardDAO_OHS dao;
	
	// 무한 스크롤 (최신순, 기본값)
	@Override
	public List<Board> loadPosts(Map<String, Object> parameters) {
		return dao.loadPosts(parameters);
	}
	
	// 무한 스크롤 (조회순)
	@Override
	public List<Board> loadPostsByReadCount(Map<String, Object> parameters) {
		return dao.loadPostsByReadCount(parameters);
	}

	// 게시글 삽입
	@Override
	public int boardInsert(Board board) {
		
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		
		return dao.boardInsert(board);
	}

	// 게시글 수정
	@Override
	public int boardUpdate(Board board) {
		
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		
		return dao.boardUpdate(board);
	}

	// 게시글 삭제
	@Override
	public int boardDelete(int boardNo) {
		return dao.boardDelete(boardNo);
	}





}
