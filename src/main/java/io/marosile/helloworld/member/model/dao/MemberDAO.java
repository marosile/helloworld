package io.marosile.helloworld.member.model.dao;

import io.marosile.helloworld.member.model.dto.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
        System.out.println("dao : " + memberId);
        return sqlSession.selectOne("memberMapper.dupId", memberId);
    }
}
