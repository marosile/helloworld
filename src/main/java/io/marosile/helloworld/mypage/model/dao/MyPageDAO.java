package io.marosile.helloworld.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.mypage.model.dto.BookmarkList;
import io.marosile.helloworld.mypage.model.dto.BookmarkList2;
import io.marosile.helloworld.mypage.model.dto.PostList;

@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 내정보 수정 (profile) (프로필 사진, 닉네임)
	 * @param loginMember
	 * @param updateMember
	 * @return
	 */
	public int updateProfile(Member loginMember, Member updateMember) {
		
		Member member = new Member();
		
		member.setProfileImg(loginMember.getProfileImg());
		member.setMemberNick(updateMember.getMemberNick());
		member.setMemberId(updateMember.getMemberId());
		
		return sqlSession.update("myPageMapper.updateProfile", member);
	}

	/** 비밀번호변경(조회)(account)
	 * @param memberId
	 * @return
	 */
	public String selectEncPw(String memberId) {
		return sqlSession.selectOne("myPageMapper.selectEncPw", memberId);
	}

	/** 비밀번호 변경(account)
	 * @param encode
	 * @param memberId
	 * @return
	 */
	public int changePw(String newPw, String memberId) {
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(newPw);
		
		return sqlSession.update("myPageMapper.changePw", member);
	}

	/** 회원탈퇴(account)
	 * @param memberId
	 */
	public int secession(String memberId) {
		
		return sqlSession.update("myPageMapper.secession", memberId);
	}

	/** 북마크 리스트 조회(커뮤니티)
	 * @return
	 */
	public List<BookmarkList> selectBookmark(String memberId) {
		return sqlSession.selectList("myPageMapper.selectBookmark", memberId);
	}

	/** 북마크 리스트 조회 (채용공고)
	 * @param memberId
	 */
	public List<BookmarkList2> selectBookmark2(String memberId) {
		return sqlSession.selectList("myPageMapper.selectBookmark2", memberId);
	}

	/** 나의 게시글 목록 조회
	 * @param memberId
	 * @return
	 */
	public List<PostList> selectPostList(String memberId) {
		return sqlSession.selectList("myPageMapper.selectPostList", memberId);
	}

	/** 좋아요 목록 조회
	 * @param memberId
	 * @return
	 */
	public List<PostList> selectLikeList(String memberId) {
		return sqlSession.selectList("myPageMapper.selectLikeList", memberId);
	}

	/** 팔로워 조회
	 * @param memberId
	 * @return
	 */
	public int selectFollowerList(String memberId) {
		return sqlSession.selectOne("myPageMapper.selectFollowerList", memberId);
	}

	/** 팔로잉 조회
	 * @param memberId
	 * @return
	 */
	public int selectFollowingList(String memberId) {
		return sqlSession.selectOne("myPageMapper.selectFollowingList", memberId);
	}

	/** 팔로잉 조회
	 * @param memberId
	 * @return
	 */
	public List<BookmarkList> selectfollowing(String memberId) {
		return sqlSession.selectList("myPageMapper.selectfollowing", memberId);
	}

	/** 팔로우 조회
	 * @param memberId
	 * @return
	 */
	public List<BookmarkList> selectfollower(String memberId) {
		return sqlSession.selectList("myPageMapper.selectfollower", memberId);
	}


}
