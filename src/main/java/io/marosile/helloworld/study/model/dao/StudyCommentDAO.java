package io.marosile.helloworld.study.model.dao;

import io.marosile.helloworld.study.model.dto.studyComment;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class StudyCommentDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    // 댓글 삽입

    public int insert(studyComment comment) {
        return sqlSession.insert("studyCommentMapper.insert",comment);
    }
    // 댓글 조회
    public List<studyComment> select(int boardNo) {
        return sqlSession.selectList("studyMapper.selectStudyCommentList",boardNo);
    }


    //댓글 삭제
    public int delete(int commentNo) {
        return sqlSession.update("studyCommentMapper.delete",commentNo);
    }

    // 댓글 수정
    public int update(studyComment comment) {
        return sqlSession.update("studyCommentMapper.update",comment);
    }
}
