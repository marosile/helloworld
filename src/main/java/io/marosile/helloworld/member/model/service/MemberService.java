package io.marosile.helloworld.member.model.service;


import io.marosile.helloworld.member.model.dto.Member;

import java.util.HashMap;

public interface MemberService {

    /** 카카오 인증 access_Token 얻기
     * @param code
     * @return
     */
    String getAccessToken(String code) throws Throwable;

    /** 유저 정보 얻어오기
     * @param access_Token
     * @return
     */
    HashMap<String, Object> getUserInfo(String access_Token);

    /** 로그인하기
     * @param inputMember
     * @return 회원 정보
     */
    Member login(Member inputMember);

    /** 회원가입하기
     * @param inputMember
     * @return 회원가입여부
     */
    int signUp(Member inputMember);
}
