package io.marosile.helloworld.study.model.service;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.study.model.dto.Study;

import java.util.List;
import java.util.Map;

public interface StudyService {

    // 스터디 목록 조회
    List<Study> selectStudyList();
    
    // 스터디 게시글 삽입
    int studyInsert(Study study);

    // 스터디 게시글 상세조회
	Study studyDetail(Map<String, Object> map);

    // 좋아요 여부 조회
    int likeCheck(Map<String, Object> map);
    
    // 좋아요 처리 서비스
    int like(Map<String, Object> map);
}
