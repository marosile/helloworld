package io.marosile.helloworld;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

//@SessionAttributes({"loginMember"})

@RequestMapping("/mypage")
@Controller
public class cjeController {
	
	// 마이페이지로 이동(프로필화면)
	@GetMapping("/main")
	public String main() {
		return "mypage/mypage-main";
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
	
	
	
	

}
