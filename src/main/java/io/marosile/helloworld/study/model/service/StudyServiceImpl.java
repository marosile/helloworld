package io.marosile.helloworld.study.model.service;

import io.marosile.helloworld.study.model.dao.StudyDAO;
import io.marosile.helloworld.study.model.dto.Study;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudyServiceImpl implements StudyService{

    @Autowired
    private StudyDAO dao;

    // 스터디 목록 조회
    @Override
    public List<Study> selectStudyList() {


        List<Study> studyList = dao.selectStudyList();

        return studyList;
    }

    // 스터디 상세 조회
    @Override
    public List<Study> selectStudy(int studyNo) {

        List<Study> study = dao.selectStudy(studyNo);

        return study;
    }

    // 스터디 게시글 삽입
    @Override
    public int studyInsert(Study study) {

        int studyNumber = dao.studyInsert(study);

        return studyNumber;
    }
}
