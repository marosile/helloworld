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
    public String getChattingPage(Model model, @RequestParam Map<String, Object> paramMap) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardNo", paramMap.get("boardNo"));
        map.put("memberId", paramMap.get("userId"));

        Study studyDetail = service.studyDetail(map);
        return "study/studyChatting";
    }

    // 스터디 검색
    @GetMapping(value = "/chatting/selectTarget", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public List<Member> selectTarget(String query, @SessionAttribute("loginMember") Member loginMember) {
        Map<String, Object> map = new HashMap<>();
        map.put("memberId", loginMember.getMemberId());
        map.put("query", query);

        System.out.println(map);
        return service.selectTarget(map);
    }

    @PostMapping(value = "/chatting/getFollowList", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public List<Member> getFollowList(@RequestBody Map<String, Object> map) {
        String memberId = (String) map.get("memberId");
        System.out.println("채팅" + memberId);
        System.out.println("찍혀?");

        return service.getFollowList(memberId);
    }
}