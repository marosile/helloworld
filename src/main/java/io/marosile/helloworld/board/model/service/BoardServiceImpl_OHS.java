package io.marosile.helloworld.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.board.model.dao.BoardDAO_OHS;
import io.marosile.helloworld.board.model.dto.Board;

@Service
public class BoardServiceImpl_OHS implements BoardService_OHS {

	@Autowired
	private BoardDAO_OHS dao;
	
	@Override
	public List<Board> loadPosts(int start, int end) {
		return dao.loadPost(start, end);
	}

}
