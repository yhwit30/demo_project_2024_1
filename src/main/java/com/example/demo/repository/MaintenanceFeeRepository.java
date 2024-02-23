package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.MaintenanceFee;

@Mapper
public interface MaintenanceFeeRepository {

	
	@Select("""
			SELECT * FROM maintenance_fee AS MF
			LEFT JOIN tenant AS T
			ON MF.tenantId = T.id
			LEFT JOIN contract AS C
			ON T.roomId = C.roomId
			LEFT JOIN room AS R
			ON C.roomId = R.id
			LEFT JOIN building AS B
			ON R.bldgId = B.id
		""")
	List<MaintenanceFee> getMaintenanceFee();

}
