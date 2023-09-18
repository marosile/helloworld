package io.marosile.helloworld.member.controller;

import io.marosile.helloworld.member.model.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import java.util.Map;

@SessionAttributes({"emailAuth", "inputEmail1"})
@Controller
public class EmailController {

    @Autowired
    private EmailService service;


    @PostMapping("emailAuth")
    @ResponseBody
    public String emailAuth(@RequestBody String inputEmail1
            , Model model){

        String emailAuth = service.emailAuth(inputEmail1);

        if(emailAuth != null){
            model.addAttribute("emailAuth", emailAuth);
            model.addAttribute("inputEmail1", inputEmail1);
            return emailAuth;
        }


        return null;
    }

    @PostMapping("emailAuthCheck")
    @ResponseBody
    public int emailAuthCheck(@RequestBody Map<String, Object> emailCheck,
                              @SessionAttribute("emailAuth") String emailAuth
                              ,@SessionAttribute("inputEmail1") String inputEmail1
            , SessionStatus session) {

        System.out.println(emailCheck.get("inputEmail1"));

        if(inputEmail1.equals(emailCheck.get("inputEmail1"))){

            if(emailCheck.get("inputEmail2").equals(emailAuth)){
                session.setComplete();
                return 1;
            }

        }
        return 0;

    }


}
