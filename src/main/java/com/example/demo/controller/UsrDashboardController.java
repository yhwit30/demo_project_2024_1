package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BuildingService;
import com.example.demo.service.DashboardService;
import com.example.demo.vo.Building;
import com.example.demo.vo.Dashboard;
import com.example.demo.vo.Room;

@Controller
public class UsrDashboardController {

	@Autowired
	private DashboardService dashboardService;
	
	
	// 액션 메소드
		@RequestMapping("/usr/bg12343/dashboard")
		public String getDashboard(Model model) { 

			List<Dashboard> dashboard = dashboardService.getDashboard();
			
			
			model.addAttribute("dashboard", dashboard);
			return "usr/bg12343/dashboard";
		}
	
		
	
	
	
	
	
}
