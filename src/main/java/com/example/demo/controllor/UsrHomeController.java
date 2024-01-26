package com.example.demo.controllor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrHomeController {
	
	private int count = 0;
	
	public UsrHomeController(){
		count = 0;
	}
	
	@RequestMapping("/usr/home/main5")
	@ResponseBody
	public String showMain5() {
		count = 0;
		return "count의 값이 초기화되었습니다.";
	}

	@RequestMapping("/usr/home/main4")
	@ResponseBody
	public int showMain4() {
		return count++;
	}
	
	@RequestMapping("/usr/home/main")
	@ResponseBody
	public String showMain() {
		return "Don Quixote";
	}
	

}

