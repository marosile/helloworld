package io.marosile.helloworld.trand.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.trand.model.dao.TrandDAO;
import io.marosile.helloworld.trand.model.dto.Trand;

@Service
public class TrandServiceImpl implements TrandService {

	@Autowired
	private TrandDAO dao;

	@Override
	public List<Board> selectTagList(String type) {
		
		return dao.selectTagList(type);
	}
	
}
