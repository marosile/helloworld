package io.marosile.helloworld.member.model.service;


import io.marosile.helloworld.member.model.dto.Member;

import java.util.HashMap;
import java.util.Map;

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

    /** 아이디 중복 체크
     * @param memberId
     * @return 중복체크
     */
    int dupId(String memberId);

    /** 이메일 중복 체크
     * @param memberEmail
     * @return 중복체크
     */
    int dupEmail(String memberEmail);


    /** 이메일 중복 체크
     * @param memberTel
     * @return 중복체크
     */
    int dupTel(String memberTel);

    /** 카카오 api 로그인 진행
     * @param userInfo
     * @return 카카오 로그인
     */
    Member kakaoLogin(HashMap<String, Object> userInfo);

    /** 카카오
     * @param imgChange1
     * @return 카카오 로그인
     * */
    Member imgChange(Member imgChange1, Member loginMember);


    /** 구글 로그인
     * @param userInfo
     * @return 구글 로그인 결과
     * */
    Member googleLogin(Map<String, String> userInfo);


    /** 전화번호로 아이디 찾기
     * @param inputTel
     * @return 아이디
     * */
    String findIdTel(String inputTel);
}
