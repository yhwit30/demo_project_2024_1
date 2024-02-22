package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.BuildingService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Building;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Room;

@Controller
public class UsrBuildingController {

	@Autowired
	private BuildingService buildingService;

	// 액션 메소드
	@RequestMapping("/usr/bg12343/building")
	public String getBuilding(Model model) {

		List<Building> buildings = buildingService.getForPrintBuildings();

		int buildingsCnt = buildings.size();

		model.addAttribute("buildings", buildings);
		model.addAttribute("buildingsCnt", buildingsCnt);
		return "usr/bg12343/building";
	}

	@RequestMapping("/usr/bg12343/buildingAdd")
	public String showBuildingAdd(Model model) {

		return "usr/bg12343/buildingAdd";
	}

	@RequestMapping("/usr/bg12343/doBuildingAdd")
	@ResponseBody
	public String doBuildingAdd(String bldgName, String bldgAdd, int roomTotal) {
		// 로그인 상태 체크 - 인터셉터에서

		// 제목 내용 빈 칸 확인
		if (Ut.isNullOrEmpty(bldgName)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(bldgAdd)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}
		if (Ut.isEmpty(roomTotal)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}

		// 게시글 작성 작업
		ResultData BuildingAddRd = buildingService.addBuilding(bldgName, bldgAdd, roomTotal);

		// 작성된 게시글 번호 가져오기
		int id = (int) BuildingAddRd.getData1();

		return Ut.jsReplace(BuildingAddRd.getResultCode(), BuildingAddRd.getMsg(), "../bg12343/building");
	}

	@RequestMapping("/usr/bg12343/room")
	public String getRoom(Model model) {

		List<Room> rooms = buildingService.getForPrintRooms();

		int roomsCnt = rooms.size();

		model.addAttribute("roomsCnt", roomsCnt);
		model.addAttribute("rooms", rooms);
		return "usr/bg12343/room";
	}

	@RequestMapping("/usr/bg12343/roomAdd")
	public String showRoomAdd(Model model) {

		return "usr/bg12343/roomAdd";
	}

	@RequestMapping("/usr/bg12343/doRoomAdd")
	@ResponseBody
	public String doRoomAdd(String bldgId, int roomNum, String roomType, int standardDeposit, int standardRent, int standardJeonse) {
		// 로그인 상태 체크 - 인터셉터에서

		// 제목 내용 빈 칸 확인
		if (Ut.isEmpty(roomNum)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(roomType)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}
		if (Ut.isEmpty(standardDeposit)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}
		if (Ut.isEmpty(standardRent)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}
		if (Ut.isEmpty(standardJeonse)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}
		

		// 게시글 작성 작업
		ResultData RoomAddRd = buildingService.addRoom(bldgId, roomNum, roomType, standardDeposit, standardRent, standardJeonse);

		// 작성된 게시글 번호 가져오기
		int id = (int) RoomAddRd.getData1();

		return Ut.jsReplace(RoomAddRd.getResultCode(), RoomAddRd.getMsg(), "../bg12343/room");
	}

}
