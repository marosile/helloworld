package io.marosile.helloworld.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board2")
@Controller
public class BoardController2 {
	
	
	// 게시글 수정
	@GetMapping("/update")
	public String boardUpdate() {
		
		return "board/board-update";
	}
	
	// 게시글 작성
	@GetMapping("/write")
	public String boardWrite() {
		
		return "board/board-write";
	}
	
	

	}
