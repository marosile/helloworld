package io.marosile.helloworld.member.model.dao;

import io.marosile.helloworld.member.model.dto.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Member snsLogin(String memberEmail) {
        return sqlSession.selectOne("memberMapper.snsLogin", memberEmail);
    }

    // 카카오에서 받아온 프로필 이미지로 변경
    public int imgChange(Member member) {
        return sqlSession.update("memberMapper.imgChange", member);
    }

    // 전화번호로 아이디 찾기
    public String findIdTel(String inputTel) {

        return sqlSession.selectOne("memberMapper.findIdTel", inputTel);
    }


    // 이메일로 아이디 찾기
    public String findIdEmail(String inputEmail) {
        return sqlSession.selectOne("memberMapper.findIdEmail", inputEmail);
    }

    // 전화번호로 비밀번호 찾기
    public int findPwTel(Map<String, Object> findPwTel) {

        Member member = new Member();
        member.setInputId(String.valueOf(findPwTel.get("inputId1")));
        member.setInputTel(String.valueOf(findPwTel.get("inputTel1")));



        return sqlSession.selectOne("memberMapper.findPwTel", member);
    }

    // 이메일로 비밀번호 찾기
    public int findPwEmail(Map<String, Object> findPwEmail) {
        Member member = new Member();
        member.setInputId(String.valueOf(findPwEmail.get("inputId2")));
        member.setInputEmail(String.valueOf(findPwEmail.get("inputEmail1")));

        System.out.println("member = " + member);

        return sqlSession.selectOne("memberMapper.findPwEmail", member);
    }

    // 새 비밀번호로 변경
    public int newPwChange(Member member) {
        return sqlSession.update("memberMapper.newPwChange", member);
    }


    public Member getMemberById(String memberId) { return sqlSession.selectOne("memberMapper.getMemberById", memberId); }

    public List<Member> selectFollowerList(Map<String, Object> param) {
        return sqlSession.selectList("memberMapper.selectFollowerList", param);
    }

    public List<Member> selectFollowingList(Map<String, Object> param) {
        return sqlSession.selectList("memberMapper.selectFollowingList", param);
    }

    public List<Member> selectF4fList(String memberId) {
        return sqlSession.selectList("memberMapper.selectF4fList", memberId);
    }
}
