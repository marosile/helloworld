package io.marosile.helloworld.trand.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.board.model.dto.Comment;
import io.marosile.helloworld.trand.model.dao.TrandDAO;
import io.marosile.helloworld.trand.model.dto.Trand;

@Service
public class TrandServiceImpl implements TrandService {

	@Autowired
	private TrandDAO dao;

	// 트랜드 목록 조회(태그별)
	@Override
	public List<Board> selectTagList(String type) {
		return dao.selectTagList(type);
	}

	// 트랜드 목록 조회(메인화면)
	@Override
	public List<Board> selectTrandList() {
		return dao.selectTrandList();
	}

	// 트렌드 상세페이지(게시글)
	@Override
	public Board selectTrandDetail(int boardNo) {
		return dao.selectTrandDetail(boardNo);
	}

	// 트렌드 상세페이지 (댓글 목록)
	@Override
	public List<Comment> selectComment(int boardNo) {
		return dao.selectComment(boardNo);
	}

	// 북마크 확인 여부 서비스 
	@Override
	public int bookMarkCheck(Map<String, Object> map) {
		return dao.bookMarkCheck(map);
	}

	// 좋아요 확인 여부 서비스
	@Override
	public int likeCheck(Map<String, Object> map) {
		return dao.likeCheck(map);
	}
	
}
