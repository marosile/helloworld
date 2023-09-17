package io.marosile.helloworld.study.controller;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.study.model.dto.Study;
import io.marosile.helloworld.study.model.service.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


@RequestMapping("/study")
@Controller
@SessionAttributes("loginMember")
public class StudyController {
    @Autowired
    private StudyService service;

    // 스터디 메인 화면
    @GetMapping("/main")
    public String studyMain(Model model) {

        List<Study> studyList = service.selectStudyList();


        model.addAttribute("studyList", studyList);

        return "study/studyMain";
    }

 // 스터디 상세 조회
    @GetMapping("/detail/{boardNo}")
    public String studyDatail(Model model
            , @PathVariable("boardNo") int boardNo
            , @SessionAttribute(value = "loginMember", required = false) Member loginMember
            , RedirectAttributes ra) {
    	
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("boardNo", boardNo);
		
		Study studyDetail =service.studyDetail(map);

    	System.out.println("studyDetail"+studyDetail);
    	
    	 String path = null; 
    	 
    	 if(studyDetail != null){
    		 
 /*   		 if(loginMember != null) {
    			 
    			 map.put("memberId",loginMember.getMemberId());

                 int result = service.likeCheck(map);
    		 }*/
    		 
    		 path = "study/studyDetail";
    		 model.addAttribute("studyDetail",studyDetail);
    	 }else {
    		 path="redirect:/study/main";
    		 ra.addFlashAttribute("message","해당 게시글이 존재하지 않습니다.");
    	 }
		return path;
    }



    // 스터디 게시글 삽입 (주소이동)
    @GetMapping("/write/{studyNo}")
    public String studyWrite(Model model,
                             @PathVariable("studyNo") int studyNo) {

        return "study/studyWrite";
    }


    // 스터디 게시글 삽입
    @PostMapping("/write/{studyNo}")
    public String studyWrite(@ModelAttribute Study study
            , @PathVariable("studyNo") int studyNo
            , @SessionAttribute("loginMember") Member loginMember
            , RedirectAttributes ra) {


        study.setMemberId(loginMember.getMemberId());

        int studyNumber = service.studyInsert(study);

        return "study/studyWrite";
    }

    // 스터디 수정
    @GetMapping("/update")
    public String studyUpdate(Model model) {

        return "study/studyUpdate";
    }


    // 스터디 체팅
    @GetMapping("/chatting")
    public String studyChatting(Model model) {

        return "study/studyChatting";
    }

    // 스터디 목록 수정
    @GetMapping("/detail/update")
    public String studyDetailUpdate(Model model) {

        return "study/studyDetailUpdate";
    }
}

