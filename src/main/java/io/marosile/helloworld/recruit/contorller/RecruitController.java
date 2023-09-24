package io.marosile.helloworld.recruit.contorller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.recruit.model.dto.Recruit;
import io.marosile.helloworld.recruit.model.service.RecruitService_OHS;
import io.marosile.helloworld.recruit.model.service.RecruitService_PHJ;


@Controller
@SessionAttributes("loginMember")
@RequestMapping("/recruit") // 채용 공고 controller
public class RecruitController {

	@Autowired
	private RecruitService_PHJ service;
	
	@Autowired
	private RecruitService_OHS service2;
	
	
	@GetMapping("/list")
	private String recruitTestMainOrRecruitDetail(@SessionAttribute(value = "loginMember", required = false) Member loginMember) {
		
		// 테스트 했는지 조회
		
		String path =  "recruit/employment-test"; // 테스트 안했거나 로그인 안했으면 테스트 메인으로 
		
		if(loginMember != null) {
			
			String memberId = loginMember.getMemberId();
			
			int result = service2.checkMyResume(memberId); // 테스트 했는지 확인
			
			if(result == 1) { // 테스트 했다면 내 매칭 공고 상세페이지
			
				// controller2에있는 matchingRecruitList 사용
				
				//
				
				path = "recruit/employment-resultAndRecruitDetail";
				
			}
		}
		return path;
	}
	
	
	// 채용 결과 페이지 == 내 매칭 공고 상세 페이지
	@GetMapping("/testResultAndRecuritDetail")
	public String recruitResult() {
		return "recruit/employment-test/employment-resultAndRecruitDetail";
	}
	
	// 전체 매칭 공고
	@GetMapping("/allNoticeList")
	public String allNoticeList(Model model) {
		
		 List<Recruit> recruitList = service.allRecruitList();
		 
		 model.addAttribute("recruitList", recruitList);
		 
		return "recruit/allnotice-list";
	}
	
	// 내 매칭 공고
	@GetMapping("/noticeList")
	public String noticeList() {
		return "recruit/notice-list";
	}
	
	// 상세의 상세페이지
	@GetMapping("/moreDetail")
	public String recruitDetail(@RequestParam("boardNo") int boardNo
								, Model model) {
		
		Recruit recruit = service.moreDetail(boardNo);
		
		String logo = recruit.getCompanyLogo();
		
		System.out.println(logo);
		
		model.addAttribute("recruit", recruit);
		
		
		return "recruit/recruit-moreDetail";
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
