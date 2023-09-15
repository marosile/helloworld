package io.marosile.helloworld.member.controller;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.member.model.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

@Controller
@RequestMapping("/member")
@SessionAttributes("loginMember")
public class MemberController {

	@Autowired
	private MemberService service;
 
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


	
	// 로그인 실행 컨트롤러
	@PostMapping("/login")
	public String login(Member inputMember
						, Model model
						, @RequestHeader(value="referer") String referer
						, @RequestParam(value="idSave", required = false) String idSave
						, HttpServletResponse resp
						){

		Member loginMember = service.login(inputMember);
		System.out.println("referer = " +referer);

		String path = "redirect:";

		if(loginMember != null){ // 성공시

			System.out.println("로그인 성공");
			// 메인페이지 이동
			path += "/";

			model.addAttribute("loginMember", loginMember);

			// 쿠키를 이용한 아이디 저장
			Cookie cookie = new Cookie("idSave", loginMember.getMemberId());

			if(idSave != null){
				// 한달동안 유지되는 쿠키 생성
				cookie.setMaxAge(60 * 60 * 24 * 30);
			} else{
				cookie.setMaxAge(0);
			}
			
			// 클라이언트가 어떤 요청을 할 때 쿠키가 첨부될 지 확인
			cookie.setPath("/");

			resp.addCookie(cookie);

		}else{
			System.out.println("로그인 실패");
			path += referer;

		}

		return path;
	}

	// 로그아웃 실행 컨트롤러
	@GetMapping("/logout")
	public String logout(SessionStatus status){

		status.setComplete();

		return "redirect:/";
	}



	// 회원 가입 실행 컨트롤러
	@PostMapping("/signUp")
	public String signUp(Member inputMember
						, @RequestParam(value="promotionFl") String promotionFl
						){

		// 마케팅동의 담아주기
		inputMember.setPromotionFl(promotionFl);

		System.out.println(promotionFl);
		System.out.println(inputMember.getPromotionFl());

		int result = service.signUp(inputMember);

		String path = "redirect:";

		if(result > 0){ //성공
			System.out.println("회원가입 성공!");
			path += "/";

		}else{
			System.out.println("회원가입 실패!");
			path += "signUp";
		}

		return path;
	}


	// 아이디 중복 검사
	@GetMapping ("/signUp/dupId")
	@ResponseBody
	public int dupId(String memberId){
		return service.dupId(memberId);
	}

	// 이메일 중복 검사
	@GetMapping("/signUp/dupEmail")
	@ResponseBody
	public int dupEmail(String memberEmail){
		return service.dupEmail(memberEmail);
	}

	// 전화번호 중복 검사
	@GetMapping("/signUp/dupTel")
	@ResponseBody
	public int dupTel(String memberTel){
		return service.dupTel(memberTel);
	}
	


	
	// 카카오 api 정보 얻어오기
	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	@RequestMapping(value = "/login/kakao", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code
//							, @RequestHeader(value="referer") String referer
							, Model model) throws Throwable {

		// 1번
		System.out.println("code:" + code);
		// return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음

		// 2번
		String access_Token = service.getAccessToken(code);
		System.out.println("access_Token : " + access_Token);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
		// 2번 받은 code를 service.getAccessToken로 보냄 ###access_Token###로 찍어서 잘 나오면은 다음단계진행

		// 3번
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		System.out.println("카카오닉네임 : " + userInfo.get("nickname"));
		System.out.println("카카오이메일 : " + userInfo.get("email"));
		System.out.println("프로필사진 :" + userInfo.get("profileImage"));
		System.out.println("썸네일사진 :" + userInfo.get("thumbnailImage"));
		// 3번 받은 access_Token를 iKakaoS.getUserInfo로 보냄 userInfo받아옴, userInfo에 nickname, email정보가 담겨있음


		// 4번 DB와 이메일 비교해서 회원가입된 이메일과 같은지 확인(이미 있는 이메일 중복 체크 이용)
		String memberEmail = String.valueOf(userInfo.get("email"));
		int searchEmail = service.dupEmail(memberEmail);

		// 로그인 및 프로필 사진 변경 진행

		String path = "redirect:";

		if(searchEmail == 0) { // 가입되어있는 이메일이 없을때
			System.out.println("가입되어있는 이메일이 없어서 회원가입 화면으로 이동");
			// alert창 띄워서 설명해주고 싶은데 이야기 다시 해봐야 할듯 ~
			path += "/member/signUp";
		}else {
			Member loginMember = service.kakaoLogin(userInfo);

			Member imgChange1 = new Member();


			if (loginMember != null) {

				imgChange1.setMemberEmail(String.valueOf(userInfo.get("email")));
				imgChange1.setProfileImg(String.valueOf(userInfo.get("profileImage")));

				Member imgChange = service.imgChange(imgChange1, loginMember);
				loginMember.setProfileImg(imgChange.getProfileImg());

				System.out.println("로그인 성공");
				// 메인페이지 이동
				path += "/";

				model.addAttribute("loginMember", loginMember);


			} else {
				System.out.println("로그인 실패");
				path += "/";

			}
		}


		return path;
	}

	// 구글 로그인 컨트롤러
	@RequestMapping("/login/googleForm")
	public String loginPage(Model model) {

		// 구글 로그인 URL 생성
		String googleUrl = "https://accounts.google.com/o/oauth2/v2/auth?"
				+ "client_id=" + "829784621579-9i247enb310blhhajovb5u9ggnfiglja.apps.googleusercontent.com"
				+ "&redirect_uri=" + "http://localhost/member/login/google"
				+ "&response_type=code"
				+ "&scope=" + "email%20profile%20openid"
				+ "&access_type=offline";

		model.addAttribute("googleUrl", googleUrl);

		return "login";

	}







}
