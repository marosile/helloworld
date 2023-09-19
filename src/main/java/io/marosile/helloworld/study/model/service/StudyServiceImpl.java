package io.marosile.helloworld.study.model.service;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.study.model.dao.StudyDAO;
import io.marosile.helloworld.study.model.dto.Study;
import jdk.jfr.TransitionTo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class StudyServiceImpl implements StudyService {

	@Autowired
	private StudyDAO dao;

	// 스터디 목록 조회
	@Override
	public List<Study> selectStudyList() {

		List<Study> studyList = dao.selectStudyList();

		return studyList;
	}

	// 스터디 게시글 삽입
	@Override
	public int studyInsert(Study study) {

		// 스터디 시퀀스 조회 및 스터디 모집글 테이블에 insert
		int studyNumber = dao.studyInsert(study);

		return studyNumber;
	}

	// 스터디 상세 보기
	@Override
	public Study studyDetail(Map<String, Object> map) {

		return dao.studyDetail(map);
	}

	// 좋아요 여부 조회
	@Override
	public int likeCheck(Map<String, Object> map) {
		return dao.likeCheck(map);
	}

	// 좋아요 처리
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int like(Map<String, Object> map) {

		int result = 0;

		Object likeCheckObj = map.get("likeCheck");
	    
	    if (likeCheckObj instanceof Integer) {
	    	Integer likeCheckObj2 = (Integer) likeCheckObj;
	    
	        if (likeCheckObj2 == 0) {
	            result = dao.insertStudyLike(map);
	        } else {
	            result = dao.deleteStudyLike(map);
	        }
	        
	        if (result == 0) return -1;
	        
	    }

	    int count = dao.countStudyLike(map.get("boardNo"));
	    return count;

	}

	// 조회수 조회
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateReadCount(int boardNo) {
		return dao.updateReadCount(boardNo);
	}

	// 스터디 삭제
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int studyDelete(Map<String, Object> map) {
		return dao.studyDelete(map);
	}

}
