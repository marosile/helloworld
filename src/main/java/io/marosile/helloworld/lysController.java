package io.marosile.helloworld;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import io.marosile.helloworld.common.utility.Util;
import io.marosile.helloworld.service.lysService;


@SessionAttributes("rand")
@Controller
public class lysController {

	@Autowired
	private lysService service;

	// 회원가입
	@GetMapping("/signUp")
	public String signUp() {
		return "common/modal/signUp";
	}
	
	@GetMapping("/findId")
	public String findId() {
		return "common/findId";
	}
	
	@GetMapping("/findPw")
	public String findPw() {
		return "common/findPw";
	}
	
	@GetMapping("/login")
	public String login() {
		return "common/modal/login";
	}

	
	// 휴대폰 인증
	@PostMapping("phoneAuth")
	@ResponseBody
	public String phoneAuth(@RequestBody Map<String, Object> inputTel1
						, Model model) {
		
		String rand = null;
		try {
			String tel = inputTel1.get("inputTel1").toString();
			
			rand = Util.sendRandomMessage(tel);
			
			model.addAttribute("rand", rand);
			
			Util util = new Util();
			util.sendMessage(tel, rand);
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return rand;
		
	}
	
	
	
	@PostMapping("phoneAuthCheck")
	@ResponseBody
	public int phoneAuthCheck(@RequestBody Map<String, Object> inputTel2,
					@SessionAttribute("rand") String rand
					, SessionStatus session) {
		
		String randCheck = inputTel2.get("inputTel2").toString();
		
		System.out.println(randCheck);
		
		if(rand.equals(randCheck)) {
			session.setComplete();
			return 1;
		}else {
			return 0;
		}
		
	}
	
	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	@RequestMapping(value = "/login/kakao", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {

		// 1번
		System.out.println("code:" + code);
		// return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음
		
		// 2번
		String access_Token = service.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
		// 2번 받은 code를 service.getAccessToken로 보냄 ###access_Token###로 찍어서 잘 나오면은 다음단계진행
		
		// 3번
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		System.out.println("카카오닉네임 : " + userInfo.get("nickname"));
		System.out.println("카카오이메일 : " + userInfo.get("email"));
		System.out.println("프로필사진 :" + userInfo.get("profileImage"));
		System.out.println("썸네일사진 :" + userInfo.get("thumbnailImage"));
		// 3번 받은 access_Token를 iKakaoS.getUserInfo로 보냄 userInfo받아옴, userInfo에 nickname, email정보가 담겨있음
		
		return "redirect:/";	
	}
	
	

}
