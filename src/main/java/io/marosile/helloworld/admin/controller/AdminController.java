package io.marosile.helloworld.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	
	// 관리자 메인 페이지 
	@GetMapping("/adminMember")
	public String adminMember() {
		
		return "admin/adminMember";
	}
	
	// 신고글 관리
	@GetMapping("/report")
	public String adminReport() {
		
		return "admin/report";
	}
	
	// 신고글 관리
	@GetMapping("/Instructor")
	public String Instructor() {
		
		return "admin/instructor";
	}
	
	// 신고글 관리 - 상세페이지
	@GetMapping("/Instructor/detail")
	public String InstructorDetail() {
		
		return "admin/instructor-detail";
	}
	
	
	// 채용 담당자 관리
	@GetMapping("/recruitOfficer")
	public String recruitOfficer() {
		
		return "admin/recruitOfficer";
	}
	
	// 채용 담당자 관리 - 상세페이지
	@GetMapping("/recruitOfficer/detail")
	public String recruitOfficerDetail() {
		
		return "admin/recruitOfficer-detail";
	}

}
