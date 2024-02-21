package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Building;
import com.example.demo.vo.Room;

@Mapper
public interface BuildingRepository {

	@Select("""
			SELECT *
			FROM building
			""")
	List<Building> getForPrintBuildings();

	@Select("""
			SELECT *
			FROM room
			""")
	List<Room> getForPrintRooms();

	
	
	
	
	
	
	
	
	
	
	
}
