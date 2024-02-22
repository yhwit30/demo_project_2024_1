package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
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
			SELECT R.*, B.bldgName
			FROM room AS R
			INNER JOIN building AS B
			ON R.bldgId = B.id
			""")
	List<Room> getForPrintRooms();

	@Insert("""
			INSERT INTO
			building SET
			regDate = NOW(),
			updateDate = NOW(),
			bldgName = #{bldgName},
			bldgAdd = #{bldgAdd},
			roomTotal = #{roomTotal},
			bldgMemo = '건물메모 테스트'
			""")
	void addBuilding(String bldgName, String bldgAdd, int roomTotal);

	@Select("SELECT LAST_INSERT_ID()")
	int getLastInsertId();

	@Insert("""
			INSERT INTO
			room SET
			bldgId = #{bldgId},
			roomNum = #{roomNum},
			roomType = #{roomType},
			standardDeposit = #{standardDeposit},
			standardRent = #{standardRent},
			standardJeonse = #{standardJeonse},
			roomMemo = '호실메모 테스트'
			""")
	void addRoom(String bldgId, int roomNum, String roomType, int standardDeposit, int standardRent, int standardJeonse);

	
	
	
	
	
	
	
	
	
	
	
}
