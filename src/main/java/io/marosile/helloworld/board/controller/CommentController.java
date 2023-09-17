package io.marosile.helloworld.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import io.marosile.helloworld.board.model.dto.Comment;
import io.marosile.helloworld.board.model.service.CommentService;


public class CommentController {

	
	@Autowired
	private CommentService service;
	
	// 댓글 목록 조회
		@GetMapping(value = "/comment", produces="application/json; charset=UTF-8")
		public List<Comment> select(@RequestParam("boardNo") int boardNo) {
			
			return service.select(boardNo); // HttpMessageConverter가 List -> JSON으로 변환
	}
	
}
