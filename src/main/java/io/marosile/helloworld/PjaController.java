package io.marosile.helloworld;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PjaController {
	
	@GetMapping("/studyMain")
	public String signUp() {
		return "study/studyMain";
	}

}
