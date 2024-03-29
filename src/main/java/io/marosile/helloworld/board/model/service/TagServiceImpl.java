package io.marosile.helloworld.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.marosile.helloworld.board.model.dao.TagDAO;
import io.marosile.helloworld.board.model.dto.Tag;
import io.marosile.helloworld.recruit.model.dto.Recruit;

@Service
public class TagServiceImpl implements TagService{

	@Autowired
	private TagDAO dao;


	@Override
	public List<Tag> tagSelect(Map<String, Object> map) {
		return dao.tagSelect(map);
	}
	
	// 일반게시글 insert
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int tagInsert(List<Tag> tagList) {
			
			int result = 0;

			for (Tag tag : tagList) {
			    int insertResult = dao.insertTag(tag);
			    result += insertResult;
			}

			return result;
		}
	
	// 태그 게시글 insert
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int tagInsert2(List<Tag> tagList) {
		
		int result = 0;

		for (Tag tag : tagList) {
		    int insertResult = dao.insertTag2(tag);
		    result += insertResult;
		}

		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int tagUpdate(List<Tag> tagList) {
		
		int result = 0;

		for (Tag tag : tagList) {
		    int insertResult = dao.updateTag(tag);
		    result += insertResult;
		}

		return result;
	
	}

	// 매칭공고 태그들 가져오기
	@Override
	public List<Tag> tagSelects2(Recruit rec) {
		return dao.tagSelects2(rec);
	}


	@Override
	public List<Tag> selectTagNos(int boardNo) {
		return dao.selectTagNos(boardNo);
	}

	@Override
	public int deleteTag(Map<String, Object> map) {

		return dao.deleteTag(map);
	}



}




