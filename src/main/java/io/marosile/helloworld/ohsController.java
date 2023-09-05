package io.marosile.helloworld;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class ohsController {

	////////////////////////////////
	
	// 게시글 목록조회
	@GetMapping("/boardList")
	public String listTest() {
		return "board/board-list";
	}
	
	// 게시글 작성
	@GetMapping("/board/Write")
	public String boardWrite() {
		return "board/board-write";
	}
	
	// 게시글 수정
	@GetMapping("/board/Update")
	public String boardUpdate() {
		return "board/board-update";
	}
	
	////////////////////////////////
	
	// 커리어리 트렌드 상세
	@GetMapping("/trand/Detail")
	public String trandDetail() {
		return "trand/trand-detail";
	}
	
	////////////////////////////////
	
	// 테스트 한 적 없다면 채용공고 테스트 메인으로,
	// 테스트 한 적 있다면 내 매칭공고나 전체 채용 공고로
	
	// 채용공고 테스트 메인
	@GetMapping("/recruitTestMain")
	public String recruitMain() {
		return "recruit/employment-test/employment-main";
	}
	
	// 채용공고 테스트 결과 == 내 매칭 공고
	@GetMapping("/recruit/testResult")
	public String recruitResult() {
		return "recruit/employment-test/employment-resultAndRecruitDetail";
	}
	
	////////////////////////////////
	
	// 채용 공고 등록
	@GetMapping("/recruit/post")
	public String postRecruit() {
		return "recruit/recruit-post";
		
	////////////////////////////////	
		
		
	}
	
}
