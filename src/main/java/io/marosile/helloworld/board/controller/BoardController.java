package io.marosile.helloworld.board.controller;

import java.text.ParseException;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	@GetMapping("/{boardCode:[1-3]}")
	public String boardList(Model model, @PathVariable("boardCode") int boardCode) {

		List<Board> boardList = service2.selectBoardList(boardCode);

		model.addAttribute("boardList", boardList);

		return "board/board-list";
	}

	// 게시글 목록 무한스크롤
	@GetMapping(value = "/loadPosts", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Board> loadPosts(@RequestParam("page") int page, @RequestParam("boardCode") int boardCode) {

		int pageSize = 10; // 한 페이지에 표시할 게시글 수
		int start = (page - 1) * pageSize + 1; // 첫 매핑 -> 11 두번째 매핑 -> 21 , ...
		int end = page * pageSize; // 첫 매핑 -> 20, 두번째 매핑 -> 30 , ...

		Map<String, Object> parameters = new HashMap<>();

		parameters.put("boardCode", boardCode);
		parameters.put("start", start);
		parameters.put("end", end);

		List<Board> postList = service.loadPosts(parameters);

		return postList;
	}

	// 게시글 상세 조회
	@GetMapping("/{boardCode}/{boardNo}")
	public String boardDetail(@PathVariable("boardCode") int boardCode, @PathVariable("boardNo") int boardNo,
			Model model, RedirectAttributes ra,
			@SessionAttribute(value = "loginMember", required = false) Member loginMember, 
			HttpServletRequest req,
			HttpServletResponse resp) throws ParseException {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("boardCode", boardCode);
		map.put("boardNo", boardNo);

		Board board = service2.selectBoard(map);

		if(boardCode == 1) board.setBoardName("공지사항");
		
		if(boardCode == 2) board.setBoardName("자유 게시판");
		
		if(boardCode == 3) board.setBoardName("Q&A 게시판");


		String path = null;

		if (board != null) {

			if (loginMember != null) {

				map.put("memberId", loginMember.getMemberId());
				
				// 북마크 조회
				int result = service2.bookMarkCheck(map);
				if (result > 0)
					model.addAttribute("bookMarkCheck", "on");
				
				// 좋아요 조회
				int result2 = service2.likeCheck(map);
				
				if (result2 > 0)
					model.addAttribute("likeCheck", "on");

			}
			
			// --------------------------------------------------
			
			// 쿠키를 이용한 조회 수 
			path = "board/board-detail";
			model.addAttribute("board", board);

		} else {
			path = "redirect:/board/" + boardCode;

			ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다.");
		}

		return path;
	}

	// 북마크 처리
	@PostMapping("/bookMark")
	@ResponseBody
	public int bookMark(@RequestBody Map<String, Object> map) {
	    
	    return service2.bookMark(map);
	}
	
	
	// 좋아요 처리
	@PostMapping("/like")
	@ResponseBody
	public int like(@RequestBody Map<String, Object> map) {
		
		return service2.like(map);
		
	}
	
	
}
