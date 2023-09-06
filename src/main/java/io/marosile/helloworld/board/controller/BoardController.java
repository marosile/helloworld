package io.marosile.helloworld.board.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/board")
@Controller
public class BoardController {
	
	
	// 게시글 목록 조회 
	@GetMapping("/list")
	public String boardList() {
		
		return "board/board-list";
	}
	
	// 게시글 상세 조회
	@GetMapping("/detail")
	public String boardDetail() {
		
		return "board/board-detail";
	}

}
