package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Dashboard;

@Mapper
public interface DashboardRepository {

	@Select("""
			SELECT *
			FROM room AS R
			LEFT JOIN contract AS C
			ON R.id = C.roomId
			LEFT JOIN building AS B
			ON R.bldgId = B.id
			LEFT JOIN tenant AS T
			ON C.tenantId = T.id
			LEFT JOIN contract_status AS CS 
			ON C.tenantId = CS.tenantId AND CS.rentDate LIKE '2024-02%'
			GROUP BY R.id
			""")
	List<Dashboard> getDashboard(); //수정예정 합계로
 
	
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
	List<Dashboard> getRentStatus(int bldgId);


}
