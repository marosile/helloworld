package io.marosile.helloworld.study.model.service;

import io.marosile.helloworld.common.utility.Util;
import io.marosile.helloworld.study.model.dao.StudyDAO;
import io.marosile.helloworld.study.model.dto.Study;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudyServiceImpl implements StudyService {

	@Autowired
	private StudyDAO dao;

	// 스터디 목록 조회
	@Override
	public Map<String, Object> selectStudyList() {

		List<Study> studyList = dao.selectStudyList();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("studyList",studyList);

		return map;
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
				System.out.println("좋아요삽입"+result);
			} else {
				result = dao.deleteStudyLike(map);
				System.out.println("좋아요취소"+result);
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

	// 스터디 수정
	@Override
	public int studyUpdate(Study study) {

		study.setBoardTitle(Util.XSSHandling(study.getBoardTitle()));

		return dao.studyUpdate(study);
	}

	// 게시글 삽입
	@Override
	@Transactional
	public int studyInsert(Study study) {

		study.setBoardTitle(Util.XSSHandling(study.getBoardTitle()));
		int boardNo = dao.studyInsert(study);

		return boardNo;
	}

	@Override
	public int complete(Map<String, Object> map) {
		return dao.complete(map);
	}

	// TOP 10위
	@Override
	public List<Study> studyTopList() {
		return dao.studyTopList();
	}

	@Override
	public Map<String, Object> studySearch(Map<String, Object> paramMap) {


		// 서울 전체 검색
		List<Study> locationAll = dao.selectSearchAllLocation(paramMap);

		// 위치 검색
		List<Study> location = dao.selectSearchLocation(paramMap);

		// 포지션 검색
		List<Study> postion = dao.selectSearchPostion(paramMap);

		// 인원 검색
		List<Study> person = dao.selectSearchPerson(paramMap);

		// 전체 검색
		List<Study> listAll = dao.selectStudyList(paramMap);

		// 전체 검색 + 서울 전체검색
		List<Study> listAllSeoul = dao.listAllSeoul(paramMap);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("studyList",locationAll);
		map.put("location",location);
		map.put("tagNm",postion);
		map.put("headCount",person);
		map.put("listAll",listAll);
		map.put("listAllSeoul",listAllSeoul);

		return map;
	}

	// 팔로우 조회
	@Override
	public int followCheck(Map<String, Object> map) {
		return dao.followCheck(map);

	}

	// 팔로우 처리 서비스
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int follow(Map<String, Object> map) {

		int result = 0;

		Object followCheckObj = map.get("followCheck");

		if(followCheckObj instanceof Integer) {
			Integer followCheck = (Integer) followCheckObj;

			if (followCheck == 0) {
				result = dao.insertFollow(map);
				System.out.println("팔로잉함! "+result);

			} else {
				result = dao.deleteFollow(map);
				System.out.println("팔로잉 끊김"+result);
			}

		}
		return result;
	}


}
