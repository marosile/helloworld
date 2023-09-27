package io.marosile.helloworld.study.controller;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.study.model.dto.ChattingRoom;
import io.marosile.helloworld.study.model.service.StudyChattingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes({"loginMember"})
public class StudyChattingController {

    @Autowired
    private StudyChattingService service;

    // 스터디 체팅 / 팔로우 목록 불러오기
    @GetMapping("study/chatting")
    public String studyChatting(Model model,@SessionAttribute ("loginMember") Member loginMember) {

        return "study/studyChatting";
    }

    // 체팅방 검색
    @GetMapping(value = "/chatting/selectTarget",produces = "application/json; charset=UTF-8")
    @ResponseBody
    public List<Member> selectTarget(String query, @SessionAttribute("loginMember")Member loginMember){

        Map<String,Integer> map = new HashMap<String,Integer>();

        return null;

    }
}
