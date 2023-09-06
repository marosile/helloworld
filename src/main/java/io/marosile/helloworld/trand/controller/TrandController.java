package io.marosile.helloworld.trand.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.marosile.helloworld.trand.model.service.TrandService;

@Controller 
@RequestMapping("/trand") // 트렌드 controller
public class TrandController {

	@Autowired
	private TrandService service;
	
	// 커리어리 트랜드 목록
	@GetMapping("/list")
	public String trandList() {
		return "trand/trand-list";
	}
	
	// 커리어리 트렌드 상세
	@GetMapping("/detail")
	public String trandDetail() {
		return "trand/trand-detail";
	}
	
}
