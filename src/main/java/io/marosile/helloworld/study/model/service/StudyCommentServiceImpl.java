package io.marosile.helloworld.study.model.service;

import io.marosile.helloworld.common.utility.Util;
import io.marosile.helloworld.study.model.dao.StudyCommentDAO;
import io.marosile.helloworld.study.model.dto.studyComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudyCommentServiceImpl implements StudyCommentService {

    @Autowired
    private StudyCommentDAO dao;

    // 댓글 삽입
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int insert(studyComment comment) {

        comment.setCommentContent(Util.XSSHandling(comment.getCommentContent()));

        return dao.insert(comment);
    }

    // 댓글 목록조회
    @Override
    public List<studyComment> select(int boardNo) {

        return dao.select(boardNo);
    }

    //댓글 삭제
    @Override
    public int delete(int commentNo) {
        return dao.delete(commentNo);
    }

    // 댓글 수정
    @Override
    public int update(studyComment comment) {
        return dao.update(comment);
    }


}
