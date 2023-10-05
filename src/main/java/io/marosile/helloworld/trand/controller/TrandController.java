package io.marosile.helloworld.trand.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.board.model.dto.Comment;
import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.trand.model.dto.Trand;
import io.marosile.helloworld.trand.model.service.TrandService;

@Controller 
@RequestMapping("/trand") // 트렌드 controller
public class TrandController {

	
	  @Autowired 
	  private TrandService service;
	 
	
	// 트랜드 목록
	@GetMapping("/list")
	public String trandList(Model model) {
		
		List<Board> List = service.selectTrandList();
		
		
		model.addAttribute("List", List);
			
		return "trand/trand-list";
	}
	
	
	// 태그 눌렀을때 해당 태그 목록
	@PostMapping("/tagList")
	@ResponseBody
	public List<Board> tagList(@RequestBody Map<String, Object> map){
		
		String type = (String) map.get("type");
		
		List<Board> tList = service.selectTagList(type);
		
		return tList;
	} 
	
	// 트렌드 상세
	@GetMapping("/detail")
	public String trandDetail(@RequestParam("boardNo") int boardNo
							  , Model model
							  ,@SessionAttribute(value="loginMember", required =false) Member loginMember) {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 게시글 내용
		Board trandDetail = service.selectTrandDetail(boardNo); 
		String boardUserId = trandDetail.getMemberId();
		
		// 댓글 내용
		List<Comment> commentList = service.selectComment(boardNo);
		
		// top10 목록
		List<Board> List = service.selectTrandList();
		
		map.put("boardNo", boardNo);
		
		if(trandDetail != null) {
			
			if(loginMember != null ) {
				
				map.put("memberId", loginMember.getMemberId());
				map.put("userId", boardUserId);
				
				// 북마크 조회
				int result = service.bookMarkCheck(map);
				if (result > 0)
					model.addAttribute("bookMarkCheck", "on");
				
				// 좋아요 조회
				int result2 = service.likeCheck(map);
				if (result2 > 0)
					model.addAttribute("likeCheck", "on");
				
				// 팔로우 조회
				int result3 = service.followCheck(map);
				if (result3 > 0) 
					model.addAttribute("followCheck", "on");
				
				// 게시글 팔로워 수 조회
				int result4 = service.selectFollowers(boardUserId);
				// 게시글 팔로잉 수 조회
				int result5 = service.selectFollowings(boardUserId);
				map.put("follower", result4);
				map.put("following", result5);
			}
		}
		
		
		map.put("trandDetail", trandDetail);
		map.put("commentList", commentList);
		map.put("List", List);
		
		model.addAttribute("map", map);
		
		return "trand/trand-detail";
	}
	
	
}
