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

        if(result>0){
            result = study.getStudyNo();
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
}
