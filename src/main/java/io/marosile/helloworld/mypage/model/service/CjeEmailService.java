
package io.marosile.helloworld.mypage.model.service;

import java.util.Map;

import io.marosile.helloworld.member.model.dto.Member;

public interface CjeEmailService {
	

	String myPageEmailAuth(String memberEmail);
	
	String myPageEmailAuthCheck();

	int updateEmail(String memberEmail, String memberId);


}
