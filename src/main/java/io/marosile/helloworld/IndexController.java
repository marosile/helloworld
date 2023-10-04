package io.marosile.helloworld;

import io.marosile.helloworld.board.model.service.BoardService;
import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.member.model.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@SessionAttributes("loginMember")
@Controller
public class IndexController {

	// 자동로그인을 위한 service추가
	@Autowired
	private MemberService service;

	@GetMapping("/")
	public String home(HttpServletRequest request, Model model) {

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("autoLogin".equals(cookie.getName())) {
					String cookieValue = cookie.getValue();
					
					Member inputMember = new Member();
					inputMember.setMemberId(cookieValue);

					Member loginMember = new Member();

					loginMember = service.login(inputMember);

					model.addAttribute("loginMember", loginMember);
					
				}
			}
		}



		return "index";
	}

}
