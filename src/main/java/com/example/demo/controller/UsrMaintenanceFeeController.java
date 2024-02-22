package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.MaintenanceFeeService;

@Controller
public class UsrMaintenanceFeeController {

	@Autowired
	private MaintenanceFeeService maintenanceFeeService;
	
	
	// 액션 메소드
		@RequestMapping("/usr/bg12343/maintenanceFee")
		public String getDashboard(Model model) { 

//			List<Dashboard> dashboard = maintenanceFeeService.getDashboard();
//			
//			model.addAttribute("dashboard", dashboard);
			return "usr/bg12343/maintenanceFee";
		}
	
		
	
	
	
	
	
}
