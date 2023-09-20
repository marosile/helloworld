package io.marosile.helloworld.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.marosile.helloworld.admin.model.dto.AdminDTO;
import io.marosile.helloworld.admin.model.service.AdminService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	
	 @Autowired 
	 private AdminService service;
	
	
	// 관리자 메인 페이지 
	@GetMapping("/adminMember")
	public String adminMember() {
		
		return "admin/adminMember";
	}
	
	
	
	// 신고글 관리
	@GetMapping("/report")
	public String adminReport(Model model) {
		
		List<AdminDTO> reportList = service.adminReport();
		
		model.addAttribute("reportList", reportList);

		return "admin/report";
	}
	
	
	
	// 강사 관리
	@GetMapping("/Instructor")
	public String Instructor() {
		
		return "admin/instructor";
	}
	
	// 강사 관리 - 상세페이지
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
