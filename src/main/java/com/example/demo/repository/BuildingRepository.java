package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Building;
import com.example.demo.vo.Room;

@Mapper
public interface BuildingRepository {

	@Select("""
			SELECT *
			FROM building
			WHERE id = #{bldgId}
			""")
	Building getForPrintBuilding(int bldgId);

	@Select("""
			SELECT *
			FROM building 
			""")
	List<Building> getForPrintBuildings();
	
	@Select("""
			SELECT *
			FROM room AS R
			LEFT JOIN contract AS C
			ON R.id = C.roomId
			LEFT JOIN building AS B
			ON R.bldgId = B.id
			LEFT JOIN tenant AS T
			ON C.tenantId = T.id
			GROUP BY R.id
			HAVING B.id = #{bldgId}
			""")
	List<Room> getForPrintRooms(int bldgId);

	@Insert("""
			INSERT INTO
			building SET
			regDate = NOW(),
			updateDate = NOW(),
			bldgName = #{bldgName},
			bldgAdd = #{bldgAdd},
			roomTotal = #{roomTotal}
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
			roomArea = #{roomArea},
			standardDeposit = #{standardDeposit},
			standardRent = #{standardRent},
			standardJeonse = #{standardJeonse}
			""")
	void addRoom(int bldgId, int roomNum, String roomType, double roomArea, int standardDeposit, int standardRent, int standardJeonse);

	@Update("""
			UPDATE building 
			SET updateDate = NOW(),
			bldgName = #{bldgName},
			bldgAdd = #{bldgAdd},
			roomTotal = #{roomTotal}
			WHERE id = #{bldgId}
			""")
	void modifyBuilding(int bldgId, String bldgName, String bldgAdd, int roomTotal);

	@Update("""
			UPDATE room
			SET	roomNum = #{roomNum},
			roomType = #{roomType},
			roomArea = #{roomArea},
			standardDeposit = #{standardDeposit},
			standardRent = #{standardRent},
			standardJeonse = #{standardJeonse}
			WHERE id = #{roomId}
			""")
	void modifyRoom(int roomId, int roomNum, String roomType, double roomArea, int standardDeposit, int standardRent,
			int standardJeonse);

	@Select("""
			SELECT *
			FROM building
			ORDER BY id DESC
			LIMIT 1
			""")
	int getLastBldgId();

	

}
