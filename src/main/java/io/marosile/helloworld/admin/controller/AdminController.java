package io.marosile.helloworld.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.marosile.helloworld.member.model.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import io.marosile.helloworld.admin.model.dto.AdminDTO;
import io.marosile.helloworld.admin.model.service.AdminService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	
	 @Autowired 
	 private AdminService service;
	
	
	// 관리자 메인 페이지 
	@GetMapping("/adminMember")
	public String adminMember(Model model
							  , @RequestParam Map<String, Object> paramMap
								) {



		System.out.println(paramMap);

		Map<String, Object> map = new HashMap<>();

		if(paramMap.get("key") == null){

			map = service.searchMemberList();



		}else { // 검색어가 있을 때(검색 O)

			map = service.selectBoardList(paramMap);

		}

		model.addAttribute("map", map);

		return "admin/adminMember";
	}

	@PostMapping(value="/adminMember/deleteMember",  produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int deleteMember(HttpServletRequest req){

		Map<String, Object> resultMap = new HashMap<String, Object>();

		// ajax를 통해 넘어온 배열 데이터 선언
		String[] memberIdList = req.getParameterValues("memberIdList");

		int result = service.deleteMember(memberIdList);

		return result;
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
	public String recruitOfficer(Model model) {

		List<AdminDTO> recruitList = service.recruitList();
		model.addAttribute("recruitList", recruitList);
		
		return "admin/recruitOfficer";
	}
	
	// 채용 담당자 관리 - 상세페이지
	@GetMapping("/recruitOfficer/detail/{userId}")
	public String recruitOfficerDetail(@PathVariable("userId") String userId) {

		AdminDTO adminDTO = service.recruitOfficerDetail(userId);
		
		return "admin/recruitOfficer-detail";
	}

}
