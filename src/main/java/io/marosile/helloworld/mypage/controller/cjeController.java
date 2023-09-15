package io.marosile.helloworld.mypage.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.mypage.model.service.MyPageService;
import oracle.jdbc.proxy.annotation.Post;

@SessionAttributes({"loginMember"})

@RequestMapping("/mypage")
@Controller
public class cjeController {
	
	@Autowired
	private MyPageService service;
	
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
	
	// 프로필 수정(프로필 이미지, 닉네임)
	@PostMapping("/profile")
	public String profile(@RequestParam(value = "profileImg1", required = false) MultipartFile profileImg // 업로드 파일
						, @SessionAttribute("loginMember") Member loginMember // 로그인한회원
						, Member updateMember // 수정할 멤버 닉네임
						, RedirectAttributes ra
						, HttpSession session) throws IllegalStateException, IOException {
		// 웹 접근 경로
		String webPath = "/resources/images/member/";
		
		// 실제 이미지 파일 저장 경로
		String filePath = session.getServletContext().getRealPath(webPath);
		
		// 로그인한 회원 아이디를 updateMember에 추가
		updateMember.setMemberId(loginMember.getMemberId());
		
		// 서비스 호출
		int result = service.updateProfile(profileImg, webPath, filePath, loginMember, updateMember);
		
		String msg = null;
		
		if(result > 0) {
			
			msg = "수정 성공";
			
			// 닉네임 동기화
			loginMember.setMemberNick(updateMember.getMemberNick());
		}else {
			
			msg= "수정 실패";
		}
		
		ra.addFlashAttribute("msg", msg);
		
		return "redirect:profile";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 비밀번호 변경 (account 페이지)
	@PostMapping("/account")
	public String account(String currentPw, String newPw
			, RedirectAttributes ra) {
		
		String path = "redirect:";
		String message = null;
		
		return path;
	}
	
	
	
	
	
	
	

}
