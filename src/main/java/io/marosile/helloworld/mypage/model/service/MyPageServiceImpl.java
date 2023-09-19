package io.marosile.helloworld.mypage.model.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import io.marosile.helloworld.common.utility.Util;
import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.mypage.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	/** 내정보 수정 (프사, 닉네임 변경)
	 */
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateProfile(MultipartFile profileImg, String webPath, String filePath, Member loginMember,
			Member updateMember) throws IllegalStateException, IOException {
		
		String temp = loginMember.getProfileImg(); // 이전 이미지 저장
		
		String rename = null;
		
		if(profileImg.getSize()>0) {
			rename = Util.fileRename(profileImg.getOriginalFilename());
			
			loginMember.setProfileImg(webPath + rename);
			
		}else {
			loginMember.setProfileImg(null);
		}
		
		int result = dao.updateProfile(loginMember, updateMember);
		
		if(result > 0) {
			
			if(rename != null) {
				profileImg.transferTo(new File(filePath + rename));
			}
		}else {
			loginMember.setProfileImg(temp);
		}
		
		return result;
	}

	/** 비밀번호 변경(account)
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int changePw(String currentPw, String newPw, String memberId) {
		
		String encPw = dao.selectEncPw(memberId);
		
		if(bcrypt.matches(currentPw, encPw)) {
			
			return dao.changePw(bcrypt.encode(newPw), memberId);
		}
		
		return 0;
	}

	/** 회원 탈퇴 (account)
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int secession(String memberId) {
		
		int result = dao.secession(memberId);
		
		return result;
	}

	

}
