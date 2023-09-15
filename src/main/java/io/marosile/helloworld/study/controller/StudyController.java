package io.marosile.helloworld.study.controller;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.study.model.dto.Study;
import io.marosile.helloworld.study.model.service.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;



@RequestMapping("/study")
@Controller
@SessionAttributes("loginMember")
public class StudyController {
	@Autowired
	private StudyService service;

	// 스터디 메인 화면
	@GetMapping("/main")
	public String studyMain(Model model) {

		List<Study> studyList = service.selectStudyList();

		System.out.println(studyList);

		model.addAttribute("studyList",studyList);
		
		return "study/studyMain";
	}

	// 스터디 상세 조회 (작성하고 하자)
	@GetMapping("/detail/{studyNo}")
	public String studyDatail(Model model
			, @PathVariable("studyNo") int studyNo) {

		List<Study> study = service.selectStudy(studyNo);

		return "study/studyDetail";
	}

	// 스터디 작성(화면전환)
	@GetMapping("/write/{studyNo}")
	public String studyWrite(Model model,
							@PathVariable("studyNo")int studyNo) {

		return "study/studyWrite";
	}


	// 스터디 게시글 삽입
	@PostMapping ("/write/{studyNo}")
	public String studyWrite(@ModelAttribute Study study
							 ,@RequestParam(value = "tagNm" ,required = false) String selectBox
			                , @PathVariable("studyNo")int studyNo
							, @SessionAttribute("loginMember") Member loginMember) {



		study.setMemberId(loginMember.getMemberId());

		int studyNumber = service.studyInsert(study);

		return "study/studyWrite";
	}

	// 스터디 수정
	@GetMapping("/update")
	public String studyUpdate(Model model) {

		return "study/studyUpdate";
	}


	// 스터디 체팅
	@GetMapping("/chatting")
	public String studyChatting(Model model) {

		return "study/studyChatting";
	}

	// 스터디 목록 수정
	@GetMapping("/detail/update")
	public String studyDetailUpdate(Model model) {

		return "study/studyDetailUpdate";
	}
}

