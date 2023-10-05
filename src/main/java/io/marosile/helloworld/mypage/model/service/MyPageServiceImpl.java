package io.marosile.helloworld.mypage.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import io.marosile.helloworld.common.utility.Util;
import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.mypage.model.dao.MyPageDAO;
import io.marosile.helloworld.mypage.model.dto.BookmarkList;
import io.marosile.helloworld.mypage.model.dto.BookmarkList2;
import io.marosile.helloworld.mypage.model.dto.PostList;

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

			loginMember.setProfileImg(loginMember.getProfileImg());
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

	/** 북마크 조회 (커뮤니티)
	 *
	 */
	@Override
	public List<BookmarkList> selectBookmark(String memberId) {
		return dao.selectBookmark(memberId);
	}

	/** 북마크 조회2 (채용)
	 */
	@Override
	public List<BookmarkList2> selectBookmark2(String memberId) {
		return dao.selectBookmark2(memberId);
	}

	/** 나의 게시글 목록 조회
	 */
	@Override
	public List<PostList> selectPostList(String memberId) {
		return dao.selectPostList(memberId);
	}

	/** 좋아요 목록 조회
	 */
	@Override
	public List<PostList> selectLikeList(String memberId) {
		return dao.selectLikeList(memberId);
	}

	/** 팔로워수 조회
	 */
	@Override
	public int selectFollowerList(String memberId) {
		return dao.selectFollowerList(memberId);
	}

	/** 팔로잉수 조회
	 */
	@Override
	public int selectFollowingList(String memberId) {
	return dao.selectFollowingList(memberId);
	}

	/** 팔로잉 조회(닉넴 프사)
	 */
	@Override
	public List<BookmarkList> selectfollowing(String memberId) {
		return dao.selectfollowing(memberId);
	}

	/** 팔로우 조회
	 *
	 */
	@Override
	public List<BookmarkList> selectfollower(String memberId) {
		return dao.selectfollower(memberId);
	}

	

}
