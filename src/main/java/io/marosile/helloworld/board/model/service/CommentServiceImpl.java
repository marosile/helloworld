package io.marosile.helloworld.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.board.model.dao.CommentDAO;
import io.marosile.helloworld.board.model.dto.Comment;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO dao;
	
	// 댓글 목록 조회
	@Override
	public List<Comment> select(int boardNo) {
		return dao.select(boardNo);
	}

}
