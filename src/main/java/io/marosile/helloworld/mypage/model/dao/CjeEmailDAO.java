
package io.marosile.helloworld.mypage.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate; import
org.springframework.beans.factory.annotation.Autowired; import
org.springframework.stereotype.Repository;

import io.marosile.helloworld.member.model.dto.Member;

@Repository 
public class CjeEmailDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int updateEmail(String memberEmail, String memberId) {
		
		Member member = new Member();
		
		member.setMemberEmail(memberEmail);
		member.setMemberId(memberId);
		
		return sqlSession.update("myPageMapper.updateEmail", member);
		
	}


}
