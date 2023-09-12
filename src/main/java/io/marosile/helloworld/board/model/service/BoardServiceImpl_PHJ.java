package io.marosile.helloworld.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.board.model.dao.BoardDAO_PHJ;
import io.marosile.helloworld.board.model.dto.Board;

@Service
public class BoardServiceImpl_PHJ implements BoardService_PHJ{
	
	@Autowired
	private BoardDAO_PHJ dao;

	
	// 게시글 목록 조회
	@Override
	public List<Board> selectBoardList(int boardCode) {
		
		List<Board> boardList = dao.selectBoardList(boardCode);
		
		return boardList;
	}


	// 게시글 상세 조회
	@Override
	public Board selectBoard(Map<String, Object> map) {
		
		return dao.selectBoard(map);
	}

	
}
