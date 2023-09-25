package io.marosile.helloworld.recruit.contorller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.recruit.model.dto.Company;
import io.marosile.helloworld.recruit.model.dto.EmploymentTest;
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
	private String recruitTestMainOrRecruitDetail(@SessionAttribute(value = "loginMember", required = false) Member loginMember
												,Model model) {
		
		// 테스트 했는지 조회
		
		String path =  "recruit/employment-test"; // 테스트 안했거나 로그인 안했으면 테스트 메인으로 
		
		if(loginMember != null) {
			
			String memberId = loginMember.getMemberId();
			
			int result = service2.checkMyResume(memberId); // 테스트 했는지 확인
			
			if(result == 1) { // 테스트 했다면 내 매칭 공고 상세페이지
				
				EmploymentTest EmploymentTest = service.selectResume(memberId);
				
				System.out.println(EmploymentTest);
				
				Map<String, Object> map = new HashMap<>();
				
				List<Recruit> matchingRecruitList = service2.matchingRecruit(EmploymentTest);
				
				System.out.println(matchingRecruitList);
				
				map.put("matching", matchingRecruitList);
				
				 model.addAttribute("map", map); 
				
				path = "recruit/employment-resultAndRecruitDetail";
			}
		}
		return path;
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
	public String postRecruit(@SessionAttribute("loginMember") Member loginMember) {
		
		// 기업 정보 가지고 오기
		String memberId = loginMember.getMemberId();
		
		Company myCompany = service2.selectMyCompanyInfo(memberId);
		
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
	
	// 기업 담당자 신청 등록
		@PostMapping("/application")
		public String postApplication(@RequestParam(value = "image", required=false) MultipartFile image
									 ,@SessionAttribute("loginMember") Member loginMember 
									 ,@ModelAttribute Company company
									 ,HttpSession session) {
			
			company.setMemberId(loginMember.getMemberId());
			
			company.setCompanyLogo(image.getOriginalFilename());
			
			String webPath = "/resources/images/recruit/";
			String filePath = session.getServletContext().getRealPath(webPath); // 실제 저장 경로
		    
			try {
		        // 파일 저장 경로와 파일 이름 설정
				String savePath = filePath + File.separator + company.getCompanyLogo();
		        File saveFile = new File(savePath);

		        // 파일을 지정된 경로에 저장
		        image.transferTo(saveFile);

		        System.out.println("company : " + company);

		        int result = service2.companyInsert(company);
		        
		        
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
			
			
			return "recruit/notice-list";
		}

	
}
