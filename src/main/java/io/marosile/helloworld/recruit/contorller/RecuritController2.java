package io.marosile.helloworld.recruit.contorller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.recruit.model.dto.EmploymentTest;
import io.marosile.helloworld.recruit.model.dto.Recruit;
import io.marosile.helloworld.recruit.model.service.RecruitService_OHS;


@Controller 
@SessionAttributes("loginMember")
@RequestMapping("/recruit2")
public class RecuritController2 {

	@Autowired
	private RecruitService_OHS service;
	

	// 채용공고 결과
	@PostMapping("/testResult")
	public String test1(@ModelAttribute EmploymentTest EmploymentTest
					   ,@SessionAttribute("loginMember") Member loginMember
					   ,Model model){

		EmploymentTest.setMemberId(loginMember.getMemberId());
		
		String question6String = String.join(", ", EmploymentTest.getQuestion6()); // RESUME DB에 사용가능한 기술 문자열로 넣기

		// 변환된 문자열을 다시 "question6" 필드에 설정
		EmploymentTest.setQuestion6ToString(question6String);
		
		int result = service.insertMyResult(EmploymentTest); // RESUME에 삽입
		
		// EmploymentTest(memberId=null, question1=프론트엔드 개발자, question2=, question3=7000, question4=사무실 출근, question5=서울 성동, 
		// question6=[JAVA, Spring, Visual studio Code, JavaScript, Oracle, JQuery], question6ToString=null) 
		Map<String, Object> map = new HashMap<>();
		
		List<Recruit> matchingRecruitList = service.matchingRecruit(EmploymentTest);
		
		map.put("matching", matchingRecruitList);
		
		model.addAttribute("map", map);
		
		
		 // 비교 조회해서 LIST에담아서 JSP로 가져가야함
		
		 // 채용공고 비교 조회했을때 tag들 담아와서 내 question6=[JAVA, Spring, Visual studio Code, JavaScript, Oracle, JQuery] 와 밑에 return한 jsp 비교
		return "recruit/employment-resultAndRecruitDetail";
		
	}
	
}

