package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BuildingService;
import com.example.demo.vo.Building;
import com.example.demo.vo.Room;

@Controller
public class UsrBuildingController {

	@Autowired
	private BuildingService buildingService;
	
	
	// 액션 메소드
		@RequestMapping("/usr/bg12343/building")
		public String getDashboard(Model model) { 

			List<Building> buildings = buildingService.getForPrintBuildings();
			
			int buildingsCnt = buildings.size();
			
			model.addAttribute("buildings", buildings);
			model.addAttribute("buildingsCnt", buildingsCnt);
			return "usr/bg12343/building";
		}
	
		@RequestMapping("/usr/bg12343/room")
		public String getRoom(Model model) { 

			List<Room> rooms = buildingService.getForPrintRooms();
			
			int roomsCnt = rooms.size();
			
			model.addAttribute("roomsCnt", roomsCnt);
			model.addAttribute("rooms", rooms);
			return "usr/bg12343/room";
		}
	
	
	
	
	
	
}
