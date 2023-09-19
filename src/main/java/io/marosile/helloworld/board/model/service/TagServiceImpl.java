package io.marosile.helloworld.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.marosile.helloworld.board.model.dao.TagDAO;
import io.marosile.helloworld.board.model.dto.Tag;

@Service
public class TagServiceImpl implements TagService{

	@Autowired
	private TagDAO dao;

	@Override
	public List<Tag> tagSelect(int boardNo) {
		return dao.tagSelect(boardNo);
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int tagInsert(List<Tag> tagList) {
			
			int result = 0;
			
			for (int i = 0; i < tagList.size(); i++) {
			    Tag tag = tagList.get(i);
			    int insertResult = dao.insertTag(tag);
			    result += insertResult;
			}
			
			return result;
	 
		}





	}




