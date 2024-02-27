package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BuildingRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Building;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Room;

@Service
public class BuildingService {

	@Autowired
	private BuildingRepository buildingRepository;

	public Building getForPrintBuilding(int bldgId) {
		return buildingRepository.getForPrintBuilding(bldgId);
	}
	public List<Building> getForPrintBuildings(int bldgId) {
		return buildingRepository.getForPrintBuildings(bldgId);
	}

	public List<Room> getForPrintRooms() {
		return buildingRepository.getForPrintRooms();
	}

	public ResultData addBuilding(String bldgName, String bldgAdd, int roomTotal) {
		buildingRepository.addBuilding(bldgName, bldgAdd, roomTotal);
		int id = buildingRepository.getLastInsertId();
		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
	}

	public ResultData addRoom(int bldgId, int roomNum, String roomType, int standardDeposit, int standardRent,
			int standardJeonse) {
		buildingRepository.addRoom(bldgId, roomNum, roomType, standardDeposit, standardRent, standardJeonse);
		int id = buildingRepository.getLastInsertId();
		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
	}

	public ResultData modifyBuilding(int id, String bldgName, String bldgAdd, int roomTotal, String bldgMemo) {
		buildingRepository.modifyBuilding(id, bldgName, bldgAdd, roomTotal, bldgMemo);
		return ResultData.from("S-1", "건물정보가 수정되었습니다");
	}

	public ResultData modifyRoom(int id, int bldgId, int roomNum, String roomType, String roomMemo, int standardDeposit,
			int standardRent, int standardJeonse) {
		buildingRepository.modifyRoom(id, bldgId, roomNum, roomType,roomMemo, standardDeposit, standardRent, standardJeonse);
		return ResultData.from("S-1", "호실정보가 수정되었습니다");
	}

	

}
