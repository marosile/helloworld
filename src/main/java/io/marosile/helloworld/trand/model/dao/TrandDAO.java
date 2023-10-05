package io.marosile.helloworld.trand.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.board.model.dto.Comment;
import io.marosile.helloworld.trand.model.dto.Trand;

@Repository
public class TrandDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 트렌드 목록 조회(태그별)
	 * @param type
	 * @return
	 */
	public List<Board> selectTagList(String type) {
		return sqlSession.selectList("boardMapper.selectTagList", type);
	}

	/** 트렌드 목록 조회(메인화면)
	 * @return
	 */
	public List<Board> selectTrandList() {
		return sqlSession.selectList("boardMapper.selectTrandList");
	}

	/** 트렌드 상세페이지 (게시글)
	 * @param boardNo
	 * @return
	 */
	public Board selectTrandDetail(int boardNo) {
		return sqlSession.selectOne("boardMapper.selectTrandDetail" , boardNo);
	}

	/** 트렌드 상세페이지 (댓글 목록)
	 * @param boardNo
	 * @return
	 */
	public List<Comment> selectComment(int boardNo) {
		return sqlSession.selectList("boardMapper.selectComment", boardNo);
	}

	/** 북마크 확인 여부 조회
	 * @param map
	 * @return
	 */
	public int bookMarkCheck(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.bookMarkCheck", map);
	}

	/** 좋아요 확인 여부 조회
	 * @param map
	 * @return
	 */
	public int likeCheck(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.likeCheck" , map);
	}

	/** 팔로우 확인 여부 조회
	 * @param map
	 * @return
	 */
	public int followCheck(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.followCheck", map);
	}

	public int selectFollowers(String boardUserId) {
		return sqlSession.selectOne("myPageMapper.selectFollowerList", boardUserId);
	}

	public int selectFollowings(String boardUserId) {
		return sqlSession.selectOne("myPageMapper.selectFollowingList", boardUserId);
	}

}
