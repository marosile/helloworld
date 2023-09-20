package io.marosile.helloworld.board.model.service;

import java.util.List;
import java.util.Map;

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
	public List<Tag> tagSelect(Map<String, Object> map) {
		return dao.tagSelect(map);
	}
	
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

}




