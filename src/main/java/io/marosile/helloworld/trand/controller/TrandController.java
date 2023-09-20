package io.marosile.helloworld.trand.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.trand.model.dto.Trand;
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
	
	@PostMapping("/tagList")
	@ResponseBody
	public List<Board> tagList(@RequestBody Map<String, Object> map){
		
		String type = (String) map.get("type");
		
		System.out.println(type);
		
		List<Board> tList = service.selectTagList(type);
		
		return tList;
	} 
	
	// 커리어리 트렌드 상세
	@GetMapping("/detail")
	public String trandDetail() {
		return "trand/trand-detail";
	}
	
}
