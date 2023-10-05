package io.marosile.helloworld.lecture.model.service;

import io.marosile.helloworld.lecture.model.dao.LectureDAO;
import io.marosile.helloworld.lecture.model.dto.Lecture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LectureServiceImpl implements LectureService {

    @Autowired
    private LectureDAO dao;

    @Override
    public List<Lecture> popularLectureList() {
        return dao.selectPopularLectureList();
    }

    @Override
    public List<Lecture> recentLectureList() {
        return dao.selectRecentLectureList();
    }

    @Override
    public List<Lecture> selectPurchasedLectureList(String memberId) { return dao.selectPurchasedLectureList(memberId); }

    @Override
    public Lecture lectureDetail(int lectureNo) {
        return dao.selectLecture(lectureNo);
    }

    @Override
    @Transactional
    public int insertLecture(Lecture lecture) { return dao.insertLecture(lecture); }

    @Override
    @Transactional
    public int updateLecture(Lecture lecture) { return dao.updateLecture(lecture); }

    @Override
    @Transactional
    public int deleteLecture(int lectureNo) { return dao.deleteLecture(lectureNo); }

    @Override
    public List<Lecture> selectLectureListByMemberId(String memberId) { return dao.selectLectureListByMemberId(memberId); }

}
