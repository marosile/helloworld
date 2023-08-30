package io.marosile.helloworld;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class phjController {
	
	@RequestMapping("/board")
	public String board() {
		return "board/board-detail";
	}

}
