package io.marosile.helloworld.recruit.contorller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import io.marosile.helloworld.board.model.dto.Tag;
import io.marosile.helloworld.board.model.service.TagService;
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
	
	@Autowired
	private TagService service3;
	
	
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
				
				Map<String, Object> map = new HashMap<>();
				
				// 매칭 공고들 가져오기
				List<Recruit> matchingRecruitList = service2.matchingRecruit(EmploymentTest);
				
				int boardType = 3; // 채용공고 == 3
		
				List<List<Tag>> tagLists = new ArrayList<>();

				for (Recruit rec : matchingRecruitList) {
				    rec.setBoardType(boardType);
				    List<Tag> tagList = service3.tagSelects2(rec);
				    tagLists.add(tagList);
				}
				
				// 내 tagList가져오기
				String myTagList = service2.selectMyTagList(memberId);
				
				model.addAttribute("myTagList", myTagList);
				
				map.put("matching", matchingRecruitList);
				map.put("tagList", tagLists);
				
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
	public String noticeList(@SessionAttribute("loginMember") Member loginMember
							,Model model) {
		
		String memberId = loginMember.getMemberId();
		
		EmploymentTest EmploymentTest = service.selectResume(memberId);
		
		Map<String, Object> map = new HashMap<>();
		
		List<Recruit> matchingRecruitList = service2.matchingRecruit(EmploymentTest);
		
		map.put("matching", matchingRecruitList);
		
		 model.addAttribute("map", map); 
		
		return "recruit/notice-list";
	}
	
	// 상세의 상세페이지
	@GetMapping("/moreDetail")
	public String recruitDetail(@RequestParam("boardNo") int boardNo
								, Model model
								,@SessionAttribute(value="loginMember", required =false) Member loginMember) {
		
		Recruit recruit = service.moreDetail(boardNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);

		
		String logo = recruit.getCompanyLogo();
		
		if(recruit != null) {
			
			if(loginMember != null) {
				
				map.put("memberId", loginMember.getMemberId());
				
				int result = service.bookMarkCheck(map);
				if (result > 0)
					model.addAttribute("bookMarkCheck", "on");
			}
		}
		
		model.addAttribute("recruit", recruit);
		
		return "recruit/recruit-moreDetail";
	}
	
	// 채용 공고 등록 페이지로
	@GetMapping("/post")
	public String postRecruit(@SessionAttribute("loginMember") Member loginMember
						     ,Model model) {
		
		// 기업 정보 가지고 오기
		String memberId = loginMember.getMemberId();
		
		Company myCompany = service2.selectMyCompanyInfo(memberId);
		
		model.addAttribute("company", myCompany);
		
		return "recruit/recruit-post";
	}
	
	// 채용 공고 등록
	@PostMapping("/post")
	public String postRecruit(@SessionAttribute("loginMember") Member loginMember
							 ,@ModelAttribute("recruit") Recruit recruit
							 ,@RequestParam(name = "tagInputs", required = false) List<String> tags
							 ,Model model) {
		
		
		recruit.setMemberId(loginMember.getMemberId());
		
		// Recruit(boardNo=0, jobField=직무입니다, experiencePeriod=경력기간이요, workConditions=출근장소여부요, workConditionsDetail=근무조건요, selectionProcess=전형절차요, 
		// employmentType=고용형태요, employmentBenefits=복리후생이요, salaryInfo=연봉정보요, companyNo=1, companyName=null, companyLogo=null, 
		// companyAddress=null, companyIntroduce=null, companyId=null, companyMcount=0, companyCreateDt=null, boardTitle=제목입니다, boardContent=자격요건요, memberId=user01)

		int boardNo = service2.recruitInsert(recruit);
	
		if( boardNo > 0 ) { // dao에서 boardNo 담았음
			
			// 태그 삽입
			List<Tag> tagList = new ArrayList<>(); // 태그 객체를 저장할 리스트 생성
			
			if (tags != null) {
			    for (String tagName : tags) {
			        Tag tag = new Tag();
			        tag.setTagName(tagName);
			        tag.setBoardNo(boardNo);
			        tag.setBoardType(3); // 채용공고 == 3
			        tagList.add(tag);
			    }
			}
			int result = service3.tagInsert2(tagList); // 태그 삽입
		}
		 List<Recruit> recruitList = service.allRecruitList();
		 
		 model.addAttribute("recruitList", recruitList);
		 
		return "recruit/allnotice-list";
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

		        int result = service2.companyInsert(company);
		        
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
			
			return "recruit/notice-list";
		}
	
}
