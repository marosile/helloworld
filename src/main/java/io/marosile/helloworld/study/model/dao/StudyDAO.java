package io.marosile.helloworld.study.model.dao;

import io.marosile.helloworld.board.model.dto.Board;
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


	public Study studyDetail(Map<String, Object> map) {
		 return sqlSession.selectOne("studyMapper.studyDetail",map);
	}


}
