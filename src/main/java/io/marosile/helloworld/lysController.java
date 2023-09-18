package io.marosile.helloworld;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import io.marosile.helloworld.common.utility.Util;



@SessionAttributes("rand")
@Controller
public class lysController {



	// 휴대폰 인증
	@PostMapping("phoneAuth")
	@ResponseBody
	public String phoneAuth(@RequestBody Map<String, Object> inputTel1
						, Model model) {
		
		String rand = null;
		try {
			String tel = inputTel1.get("inputTel1").toString();
			
			rand = Util.sendRandomMessage(tel);
			
			model.addAttribute("rand", rand);
			
			Util util = new Util();
			util.sendMessage(tel, rand);
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return rand;
		
	}
	
	
	
	@PostMapping("phoneAuthCheck")
	@ResponseBody
	public int phoneAuthCheck(@RequestBody Map<String, Object> inputTel2,
					@SessionAttribute("rand") String rand
					, SessionStatus session) {
		
		String randCheck = inputTel2.get("inputTel2").toString();
		
		System.out.println(randCheck);
		
		if(rand.equals(randCheck)) {
			session.setComplete();
			return 1;
		}else {
			return 0;
		}
		
	}

	@PostMapping("emailAuth")
	@ResponseBody
	public String emailAuth(@RequestBody Map<String, Object> inputEmail1
							, Model model){
		return null;
	}
	



}
