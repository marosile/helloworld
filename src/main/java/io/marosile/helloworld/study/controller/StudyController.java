package io.marosile.helloworld.study.controller;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.study.model.dto.Study;
import io.marosile.helloworld.study.model.service.StudyService;
import io.marosile.helloworld.study.model.service.StudyServiceImpl;
import org.apache.struts.chain.commands.servlet.SetOriginalURI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SessionAttributes({"loginMember","studyDetail"})
@RequestMapping("/study")
@Controller
public class StudyController {
    @Autowired
    private StudyService service;

    // 스터디 메인 화면
    @GetMapping("/main")
    public String studyMain(Model model
            , @SessionAttribute(value = "loginMember", required = false) Member loginMember) {

        List<Study> studyList = service.selectStudyList();

        model.addAttribute("studyList", studyList);

        return "study/studyMain";
    }

    // 스터디 상세 조회
    @GetMapping("/detail/{boardNo}")
    public String studyDatail(Model model
            , @PathVariable("boardNo") int boardNo
            , @SessionAttribute(value = "loginMember", required = false) Member loginMember

            , RedirectAttributes ra
            , HttpServletRequest req
            , HttpServletResponse resp) throws ParseException {

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("boardNo", boardNo);


        Study studyDetail = service.studyDetail(map);

        System.out.println("studyDetail:"+studyDetail);


        String path = null;

        if (studyDetail != null) {

            if (loginMember != null) {

                map.put("memberId", loginMember.getMemberId());

                int result = service.likeCheck(map);


                // 좋아요 조회
                if (result > 0) {
                    model.addAttribute("likeCheck", "on");

                }
            }

            // 조회
            if (loginMember == null || loginMember.getMemberId() != studyDetail.getMemberId()) {

                Cookie c = null;

                Cookie[] cookies = req.getCookies();

                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("readBoardNo")) {
                            c = cookie;
                            break;
                        }
                    }
                }

                int result = 0;

                if (c == null) {
                    c = new Cookie("readBoardNo", "|" + boardNo + "|");

                    result = service.updateReadCount(boardNo);
                } else {

                    if (c.getValue().indexOf("|" + boardNo + "|") == -1) {
                        c.setValue(c.getValue() + "|" + boardNo + "|");
                        result = service.updateReadCount(boardNo);
                    }
                }

                if (result > 0) {
                    studyDetail.setReadCount(studyDetail.getBoardNo());

                    c.setPath("/");

                    Calendar cal = Calendar.getInstance();
                    cal.add(cal.DATE, 1);

                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                    Date a = new Date();
                    Date temp = new Date(cal.getTimeInMillis());

                    Date b = sdf.parse(sdf.format(temp));
                    long diff = (b.getTime() - a.getTime()) / 1000;

                    c.setMaxAge((int) diff);
                    resp.addCookie(c);

                }

            }
            path = "study/studyDetail";
            model.addAttribute("studyDetail", studyDetail);


        } else {
            path = "redirect:/study/main";
            ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다.");
        }

        return path;
    }

    // 좋아요 처리
    @PostMapping("/detail/like")
    @ResponseBody
    public int like(@RequestBody Map<String, Object> map) {

        return service.like(map);
    }


    // 스터디 게시글 삽입 (주소이동)
    @GetMapping("/write")
    public String studyWrite(Model model) {

        return "study/studyWrite";
    }


    // 스터디 게시글 삽입
    @PostMapping("/write")
    public String studyWrite(@ModelAttribute Study study
            , @SessionAttribute("loginMember") Member loginMember
            , @RequestParam("boardTitle") String boardTitle
            , RedirectAttributes ra) {

        study.setMemberId(loginMember.getMemberId());
        int boardNo = service.studyInsert(study);

        String path = "redirect:";
        String message = null;

        if (boardNo > 0) {
            message ="스터디 모집 작성되었습니다🎉";
            path += "/study/detail/" + boardNo;
        } else {
            message ="스터디 모집 작성이 실패 되었습니다.";
            path += "/write";
        }
        ra.addFlashAttribute("message", message);

        return path;

    }


    // 스터디 수정 페이지로
    @GetMapping("/detail/update/{boardNo}")
    public String studyUpdate(Model model
            , @PathVariable("boardNo") int boardNo) {

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("boardNo", boardNo);

        Study study = service.studyDetail(map);

        model.addAttribute("study",study);

        return "study/studyWriteUpdate";
    }

    // 게시글 수정
    @PostMapping("/detail/update/{boardNo}")
    public String StudyUpdate( @ModelAttribute Study study
            , @PathVariable("boardNo") int boardNo
            , @SessionAttribute("loginMember")Member loginMember
            , @SessionAttribute("studyDetail") Study studyDetail
            , RedirectAttributes ra
            ,@RequestHeader(value="referer") String referer) {

        study.setMemberId(loginMember.getMemberId());
        study.setStudyNo(studyDetail.getStudyNo());
        study.setCreateDate(studyDetail.getCreateDate());
        // 태그가 수정이 안됨!

        System.out.println(study);

        int result = service.studyUpdate(study);

        String path = "redirect:";
        String message = null;

        if(result > 0){
            message ="스터디 모집글이 수정되었습니다";
            path += "/study/detail/" + boardNo;
            System.out.println("성공");
        }else{
            System.out.println("실패");
            message="스터디 모집글 수정이 불가합니다 다시 시도 부탁 드립니다.";
            path += referer;
        }
        ra.addFlashAttribute("message",message);
        return path;
    }


    // 스터디 삭제
    @GetMapping("/detail/{boardNo}/delete")
    public String studyDelete(Model model
            , @PathVariable("boardNo") int boardNo
            , RedirectAttributes ra) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("boardNo", boardNo);

        int result = service.studyDelete(map);

        String path = "redirect:";
        String message = null;

        if (result > 0) {
            message = "삭제되었습니다.";
            path += "/study/main";
        } else {
            message = "삭제 실패";
            path += "/study/detail/" + boardNo;
        }
        ra.addFlashAttribute("message", message);

        return path;
    }

    // 스터디 체팅
    @GetMapping("/chatting")
    public String studyChatting(Model model) {

        return "study/studyChatting";
    }

    // 모집완료처리
    @PostMapping("/detail/completed")
    @ResponseBody
    public int completed(@RequestBody Map<String,Object> map){
        return service.complete(map);
    }

}
