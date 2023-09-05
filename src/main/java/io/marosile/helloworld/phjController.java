package io.marosile.helloworld;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class phjController {
	
	@RequestMapping("/board")
	public String board() {
		return "board/board-detail";
	}
	
	@RequestMapping("/employement-test")
	public String employementTest() {
		return "recruit/employment-test/employement-test3";
	}
	
	@RequestMapping("/trand-list")
	public String trandList() {
		return "trand/trand-list";
	}

	@RequestMapping("/recruit-apply")
	public String recruitApply() {
		return "recruit/recruit-apply";
	}

	@RequestMapping("/notice-list")
	public String noticeList() {
		return "recruit/notice-list";
	}
	
	

}
