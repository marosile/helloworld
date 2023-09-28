package io.marosile.helloworld.study.controller;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.study.model.dto.Study;
import io.marosile.helloworld.study.model.service.StudyChattingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/study")
public class StudyChattingController {

    @Autowired
    private StudyChattingService service;

    // 스터디 채팅
    @GetMapping("/chatting/{boardNo}")
    public String studyChatting(Model model,@SessionAttribute(value = "loginMember", required = false) Member loginMember
                                ,@PathVariable("boardNo") int boardNo) {

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("boardNo", boardNo);
        map.put("memberId", loginMember.getMemberId());

        Study studyDetail = service.studyDetail(map);

        model.addAttribute("studyDetail", studyDetail);

        return "study/studyChatting";
    }

    // 팔로우검색
    @PostMapping ("/chatting/getFollowing")
    @ResponseBody
    public List<Study> selectTarget(@RequestParam("memberId") String memberId,Model model){

        System.out.println(memberId);

        List<Study> followingList = service.selectTarget(memberId);
        model.addAttribute("followingList",followingList);
        System.out.println(followingList);

        return followingList;

    }
}
