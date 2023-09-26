package io.marosile.helloworld.study.model.service;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.study.model.dto.Study;

import java.util.List;
import java.util.Map;

public interface StudyService {

    // 스터디 목록 조회
    Map<String, Object> selectStudyList();

    // 스터디 게시글 상세조회
    Study studyDetail(Map<String, Object> map);

    // 좋아요 여부 조회
    int likeCheck(Map<String, Object> map);

    // 좋아요 처리 서비스
    int like(Map<String, Object> map);

    // 조회수 조회
    int updateReadCount(int boardNo);

    //스터디 삭제
    int studyDelete(Map<String, Object> map);


    // 스터디 수정
    int studyUpdate(Study study);

    // 스터디 삽입
    int studyInsert(Study study);

    // 모집완료 조회
    int complete(Map<String, Object> map);

    // TOP 10위
    List<Study> studyTopList();

    // 검색기능
    Map<String, Object> studySearch(Map<String, Object> paramMap);


    // 팔로우 조회
    int followCheck(Map<String, Object> map);

    // 팔로우 처리
    int follow(Map<String, Object> map);

    // 좋아요 처리 (메인)
    int mainLike(Map<String, Object> map);
}
