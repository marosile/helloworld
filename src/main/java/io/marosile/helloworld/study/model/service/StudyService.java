package io.marosile.helloworld.study.model.service;

import io.marosile.helloworld.study.model.dto.Study;

import java.util.List;

public interface StudyService {

    /* 스터디 목록 조회*/
    List<Study> selectStudyList();
    
    /*스터디 상세 조회*/
    List<Study> selectStudy(int studyNo);
}
