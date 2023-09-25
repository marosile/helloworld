package io.marosile.helloworld.lecture.model.service;

import io.marosile.helloworld.lecture.model.dto.Lecture;

import java.util.List;

public interface LectureService {

    List<Lecture> popularLectureList();

    List<Lecture> recentLectureList();

    Lecture lectureDetail(int lectureNo);

    int insertLecture(Lecture lecture);

    int updateLecture(Lecture lecture);

    int deleteLecture(int lectureNo);
}
