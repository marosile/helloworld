package io.marosile.helloworld.recruit.contorller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.recruit.model.dto.EmploymentTest;
import io.marosile.helloworld.recruit.model.service.RecruitService_OHS;


@Controller 
@SessionAttributes("loginMember")
@RequestMapping("/recruit2")
public class RecuritController2 {

	@Autowired
	private RecruitService_OHS service;
	

	@PostMapping("/testResult")
	public String test1(@ModelAttribute EmploymentTest result
					   ,@SessionAttribute("loginMember") Member loginMember){
		
		System.out.println(result);
		
		return null;
	}
	
	
}
