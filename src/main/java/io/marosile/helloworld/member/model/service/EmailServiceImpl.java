package io.marosile.helloworld.member.model.service;

import io.marosile.helloworld.member.model.dao.EmailDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.Map;

@Service
public class EmailServiceImpl implements  EmailService{

    @Autowired
    private EmailDAO dao;

    @Autowired
    private JavaMailSender mailSender;

    private String fromEmail = "lys8845@gmail.com";
    private String fromUsername = "파이널프로젝트";



    /* 인증키 생성 */
    @Override
    public String emailAuthKey() {
        String key = "";
        for(int i=0 ; i< 6 ; i++) {

            int sel1 = (int)(Math.random() * 3); // 0:숫자 / 1,2:영어

            if(sel1 == 0) {

                int num = (int)(Math.random() * 10); // 0~9
                key += num;

            }else {

                char ch = (char)(Math.random() * 26 + 65); // A~Z

                int sel2 = (int)(Math.random() * 2); // 0:소문자 / 1:대문자

                if(sel2 == 0) {
                    ch = (char)(ch + ('a' - 'A')); // 소문자로 변경
                }

                key += ch;
            }

        }
        return key;
    }


    @Transactional
    @Override
    public String emailAuth(String inputEmail1) {
    //6자리 난수 인증번호 생성
        String authKey = emailAuthKey();
        try {


            //인증메일 보내기
            MimeMessage mail = mailSender.createMimeMessage();

            // 제목
            String subject = "[Final Project]"+"(Hello World)"+" 인증코드";

            // 문자 인코딩
            String charset = "UTF-8";

            // 메일 내용
            String mailContent
                    = "<p>Final Project "+"(Hello World)"+" 인증코드입니다.</p>"
                    + "<h3 style='color:blue'>" + authKey + "</h3>";


            System.out.println(fromEmail);
            System.out.println(fromUsername);

            // 송신자(보내는 사람) 지정
            mail.setFrom(new InternetAddress(fromEmail, fromUsername));
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(inputEmail1));

            // 수신자(받는사람) 지정

            // 이메일 제목 세팅
            mail.setSubject(subject, charset);

            // 내용 세팅
            mail.setText(mailContent, charset, "html"); //"html" 추가 시 HTML 태그가 해석됨

            mailSender.send(mail);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }


        return authKey;
    }



}
