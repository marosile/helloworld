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
}
