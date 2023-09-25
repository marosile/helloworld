package io.marosile.helloworld.lecture.model.dao;

import io.marosile.helloworld.lecture.model.dto.Lecture;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LectureDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<Lecture> selectPopularLectureList() {
        return sqlSession.selectList("lectureMapper.selectPopularLectureList");
    }

    public List<Lecture> selectRecentLectureList() {
        return sqlSession.selectList("lectureMapper.selectRecentLectureList");
    }

    public Lecture selectLecture(int lectureNo) {
        return sqlSession.selectOne("lectureMapper.selectLecture", lectureNo);
    }

    public int insertLecture(Lecture lecture) {
        return sqlSession.insert("lectureMapper.insertLecture", lecture) > 0 ? lecture.getLectureNo() : 0;
    }

    public int updateLecture(Lecture lecture) { return sqlSession.update("lectureMapper.updateLecture", lecture); }

    public int deleteLecture(int lectureNo) { return sqlSession.update("lectureMapper.deleteLecture", lectureNo); };
}
