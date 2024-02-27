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
			SELECT MF.*, T.*, C.*, R.*, B.*,   MF1.monthlyMaintenanceFee AS monthlyMaintenanceFee1,
			    MF2.monthlyMaintenanceFee AS monthlyMaintenanceFee2,
			    MF3.monthlyMaintenanceFee AS monthlyMaintenanceFee3,
			    MF4.monthlyMaintenanceFee AS monthlyMaintenanceFee4,
			    MF5.monthlyMaintenanceFee AS monthlyMaintenanceFee5,
			    MF6.monthlyMaintenanceFee AS monthlyMaintenanceFee6,
			    MF7.monthlyMaintenanceFee AS monthlyMaintenanceFee7,
			    MF8.monthlyMaintenanceFee AS monthlyMaintenanceFee8,
			    MF9.monthlyMaintenanceFee AS monthlyMaintenanceFee9,
			    MF10.monthlyMaintenanceFee AS monthlyMaintenanceFee10,
			    MF11.monthlyMaintenanceFee AS monthlyMaintenanceFee11,
			    MF12.monthlyMaintenanceFee AS monthlyMaintenanceFee12
			FROM maintenance_fee AS MF
			LEFT JOIN tenant AS T
			ON MF.tenantId = T.id
			LEFT JOIN contract AS C
			ON T.roomId = C.roomId
			RIGHT JOIN room AS R
			ON C.roomId = R.id
			LEFT JOIN building AS B
			ON R.bldgId = B.id
			LEFT JOIN
			    maintenance_fee AS MF1 ON C.tenantId = MF1.tenantId AND MF1.updateDate LIKE '${year}-01%'
			LEFT JOIN
			    maintenance_fee AS MF2 ON C.tenantId = MF2.tenantId AND MF2.updateDate LIKE '${year}-02%'
			LEFT JOIN
			    maintenance_fee AS MF3 ON C.tenantId = MF3.tenantId AND MF3.updateDate LIKE '${year}-03%'
			LEFT JOIN
			    maintenance_fee AS MF4 ON C.tenantId = MF4.tenantId AND MF4.updateDate LIKE '${year}-04%'
			LEFT JOIN
			    maintenance_fee AS MF5 ON C.tenantId = MF5.tenantId AND MF5.updateDate LIKE '${year}-05%'
			LEFT JOIN
			    maintenance_fee AS MF6 ON C.tenantId = MF6.tenantId AND MF6.updateDate LIKE '${year}-06%'
			LEFT JOIN
			    maintenance_fee AS MF7 ON C.tenantId = MF7.tenantId AND MF7.updateDate LIKE '${year}-07%'
			LEFT JOIN
			    maintenance_fee AS MF8 ON C.tenantId = MF8.tenantId AND MF8.updateDate LIKE '${year}-08%'
			LEFT JOIN
			    maintenance_fee AS MF9 ON C.tenantId = MF9.tenantId AND MF9.updateDate LIKE '${year}-09%'
			LEFT JOIN
			    maintenance_fee AS MF10 ON C.tenantId = MF10.tenantId AND MF10.updateDate LIKE '${year}-10%'
			LEFT JOIN
			    maintenance_fee AS MF11 ON C.tenantId = MF11.tenantId AND MF11.updateDate LIKE '${year}-11%'
			LEFT JOIN
			    maintenance_fee AS MF12 ON C.tenantId = MF12.tenantId AND MF12.updateDate LIKE '${year}-12%'
			GROUP BY R.id
			HAVING B.id = #{bldgId}
						""")
	List<MaintenanceFee> getMaintenanceFee(int bldgId, Integer year);

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
