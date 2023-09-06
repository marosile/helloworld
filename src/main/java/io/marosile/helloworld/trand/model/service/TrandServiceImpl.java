package io.marosile.helloworld.trand.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.marosile.helloworld.trand.model.dao.TrandDAO;

@Service
public class TrandServiceImpl implements TrandService {

	@Autowired
	private TrandDAO dao;
	
}
