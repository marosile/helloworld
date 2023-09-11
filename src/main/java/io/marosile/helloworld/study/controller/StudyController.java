package io.marosile.helloworld.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/study")
@Controller
public class StudyController {

	// 스터디 메인 화면
	@GetMapping("/main")
	public String studyMain(Model model) {
		
		return "study/studyMain";
	}

	// 스터디 작성
	@GetMapping("/write")
	public String studyWrite(Model model) {

		return "study/studyWrite";
	}

	// 스터디 수정
	@GetMapping("/update")
	public String studyUpdate(Model model) {

		return "study/studyUpdate";
	}

	// 스터디 목록
	@GetMapping("/detail")
	public String studyDatail(Model model) {

		return "study/studyDetail";
	}

	// 스터디 체팅
	@GetMapping("/chatting")
	public String studyChatting(Model model) {

		return "study/studyChatting";
	}
}

