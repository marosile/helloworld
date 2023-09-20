package io.marosile.helloworld.lecture.model.service;

import io.marosile.helloworld.lecture.model.dao.LectureDAO;
import io.marosile.helloworld.lecture.model.dto.Lecture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public Lecture lectureDetail(int lectureNo) {
        return dao.selectLecture(lectureNo);
    }

}
