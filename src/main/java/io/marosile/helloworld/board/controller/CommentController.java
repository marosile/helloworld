package io.marosile.helloworld.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.marosile.helloworld.board.model.dto.Comment;
import io.marosile.helloworld.board.model.service.CommentService;

@RestController
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	// 댓글 목록 조회
	@GetMapping(value = "/comment", produces="application/json; charset=UTF-8")
	public List<Comment> select(@RequestParam("boardNo") int boardNo) {
			
		return service.select(boardNo); 
	}

	// 댓글 삽입
	@PostMapping(value = "/comment")
	public int insert(@RequestBody Comment comment) { 
		
		System.out.println(comment);
		
		return service.insert(comment);
	}
		
	// 댓글 삭제
	@DeleteMapping("/comment")
	public int delete(@RequestBody int commentNo) {

		return service.delete(commentNo);
	}
	
	// 댓글 수정
	@PutMapping("/comment")
	public int update(@RequestBody Comment comment) {
		return service.update(comment);
	}
		
}
