package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BuildingRepository;
import com.example.demo.vo.Building;
import com.example.demo.vo.Room;

@Service
public class BuildingService {

	@Autowired
	private BuildingRepository buildingRepository;

	public List<Building> getForPrintBuildings() {
		return buildingRepository.getForPrintBuildings();
	}

	public List<Room> getForPrintRooms() {
		return buildingRepository.getForPrintRooms();
	}
	
	
}
