package io.marosile.helloworld.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.board.model.dto.Board;

@Repository
public class BoardDAO_PHJ {
	
	@Autowired
	private SqlSessionTemplate sqlSession2;

	
	// 게시글 목록 조회
	public List<Board> selectBoardList(int boardCode) {
		return sqlSession2.selectList("boardMapper.selectBoardList", boardCode);
	}

	// 게시글 상세 조회
	public Board selectBoard(Map<String, Object> map) {
		return sqlSession2.selectOne("boardMapper.selectBoard", map);
	}

	// 북마크 확인 여부 조회
	public int bookMarkCheck(Map<String, Object> map) {
		return sqlSession2.selectOne("boardMapper.bookMarkCheck", map);
	}

	// 북마크 삽입
	public int insertBookMark(Map<String, Object> map) {
		return sqlSession2.insert("boardMapper.insertBookMark", map);
	}

	// 북마크 삭제
	public int deleteBookMark(Map<String, Object> map) {
		return sqlSession2.delete("boardMapper.deleteBookMark", map);
	}

	// 좋아요 여부 조회
	public int likeCheck(Map<String, Object> map) {
		return sqlSession2.selectOne("boardMapper.likeCheck", map);
	}

	// 좋아요 테이블 삽입
	public int insertBoardLike(Map<String, Object> map) {
		return sqlSession2.insert("boardMapper.insertBoardLike", map);
	}

	// 좋아요 테이블 삭제
	public int deleteBoardLike(Map<String, Object> map) {
		return sqlSession2.delete("boardMapper.deleteBoardLike", map);
	}

	// 좋아요 개수 조회
	public int countBoardLike(Object boardNo) {
		return sqlSession2.selectOne("boardMapper.countBoardLike", boardNo);
	}

	// 조회수 증가
	public int updateReadCount(int boardNo) {
		return sqlSession2.update("boardMapper.updateReadCount", boardNo);
	}

	// 신고글 작성
	public int insertReport(Map<String, Object> map) {
		return sqlSession2.insert("boardMapper.insertReport", map);
	}

	// 게시글 목록 조회(조회순)
	public List<Board> selectReadCountList(int boardCode) {
		return sqlSession2.selectList("boardMapper.selectReadCountList", boardCode);
	}

	// 게시글 목록 조회(조회순 -> 최신순)
	public List<Board> selectReadCountListBack(int boardCode) {
		return sqlSession2.selectList("boardMapper.selectReadCountListBack", boardCode);
	}
	
	// 전체 게시글 top 10
	public List<Board> getTopList() {
		return sqlSession2.selectList("boardMapper.getTopList");
	}

	// 검색
	public List<Board> selectBoardListSearch(Map<String, Object> map) {
		return sqlSession2.selectList("boardMapper.selectBoardListSearch", map);
	}

	// 팔로우 삽입 
	public int insertFollow(Map<String, Object> map) {
		return sqlSession2.insert("boardMapper.insertFollow", map);
	}

	// 팔로우 삭제
	public int deleteFollow(Map<String, Object> map) {
		return sqlSession2.delete("boardMapper.deleteFollow" , map);
	}

	// 게시글 목록 조회
	public List<Board> selectBoardList(Map<String, Object> map) {
		return sqlSession2.selectList("boardMapper.selectBoardList", map);
	}

	public int selectFollowerList2(Map<String, Object> map) {
		return sqlSession2.selectOne("boardMapper.selectFollowerList2", map);
	}


}
