
package io.marosile.helloworld.mypage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired; import
org.springframework.stereotype.Controller; import
org.springframework.web.bind.annotation.GetMapping; import
org.springframework.web.bind.annotation.RequestMapping; import
org.springframework.web.bind.annotation.RequestParam; import
org.springframework.web.bind.annotation.ResponseBody; import
org.springframework.web.bind.annotation.SessionAttributes;

import io.marosile.helloworld.mypage.model.service.CjeEmailService;

@Controller

@RequestMapping("/sendEmail")

@SessionAttributes("authKey") 
public class CjeEmailController {

	@Autowired 
	private CjeEmailService service;

	@GetMapping("/account")
	@ResponseBody 
	public int account(String email) { 
		return service.account(email, "회원 정보 수정"); 
	}

	@GetMapping("/checkAuthKey")

	@ResponseBody 
	public int checkAuthKey(@RequestParam Map<String, Object> paramMap){


		System.out.println(paramMap); // {inputKey=wc3rxG, email=knbdh@nate.com}

		return service.checkAuthKey(paramMap); }

}
