package io.marosile.helloworld.member.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor

public class Member {

    private String memberId;
    private String memberPw;
    private String memberNick;
    private String memberEmail;
    private String memberTel;
    private String profileImg;
    private String enrollDate;
    private String promotionFl;
    private String deleteFl;

    // 관리자 비교 관련
    private String authority;


    // 비밀번호 찾기에서 사용할 변수
    private String inputId;
    private String inputTel;
    private String inputEmail;

    // 관리자에서 사용할 전체 회원 수
    private int memberNum;
    // 관리자에서 사용할 회원 번호
    private int rowNum;

    // 쿠키에 담아둘 값들
    private String idSave;
    private String autoLogin;
}
