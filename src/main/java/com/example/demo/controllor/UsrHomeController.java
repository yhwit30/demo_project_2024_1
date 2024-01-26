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
	
	@RequestMapping("/usr/home/main")
	@ResponseBody
	public String showMain() {
		return "Don Quixote";
	}
	
	@RequestMapping("/usr/home/main4")
	@ResponseBody
	public int showMain4() {
		return count++;
	}

}

