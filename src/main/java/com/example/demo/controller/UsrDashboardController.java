package com.example.demo.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.DashboardService;
import com.example.demo.vo.Dashboard;

@Controller
public class UsrDashboardController {
	
	LocalDate now = LocalDate.now();
	int nowYear = now.getYear();
	
	@Autowired
	private DashboardService dashboardService;

	// 액션 메소드
	@RequestMapping("/usr/bg12343/dashboard")
	public String getDashboard(Model model) {

		List<Dashboard> dashboard = dashboardService.getDashboard();

		model.addAttribute("dashboard", dashboard);
		return "usr/bg12343/dashboard";
	}

	@RequestMapping("/usr/bg12343/rentStatus")
	public String getStatus(Model model, @RequestParam(defaultValue = "1") int bldgId, Integer year) {

		// RequestParam 기본값문법으로 nowYear 데이터가 잘 안 들어가서 이렇게 체크
		if(year == null) {
			year = nowYear;
		}
		List<Dashboard> rentStatus = dashboardService.getRentStatus(bldgId, year);
		
		model.addAttribute("rentStatus", rentStatus);
		model.addAttribute("nowYear", nowYear);
		return "usr/bg12343/rentStatus";
	}

}
