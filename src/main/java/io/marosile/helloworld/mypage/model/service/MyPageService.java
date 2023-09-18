package io.marosile.helloworld.mypage.model.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import io.marosile.helloworld.member.model.dto.Member;

public interface MyPageService {

	int updateProfile(MultipartFile profileImg, String webPath, 
			String filePath, Member loginMember,
			Member updateMember) throws IllegalStateException, IOException;
	


}
