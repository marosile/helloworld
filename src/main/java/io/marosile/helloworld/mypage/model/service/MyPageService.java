package io.marosile.helloworld.mypage.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.mypage.model.dto.BookmarkList;

public interface MyPageService {

	/** 내 정보 수정(profile) (프로필 사진, 닉네임 수정)
	 * @param profileImg
	 * @param webPath
	 * @param filePath
	 * @param loginMember
	 * @param updateMember
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	int updateProfile(MultipartFile profileImg, String webPath, 
			String filePath, Member loginMember,
			Member updateMember) throws IllegalStateException, IOException;

	/** 비밀번호 변경(account)
	 * @param currentPw
	 * @param newPw
	 * @param memberId
	 * @return
	 */
	int changePw(String currentPw, String newPw, String memberId);

	/** 회원 탈퇴 (account)
	 * @param memberId
	 * @return
	 */
	int secession(String memberId);

	
	
	/** 북마크 리스트 조회 (채용공고)
	 * @return
	 */
	//List<BookmarkList> selectBookmark();
	


}
