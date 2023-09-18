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

    // 좋아요 확인 여부 조회

}
