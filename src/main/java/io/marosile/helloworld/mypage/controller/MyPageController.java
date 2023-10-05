package io.marosile.helloworld.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"loginMember"})
@RequestMapping("/mypage")
@Controller
public class MyPageController {

    @GetMapping("/lecture/dashboard")
    public String myPageLectureDashboard() { return "mypage/mypage-lecture-dashboard"; }

    @GetMapping("/lecture/manage")
    public String myPageLectureManagement() { return "mypage/mypage-lecture-manage"; }

}
