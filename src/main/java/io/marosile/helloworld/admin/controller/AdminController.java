package io.marosile.helloworld.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.marosile.helloworld.common.utility.Util;
import io.marosile.helloworld.member.model.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import io.marosile.helloworld.admin.model.dto.AdminDTO;
import io.marosile.helloworld.admin.model.service.AdminService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String recruitOfficerDetail(@PathVariable("userId") String userId
										, Model model
	) {

		AdminDTO recruitOfficerDetail = service.recruitOfficerDetail(userId);

		model.addAttribute("recruitOfficerDetail",recruitOfficerDetail);
		
		return "admin/recruitOfficer-detail";
	}

	@GetMapping("/recruitOfficer/detail/update")
	public String recruitOfficerUpdate(@ModelAttribute AdminDTO cmpnInfo
										, RedirectAttributes ra){
		System.out.println("왜???안대??");
		System.out.println("dd::" + cmpnInfo);

		/* N -> Y 로 업데이트 실행*/
		int result = service.recruitOfficerUpdate(cmpnInfo);

		String path = "redirect:";

		if(result > 0){
			result = service.recruitOfficerInsert(cmpnInfo);

			if(result > 0){
				path += "/admin/recruitOfficer";
				ra.addFlashAttribute("message", "기업 담당자 등록에 성공하셨습니다.");
				System.out.println("성공");

				Util util = new Util();
				try {
					util.adminSendMessage(cmpnInfo.getUserTel(), "축하드립니다! \n기업 담당자로 등록되셨습니다.\n");
				}catch (Exception e){
					e.printStackTrace();
				}
			}
		}

		
		return path;
	}

	// 현재 회원 등록 해지시키기
	@GetMapping("/recruitOfficer/detail/delete")
	public String recruitOfficerDelete(@ModelAttribute AdminDTO cmpnInfo
										, RedirectAttributes ra){
		System.out.println("삭제하는거 되라아아아아아아아아아아아");
		System.out.println("dd::" + cmpnInfo);

		/* N -> Y 로 업데이트 실행
		* 해봤는데 삭제 시키는 것이 좋을 것이라고 판단, 삭제로 전환
		* */
		int result = service.recruitOfficerDelete(cmpnInfo);

		String path = "redirect:";

		if(result > 0){
			result = service.recruitOfficerDelete2(cmpnInfo);

			if(result > 0){
				path += "/admin/recruitOfficerCurr";
				ra.addFlashAttribute("message", "담당자가 해지되었습니다.");
				System.out.println("삭제 성공");

				Util util = new Util();
				try {
					util.adminSendMessage(cmpnInfo.getUserTel(), "기업 담당자에서 해지되었습니다. 등록을 원하시면 재신청 해주세요.");
				}catch (Exception e){
					e.printStackTrace();
				}
			}
		}


		return path;
	}


	@GetMapping("/recruitOfficerCurr")
	public String recruitOfficerCurr(Model model) {

		List<AdminDTO> recruitListCurr = service.recruitListCurr();
		model.addAttribute("recruitListCurr", recruitListCurr);

		return "admin/recruitOfficerCurr";
	}

	/*반려(컴퍼니 테이블에서 삭제만 시켜주면 됨)*/
	@GetMapping("/recruitCancel/{userId}")
	public String recruitCancel(@PathVariable("userId") String userId
			, RedirectAttributes ra){
		System.out.println("반려..되나..?");
		System.out.println("dd::" + userId);

		/* N -> Y 로 업데이트 실행
		 * 해봤는데 삭제 시키는 것이 좋을 것이라고 판단, 삭제로 전환
		 * */
		int result = service.recruitCancel(userId);

		String path = "redirect:";

		if(result > 0){

			String userTel = service.findUserTel(userId);

			path += "/admin/recruitOfficer";
			ra.addFlashAttribute("message", "담당자 자격 반려되었습니다.");
			System.out.println("반려(삭제) 성공");

			Util util = new Util();
			try {
				util.adminSendMessage(userTel, "기업 담당자 신청이 반려 되었습니다. 등록을 원하시면 재신청 해주세요");
			}catch (Exception e){
				e.printStackTrace();
			}

		}

		return path;
	}

}
