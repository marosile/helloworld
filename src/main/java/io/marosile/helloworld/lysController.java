package io.marosile.helloworld;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class lysController {
	
	@GetMapping("/signUp")
	public String signUp() {
		return "common/modal/signUp";
	}

}
