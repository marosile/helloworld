package io.marosile.helloworld.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.marosile.helloworld.board.model.dao.BoardDAO_PHJ;
import io.marosile.helloworld.board.model.dto.Board;

@Service
public class BoardServiceImpl_PHJ implements BoardService_PHJ{
	
	@Autowired
	private BoardDAO_PHJ dao;
	
	
	// 게시글 목록 조회(검색 및 미검색)
	@Override
	public List<Board> selectBoardList(Map<String, Object> map) {
		List<Board> boardList = dao.selectBoardList(map);
		return boardList;
	}


	// 게시글 상세 조회
	@Override
	public Board selectBoard(Map<String, Object> map) {
		
		return dao.selectBoard(map);
	}

	// 북마크 여부 조회
	@Override
	public int bookMarkCheck(Map<String, Object> map) {
		return dao.bookMarkCheck(map);
	}

	// 북마크 처리 서비스
	@Transactional
	@Override
	public int bookMark(Map<String, Object> map) {
	    
		int result = 0;
	    
	    Object bookMarkCheckObj = map.get("bookMarkCheck");
	    
	    if (bookMarkCheckObj instanceof Integer) {
	        Integer bookMarkCheck = (Integer) bookMarkCheckObj;
	        
	        if (bookMarkCheck == 0) {
	            result = dao.insertBookMark(map);
	        } else {
	            result = dao.deleteBookMark(map);
	        }
	        
	        if (result == 0) return -1;
	    } 
	    
	    return result;
	}
	
	// 팔로우 처리 서비스 
	@Transactional
	@Override
	public int follow(Map<String, Object> map) {
		
		int result = 0;
		int result2 = 0;
	    Object followCheckObj = map.get("followCheck");
	    
	    if(followCheckObj instanceof Integer) {
	        Integer followCheck = (Integer) followCheckObj;
	        
	        if (followCheck == 0) {
	        	result = dao.insertFollow(map);
	        } else {
				result = dao.deleteFollow(map);
	        }
	        
	    }
	    
		result2 = dao.selectFollowerList2(map);
	    
		return result2;
	}

	
	// 좋아요 여부 조회
	@Override
	public int likeCheck(Map<String, Object> map) {
		return dao.likeCheck(map);
	}
	
	// 좋아요 처리 서비스 
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int like(Map<String, Object> map) {
		
		int result = 0;
	    
	    Object likeCheckObj = map.get("likeCheck");
	    
	    if (likeCheckObj instanceof Integer) {
	    	Integer likeCheckObj2 = (Integer) likeCheckObj;
	    
	        if (likeCheckObj2 == 0) {
	            result = dao.insertBoardLike(map);
	        } else {
	            result = dao.deleteBoardLike(map);
	        }
	        
	        if (result == 0) return -1;
	        
	    }
	    
	    int count = dao.countBoardLike(map.get("boardNo"));
	    
	    return count;
	}

	
	// 조회수 증가 서비스
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReadCount(int boardNo) {
		
		return dao.updateReadCount(boardNo);
		
	}

	// 신고글 작성 서비스
	@Override
	public int insertReport(Map<String, Object> map) {
		
		return dao.insertReport(map);
	}


	// 검색
	@Override
	public List<Board> searchBoardListSearch(Map<String, Object> map) {
		List<Board> boardList = dao.selectBoardListSearch(map);
		
		return boardList;
	}

	// 전체 게시판 조회수 top10
	@Override
	public List<Board> getTopList() {
		return dao.getTopList();
	}




}
