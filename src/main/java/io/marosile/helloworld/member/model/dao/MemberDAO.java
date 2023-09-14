package io.marosile.helloworld.member.model.dao;

import io.marosile.helloworld.member.model.dto.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public class MemberDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;


    // 로그인 DAO
    public Member login(Member inputMember) {
        return sqlSession.selectOne("memberMapper.login", inputMember);
    }

    // 회원가입 DAO
    public int signUp(Member inputMember) {
        return sqlSession.insert("memberMapper.signUp", inputMember);
    }

    // 아이디 중복 확인 DAO
    public int dupId(String memberId) {
        return sqlSession.selectOne("memberMapper.dupId", memberId);
    }

    // 이메일 중복 확인 DAO
    public int dupEmail(String memberEmail) {
        return sqlSession.selectOne("memberMapper.dupEmail", memberEmail);
    }

    // 전화번호 중복 확인 DAO
    public int dupTel(String memberTel) {
        return sqlSession.selectOne("memberMapper.dupTel", memberTel);
    }

    // 카카오에서 받아온 정보로 로그인
    public Member kakaoLogin(String memberEmail) {
        return sqlSession.selectOne("memberMapper.kakaoLogin", memberEmail);
    }

    // 카카오에서 받아온 프로필 이미지로 변경
    public int imgChange(Member member) {
        return sqlSession.update("memberMapper.imgChange", member);
    }

}
