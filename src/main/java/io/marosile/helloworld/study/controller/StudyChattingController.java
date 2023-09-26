package io.marosile.helloworld.study.controller;

import io.marosile.helloworld.member.model.dto.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@SessionAttributes({"loginMember"})
public class StudyChattingController {

    // 스터디 체팅
    @GetMapping("study/chatting")
    public String studyChatting(Model model
            , @SessionAttribute("loginMember") Member loginMember) {



        return "study/studyChatting";
    }
}
