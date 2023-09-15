package io.marosile.helloworld.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.member.model.dto.Member;

@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int updateProfile(Member loginMember, Member updateMember) {
		
		Member member = new Member();
		
		member.setProfileImg(loginMember.getProfileImg());
		member.setMemberNick(updateMember.getMemberNick());
		
		return sqlSession.update("myPageMapper.updateProfile", member);
	}

	

	

}
