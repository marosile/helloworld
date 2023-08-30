package io.marosile.helloworld;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class ohsController {

	@GetMapping("/boardList")
	public String listTest() {
		return "board/board-list";
	}
	
	
	
}
