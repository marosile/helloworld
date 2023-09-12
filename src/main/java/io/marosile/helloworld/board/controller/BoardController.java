package io.marosile.helloworld.board.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.board.model.service.BoardService_OHS;


@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService_OHS service;
	
	// 게시글 목록 조회 (첫 조회 -> posts 10개)
	@GetMapping("/list/{boardCode}")
	public String boardList(Model model, @PathVariable("boardCode") int boardCode) {
		
		
		
		return "board/board-list";
	}
	
	// 게시글 목록 무한스크롤
	@GetMapping(value = "/loadPosts", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Board> loadPosts(@RequestParam("page") int page, Model model) {
		
	    int pageSize = 10; // 한 페이지에 표시할 게시글 수
	    int start = (page - 1) * pageSize + 1; // 첫 매핑 -> 11 두번째 매핑 -> 21 , ...
	    int end = page * pageSize; // 첫 매핑 -> 20, 두번째 매핑 -> 30 , ...
	    
	    // 데이터베이스에서 start부터 end까지의 게시글을 가져오기
	    List<Board> postList = service.loadPosts(start, end);
	    
	    //model.addAttribute("postList", postList);
	    
        return postList;
	}
	
	
	// 게시글 상세 조회
	@GetMapping("/detail")
	public String boardDetail() {
		
		return "board/board-detail";
	}
	


}
