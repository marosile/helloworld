package io.marosile.helloworld.study.model.service;

import io.marosile.helloworld.study.model.dto.studyComment;

import java.util.List;

public interface StudyCommentService {

    // 댓글 삽입
    int insert(studyComment comment);

    // 댓글 목록 조회
    List<studyComment> select(int boardNo);

    //댓글 삭제
    int delete(int commentNo);

    // 댓글 수정
    int update(studyComment comment);
}
