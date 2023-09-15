package io.marosile.helloworld.board.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.board.model.service.BoardService_OHS;
import io.marosile.helloworld.board.model.service.BoardService_PHJ;
import io.marosile.helloworld.member.model.dto.Member;


@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService_OHS service;
	
	@Autowired
	private BoardService_PHJ service2;
	
	// 게시글 목록 조회 (첫 조회 -> posts 10개)
	@GetMapping("/{boardCode:[1-3]+}")
	public String boardList(Model model, @PathVariable("boardCode") int boardCode
			) {
		
		List<Board> boardList = service2.selectBoardList(boardCode);
		
		model.addAttribute("boardList", boardList);
		
		return "board/board-list";
	}
	
	
	
	// 게시글 목록 무한스크롤
	@GetMapping(value = "/loadPosts", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Board> loadPosts(@RequestParam("page") int page,
								 @RequestParam("boardCode") int boardCode){
		
	    int pageSize = 10; // 한 페이지에 표시할 게시글 수
	    int start = (page - 1) * pageSize + 1; // 첫 매핑 -> 11 두번째 매핑 -> 21 , ...
	    int end = page * pageSize; // 첫 매핑 -> 20, 두번째 매핑 -> 30 , ...
	    
	    Map<String, Object> parameters = new HashMap<>();
        
	    parameters.put("boardCode", boardCode);
        parameters.put("start", start);
        parameters.put("end", end);
	    
	    // 데이터베이스에서 start부터 end까지의 게시글을 가져오기
	    List<Board> postList = service.loadPosts(parameters);
	    
	    //model.addAttribute("postList", postList);
	    
        return postList;
	}
	
	
	// 게시글 상세 조회
	@GetMapping("/{boardCode}/{boardNo}")
	public String boardDetail(@PathVariable("boardCode") int boardCode
							, @PathVariable("boardNo") int boardNo
							, Model model
							, RedirectAttributes ra
							, @SessionAttribute(value="loginMember", required=false) Member loginMember
							, HttpServletRequest req
							, HttpServletResponse resp
							) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardCode", boardCode);
		map.put("boardNo", boardNo);
		
		Board board = service2.selectBoard(map);
		
		String path = null;
		
		if(board != null) {
			path = "board/board-detail";
			model.addAttribute("board", board);
			
		}else {
			path = "redirect:/board/" + boardCode;
			
			ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다.");
		}
		
		
		return path;
	}
	


}
