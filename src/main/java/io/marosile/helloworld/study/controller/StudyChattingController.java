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
    @GetMapping("/chatting")
    public String getChattingPage(@RequestParam("boardNo") int boardNo, @RequestParam("memberId") String memberId, Model model) {

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("boardNo", boardNo);
        map.put("memberId", memberId);

        Study studyDetail = service.studyDetail(map);

        model.addAttribute("studyDetail", studyDetail);

        return "study/studyChatting";
    }


    @GetMapping(value = "/chatting/getFollowList",produces="application/json; charset=UTF-8")
    @ResponseBody
    public List<Member> getFollowList(@RequestBody Map<String, Object> map) {

        String memberId = (String) map.get("memberId");
        System.out.println(memberId);
        List<Member> followList = service.getFollowList(memberId);

        return followList;
    }

}
