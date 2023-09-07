package io.marosile.helloworld.recruit.contorller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/recruit") // 채용 공고 controller
public class RecruitController {


	
	@GetMapping("/list")
	private String recruitTestMainOrRecruitDetail() {
		
		// 테스트 했는지 조회
		// if result == 1 -> 테스트 메인 jsp로
		// else -> 내 매칭 공고 jsp로
		
		// 임시 : 테스트 메인으로
		return "recruit/employment-test/employment-main";
	}
	
	// jsp 1개로 합칠건데 일단 5개로 나뉨
	@GetMapping("/test1")
	private String recruitTest1() {
		return "recruit/employment-test/employment-test1";
	}
	
	@GetMapping("/test2")
	private String recruitTest2() {
		return "recruit/employment-test/employment-test2";
	}
	
	@GetMapping("/test3")
	private String recruitTest3() {
		return "recruit/employment-test/employment-test3";
	}
	
	@GetMapping("/test4")
	private String recruitTest4() {
		return "recruit/employment-test/employment-test4";
	}
	
	@GetMapping("/test5")
	private String recruitTest5() {
		return "recruit/employment-test/employment-test5";
	}
	
	@GetMapping("/test6")
	private String recruitTest6() {
		return "recruit/employment-test/employment-test6";
	}
	
	// 채용 결과 페이지 == 내 매칭 공고 상세 페이지
	@GetMapping("/testResultAndRecuritDetail")
	public String recruitResult() {
		return "recruit/employment-test/employment-resultAndRecruitDetail";
	}
	
	// 전체 매칭 공고
	@GetMapping("/allNoticeList")
	public String allNoticeList() {
		return "recruit/allnotice-list";
	}
	
	// recruitTestMainOrRecruitDetail()에서 판별할건데 일단 조건 못거니까 만듬
	// 내 매칭 공고
	@GetMapping("/noticeList")
	public String noticeList() {
		return "recruit/notice-list";
	}
	
	// 상세의 상세페이지
	@GetMapping("/MoreDetail")
	public String recruitDetail() {
		return "recruit/recruit-detail";
	}
	
	// 채용 공고 등록
	@GetMapping("/post")
	public String postRecruit() {
		return "recruit/recruit-post";
	}
	
	// 이력서 등록
	@RequestMapping("/apply")
	public String recruitApply() {
		return "recruit/recruit-apply";
	}

	
	// 기업 담당자 신청
	@GetMapping("/application")
	public String application() {
		return "recruit/application";
	}
	
}
