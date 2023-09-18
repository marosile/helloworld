package io.marosile.helloworld.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.board.model.dto.Comment;

@Repository
public class CommentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회
	 * @param boardNo
	 * @return
	 */
	public List<Comment> select(int boardNo) {
		return sqlSession.selectList("boardMapper.selectCommentList", boardNo);
	}

	/** 댓글 삽입
	 * @param comment
	 * @return result
	 */
	public int insert(Comment comment) {
		return sqlSession.insert("commentMapper.insertComment", comment);
	}

	/** 댓글 삭제
	 * @param commentNo
	 * @return result
	 */
	public int delete(int commentNo) {
		return sqlSession.delete("commentMapper.deleteComment", commentNo);
	}

	/** 댓글 수정
	 * @param comment
	 * @return result
	 */
	public int update(Comment comment) {
		return sqlSession.update("commentMapper.updateComment", comment);
	}

	
	
	
}
