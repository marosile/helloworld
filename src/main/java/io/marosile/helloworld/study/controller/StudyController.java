package io.marosile.helloworld.study.controller;

import io.marosile.helloworld.study.model.dto.Study;
import io.marosile.helloworld.study.model.service.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;



@RequestMapping("/study")
@Controller
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




	// 스터디 작성
	@GetMapping("/write/{studyNo}")
	public String studyWrite(Model model) {

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

