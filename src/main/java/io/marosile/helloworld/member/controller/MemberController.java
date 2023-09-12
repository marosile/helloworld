package io.marosile.helloworld.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/member")
@SessionAttributes("loginMember")
public class MemberController {
 
	// 회원가입 화면
	@GetMapping("/signUp")
	public String signUp() {
		return "common/modal/signUp";
	}
	
	// 아이디 찾기 화면
	@GetMapping("/findId")
	public String findId() {
		return "common/findId";
	}
	
	// 비밀번호 찾기 화면
	@GetMapping("/findPw")
	public String findPw() {
		return "common/findPw";
	}
	
	// 로그인 화면
	@GetMapping("/login")
	public String login() {
		return "common/modal/login";
	}
	
}
