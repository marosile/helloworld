package io.marosile.helloworld.board.model.service;

import java.util.List;

import io.marosile.helloworld.board.model.dto.Comment;

public interface CommentService {

	List<Comment> select(int boardNo);

}
