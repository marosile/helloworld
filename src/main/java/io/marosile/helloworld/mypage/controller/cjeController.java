package io.marosile.helloworld.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import oracle.jdbc.proxy.annotation.Post;

//@SessionAttributes({"loginMember"})

@RequestMapping("/mypage")
@Controller
public class cjeController {
	
	// 마이페이지로 이동(프로필화면)
	@GetMapping("/profile")
	public String main() {
		return "mypage/mypage-profile";
	}
	// 계정관리로 이동
	@GetMapping("/account")
	public String account() {
		return "mypage/mypage-account";
	}
	// 이력서 관리 이동
	@GetMapping("/resume")
	public String resume() {
		return "mypage/mypage-resume";
	}
	// 북마크 페이지로 이동
	@GetMapping("/bookmark")
	public String bookmark() {
		return "mypage/mypage-bookmark";
	}
	// 나의 게시글
	@GetMapping("/post")
	public String post() {
		return "mypage/mypage-post";
	}
	// 좋아요
	@GetMapping("/like")
	public String like() {
		return "mypage/mypage-like";
	}
	
	
	
	// =========================================================================
	
	
	// 비밀번호 변경 (account 페이지)
	@PostMapping("/account")
	public String account(String currentPw, String newPw
			, RedirectAttributes ra) {
		
		String path = "redirect:";
		String message = null;
		
		return path;
	}
	
	
	
	
	
	
	

}
