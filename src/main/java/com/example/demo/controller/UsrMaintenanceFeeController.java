package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.MaintenanceFeeService;
import com.example.demo.vo.MaintenanceFee;

@Controller
public class UsrMaintenanceFeeController {

	@Autowired
	private MaintenanceFeeService maintenanceFeeService;
	
	
	// 액션 메소드
		@RequestMapping("/usr/bg12343/maintenanceFee")
		public String getDashboard(Model model) { 

			List<MaintenanceFee> maintenanceFee = maintenanceFeeService.getMaintenanceFee();
			
			model.addAttribute("maintenanceFee", maintenanceFee);
			return "usr/bg12343/maintenanceFee";
		}
	
		
	
	
	
	
	
}
