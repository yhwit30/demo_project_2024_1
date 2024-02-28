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
			WHERE id = #{bldgId};
			""")
	Building getForPrintBuilding(int bldgId);

	@Select("""
			SELECT *
			FROM building AS B
			INNER JOIN room AS R
			ON B.id = R.bldgId
			WHERE B.id = #{bldgId};
			""")
	List<Building> getForPrintBuildings(int bldgId);

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
	void addRoom(int bldgId, int roomNum, String roomType, int standardDeposit, int standardRent, int standardJeonse);

	@Update("""
			UPDATE building
			SET updateDate = NOW(),
			bldgName = #{bldgName},
			bldgAdd = #{bldgAdd},
			roomTotal = #{roomTotal},
			bldgMemo = #{bldgMemo}
			WHERE id = #{id}
			""")
	void modifyBuilding(int id, String bldgName, String bldgAdd, int roomTotal, String bldgMemo);

	@Update("""
			UPDATE room
			SET	roomNum = #{roomNum},
			roomType = #{roomType},
			roomMemo = #{roomMemo},
			standardDeposit = #{standardDeposit},
			standardRent = #{standardRent},
			standardJeonse = #{standardJeonse}
			WHERE id = #{id}
			AND bldgId = #{bldgId}
			""")
	void modifyRoom(int id, int bldgId, int roomNum, String roomType, String roomMemo, int standardDeposit,
			int standardRent, int standardJeonse);

}
