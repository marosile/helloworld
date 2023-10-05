package io.marosile.helloworld.mypage.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.mypage.model.dto.BookmarkList;
import io.marosile.helloworld.mypage.model.dto.BookmarkList2;
import io.marosile.helloworld.mypage.model.dto.PostList;

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

	
	/** 북마크 리스트 조회 (커뮤니티)
	 * @return
	 */
	List<BookmarkList> selectBookmark(String memberId);

	
	/** 북마크 리스트 조회(채용공고)
	 * @param memberId
	 * @return
	 */
	List<BookmarkList2> selectBookmark2(String memberId);

	/** 나의 게시글 목록 조회
	 * @param memberId
	 * @return
	 */
	List<PostList> selectPostList(String memberId);

	/** 좋아요 목록 조회
	 * @param memberId
	 * @return
	 */
	List<PostList> selectLikeList(String memberId);

	/** 팔로워ㅏ 조회
	 * @param memberId
	 * @return
	 */
	int selectFollowerList(String memberId);

	/** 팔로잉 조회
	 * @param memberId
	 * @return
	 */
	int selectFollowingList(String memberId);
	


}
