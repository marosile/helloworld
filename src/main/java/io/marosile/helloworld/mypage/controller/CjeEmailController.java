
package io.marosile.helloworld.mypage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired; import
org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import
org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import
org.springframework.web.bind.annotation.RequestMapping; import
org.springframework.web.bind.annotation.RequestParam; import
org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import
org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.mypage.model.service.CjeEmailService;

@SessionAttributes({"emailAuth", "memberEmail", "loginMember"})
@Controller
public class CjeEmailController {

	@Autowired 
	private CjeEmailService service;
	
	// ==================== 이메일 변경하기 ========================


	// 인증 번호 보내기
	@PostMapping("myPageEmailAuth")
	@ResponseBody 
	public String myPageEmailAuth(@RequestBody String memberEmail
			, Model model) {

		// 인증키 서비스 호출
		String emailAuth = service.myPageEmailAuth(memberEmail);

		if(emailAuth != null) {
			model.addAttribute("emailAuth",emailAuth);
			model.addAttribute("memberEmail", memberEmail);
			return emailAuth;

		}

		return null;

	}



	// 인증번호가 일치하는지 확인하기
	@PostMapping("myPageEmailAuthCheck")
	@ResponseBody 
	public int myPageEmailAuthCheck(@RequestBody Map<String, Object> data, // 전달할 파라미터 -> 내가 입력한 이메일과 인증키
			@SessionAttribute("emailAuth") String emailAuth // 실제 인증키
			,@SessionAttribute("memberEmail") String memberEmail // 입력한 이메일?
			, @SessionAttribute("loginMember") Member loginMember // 로그인한 회원
			, Member updateEmail // 수정할 이메일
			, SessionStatus session
			, RedirectAttributes ra
			, Model model){
		
		//System.out.println("====================이메일 확인=================");
		//System.out.println(memberEmail + "//얜 무슨이멜?"); // 내가 입력한 이메일
		//System.out.println(emailAuth + "++ 이건뭐"); // 실제로 날아간 인증키
		//System.out.println(loginMember + "..얜 뭐야"); // 로그인한 회원의 정보 전부
		//System.out.println(updateEmail + "**이건뭐고"); // 아무것도 안 담겨있는 객체 (바뀐 정보를 담을 통 같은건가)
		//System.out.println(data + "==맵에 담겨온게 뭐지"); // 내가 입력한 이메일, 인증키가 들어있다
		//System.out.println(data.get("memberEmail") + "::바꿀 이메일"); // 내가 입력한 이메일
		//System.out.println(data.get("authKey") + ":::인증키"); // 내가 입력한 인증키
		
		// 로그인한 회원 아이디 updateEmail에 추가
		String memberId = loginMember.getMemberId();
		
		String message = null;
		String path = "redirect:";
		

		if(memberEmail.equals(data.get("memberEmail"))) {
			// 내가 입력한 이메일과 전달받은파라미터에서 얻은 이메일과 같을때 이게 뭔말임

			
			if(data.get("authKey").equals(emailAuth)) {
				// 얻어온 파라미터에서 가져온 authKey와 내가 입력한 인증키가 같을 때? 당연히 같을수밖에 없지않니?
				
				model.addAttribute("authKey", "");
				// 세션에 남아있는 인증키 지워주고
				
				int result = service.updateEmail(memberEmail, memberId);
				// 이메일 업데이트 하는 서비스 호출
				
				if(result > 0) {
					// result가 0이상이면 성공한거니까 되야하는데 왜 0이야
					message = "이메일 변경 성공";
					System.out.println(message + "if문 msg입니다");
					
					path += "/";
					
				}else {
					// result 가 0이하면 실패라고 떠야하는데 왜!! 실패했다고 안떠!
					message = "이메일 변경 실패";
					
					System.out.println(message + "else문 msg입니다?");
				}
				ra.addFlashAttribute("message", message);
				
				System.out.println(message + ":::::또시작이니?");				
				return result;
				
			}
		}

		return 0;

	}

}
