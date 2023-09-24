package io.marosile.helloworld.study.model.dao;

import io.marosile.helloworld.study.model.dto.Study;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class StudyDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;


    // 스터디 목록 조회
    public List<Study> selectStudyList() {

        return sqlSession.selectList("studyMapper.selectStudyList");
    }


    // 스터디 게시글 삽입
    public int studyInsert(Study study) {

        // 스터디 시퀀스 조회 및 스터디 모집글 테이블에 insert
        int result = sqlSession.insert("studyMapper.studyInsert",study);

        if(result>0) {
            result = study.getBoardNo();
        }

        return result;
    }

    // 스터디 게시글 상세 조회(태그해야함)
    public Study studyDetail(Map<String, Object> map) {
        return sqlSession.selectOne("studyMapper.studyDetail",map);
    }


    // 좋아요 여부 조회
    public int likeCheck(Map<String, Object> map) {
        return sqlSession.selectOne("studyMapper.likeCheck",map);

    }
    // 좋아요 삽입
    public int insertStudyLike(Map<String, Object> map) {
        return sqlSession.insert("studyMapper.insertStudyLike",map);
    }

    // 좋아요 삭제
    public int deleteStudyLike(Map<String, Object> map) {
        return sqlSession.delete("studyMapper.deleteStudyLike",map);
    }

    //좋아요 수 조회
    public int countStudyLike(Object boardNo) {
        return sqlSession.selectOne("studyMapper.countStudyLike",boardNo);
    }

    // 조회수 조회
    public int updateReadCount(int boardNo) {
        return sqlSession.update("studyMapper.updateReadCount",boardNo);
    }

    // 스터디 삭제
    public int studyDelete(Map<String, Object> map) {
        return sqlSession.update("studyMapper.studyDelete",map);
    }

    // 스터디 수정
    public int studyUpdate(Study study) {

        int result = sqlSession.update("studyMapper.studyUpdate1",study);
            System.out.println("studyUpdate1:"+result);
        if (result > 0) {
            result = sqlSession.update("studyMapper.studyUpdate2",study);
            System.out.println("studyUpdate2:"+result);

        }
        if (result > 0) {
            result = sqlSession.update("studyMapper.studyUpdate3",study);
            System.out.println("studyUpdate3:"+result);
        }
        if (result > 0) {
            result = sqlSession.update("studyMapper.studyUpdate4",study);
            System.out.println("studyUpdate4:"+result);
        }
        if (result > 0) {
            result = sqlSession.update("studyMapper.studyUpdate5",study);
            System.out.println("studyUpdate5:"+result);
        }
        return result;
    }

    // 모집완료
    public int complete(Map<String, Object> map) {
        return sqlSession.update("studyMapper.complete",map);
    }

    // TOP10
    public List<Study> studyTopList() {
        return  sqlSession.selectList("studyMapper.studyTopList");
    }

    // 위치 전체 검색 리스트
    public List<Study> selectSearchAllLocation(Map<String, Object> paramMap) {
        return sqlSession.selectList("studyMapper.selectSearchAllLocation",paramMap);
    }

    // 위치 검색 리스트
    public List<Study> selectSearchLocation(Map<String, Object> paramMap) {
        return sqlSession.selectList("studyMapper.selectSearchLocation",paramMap);
    }

    // 포지션 검색 리스트
    public List<Study> selectSearchPostion(Map<String, Object> paramMap) {
        return sqlSession.selectList("studyMapper.selectSearchPostion",paramMap);
    }

    // 인원만 검색
    public List<Study> selectSearchPerson(Map<String, Object> paramMap) {
        return sqlSession.selectList("studyMapper.selectSearchPerson",paramMap);
    }

    //위치, 포지션, 인원 모두 검색
    public List<Study> selectStudyList(Map<String, Object> paramMap) {
        return sqlSession.selectList("studyMapper.selectSearchlistAll",paramMap);
    }

    //서울 전체, 포지션, 인원 검색
    public List<Study> listAllSeoul(Map<String, Object> paramMap) {
        return sqlSession.selectList("studyMapper.listAllSeoul",paramMap);
    }

    public int followCheck(Map<String, Object> map) {
        return sqlSession.selectOne("studyMapper.followCheck",map);
    }

    // 팔로우 삽입
    public int insertFollow(Map<String, Object> map) {
        return sqlSession.insert("studyMapper.insertFollow",map);
    }

    // 팔로우 삭제
    public int deleteFollow(Map<String, Object> map) {
        return sqlSession.delete("studyMapper.deleteFollow",map);
    }
}

