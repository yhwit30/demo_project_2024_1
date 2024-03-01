package com.example.demo.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.BuildingService;
import com.example.demo.service.DashboardService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Building;
import com.example.demo.vo.Dashboard;
import com.example.demo.vo.Room;
import com.example.demo.vo.Rq;

@Controller
public class UsrDashboardController {
	
	LocalDate now = LocalDate.now();
	int nowYear = now.getYear();
	
	@Autowired
	private Rq rq;

	@Autowired
	private DashboardService dashboardService;

	@Autowired
	private BuildingService buildingService;

	// 액션 메소드
	@RequestMapping("/usr/bg12343/dashboard")
	public String getDashboard(Model model, @RequestParam(defaultValue = "1") int bldgId) {

		List<Dashboard> dashboard = dashboardService.getDashboard();

		List<Room> rooms = buildingService.getForPrintRooms(bldgId);
		int roomsCnt = rooms.size();

//		건물 변환 버튼용
		List<Building> buildings = buildingService.getForPrintBuildings();

		model.addAttribute("buildings", buildings);
		model.addAttribute("dashboard", dashboard);
		model.addAttribute("rooms", rooms);
		model.addAttribute("roomsCnt", roomsCnt);
		return "usr/bg12343/dashboard";
	}

	@RequestMapping("/usr/bg12343/rentStatus")
	public String getStatus(Model model, @RequestParam(defaultValue = "1") int bldgId, Integer year) {

		// RequestParam 기본값문법으로 nowYear 데이터가 잘 안 들어가서 이렇게 체크
		if(year == null) {
			year = nowYear;
		}
		List<Dashboard> rentStatus = dashboardService.getRentStatus(bldgId, year);
		
//		건물 변환 버튼용
		List<Building> buildings = buildingService.getForPrintBuildings();

		model.addAttribute("buildings", buildings);
		model.addAttribute("rentStatus", rentStatus);
		model.addAttribute("nowYear", nowYear);
		return "usr/bg12343/rentStatus";
	}

	@RequestMapping("/usr/bg12343/doRentStatusModify")
	@ResponseBody
	public String doRentStatusModify(int tenantId, String body, int year, String month) {
		
		Dashboard rentStatusRd = dashboardService.getRentStatusRd(tenantId, year, month); 

		// 데이터가 표 안에 있어서 jshistoryback이 안 먹혀서 null로 둠
		if (rentStatusRd == null) {
			return null;
		}

		dashboardService.modifyRentStatus(tenantId, body, year, month);
	
		rentStatusRd = dashboardService.getRentStatusRd(tenantId, year, month); 

		return rentStatusRd.getPaymentStatus();
	}
	
	@RequestMapping("/usr/bg12343/reportBusiness")
	public String showNotice(Model model, @RequestParam(defaultValue = "1") int bldgId, Integer year) {

		// RequestParam 기본값문법으로 nowYear 데이터가 잘 안 들어가서 이렇게 체크
				if(year == null) {
					year = nowYear;
				}
				List<Dashboard> rentStatus = dashboardService.getRentStatus(bldgId, year);
				
//				건물 변환 버튼용
				List<Building> buildings = buildingService.getForPrintBuildings();

				model.addAttribute("buildings", buildings);
				model.addAttribute("rentStatus", rentStatus);
				model.addAttribute("nowYear", nowYear);
		return "usr/bg12343/reportBusiness";
	}
	
}
