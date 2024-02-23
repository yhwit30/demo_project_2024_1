package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.MaintenanceFee;
import com.example.demo.vo.ResultData;

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

	@Update("""
			UPDATE maintenance_fee
			SET commonElec = #{commonElec},
			commonWater = #{commonWater},
			elevater = #{elevater},
			internetTV = #{internetTV},
			fireSafety = #{fireSafety},
			waterUse = #{waterUse},
			waterCost = #{waterCost},
			waterBill = #{waterBill},
			elecUse = #{elecUse},
			elecCost = #{elecCost},
			elecBill = #{elecBill},
			gasUse = #{gasUse},
			gasCost = #{gasCost},
			gasBill = #{gasBill},
			monthlyMaintenanceFee = #{monthlyMaintenanceFee},
			lateFee = #{lateFee},
			lateMaintenanceFee = #{lateMaintenanceFee},
			maintenanceFeeDate = #{maintenanceFeeDate}
			WHERE tenantId = #{tenantId}
			""")
	void modifyMaintenanceFee(int tenantId, int commonElec, int commonWater, int elevater, int internetTV,
			int fireSafety, int waterUse, int waterCost, int waterBill, int elecUse, int elecCost, int elecBill,
			int gasUse, int gasCost, int gasBill, int monthlyMaintenanceFee, int lateFee, int lateMaintenanceFee,
			int maintenanceFeeDate);

}
