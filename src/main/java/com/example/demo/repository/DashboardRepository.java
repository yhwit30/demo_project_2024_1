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
	List<Dashboard> getDashboard(); // 수정예정 합계로

	@Select("""
			SELECT *,
				MAX(CASE WHEN CS.rentDate LIKE '2024-01%' THEN CS.paymentStatus ELSE NULL END) AS JanuaryPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '2024-02%' THEN CS.paymentStatus ELSE NULL END) AS FebruaryPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '2024-03%' THEN CS.paymentStatus ELSE NULL END) AS MarchPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '2024-04%' THEN CS.paymentStatus ELSE NULL END) AS AprilPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '2024-05%' THEN CS.paymentStatus ELSE NULL END) AS MayPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '2024-06%' THEN CS.paymentStatus ELSE NULL END) AS JunePaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '2024-07%' THEN CS.paymentStatus ELSE NULL END) AS JulyPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '2024-08%' THEN CS.paymentStatus ELSE NULL END) AS AugustPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '2024-09%' THEN CS.paymentStatus ELSE NULL END) AS SeptemberPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '2024-10%' THEN CS.paymentStatus ELSE NULL END) AS OctoberPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '2024-11%' THEN CS.paymentStatus ELSE NULL END) AS NovemberPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '2024-12%' THEN CS.paymentStatus ELSE NULL END) AS DecemberPaymentStatus
			FROM room AS R
			LEFT JOIN contract AS C
			ON R.id = C.roomId
			LEFT JOIN building AS B
			ON R.bldgId = B.id
			LEFT JOIN tenant AS T
			ON C.tenantId = T.id
			LEFT JOIN contract_Status AS CS 
			ON C.tenantId = CS.tenantId
			AND (CS.rentDate LIKE '2024-01%' OR CS.rentDate LIKE '2024-02%' OR CS.rentDate LIKE '2024-03%' OR
			     CS.rentDate LIKE '2024-04%' OR CS.rentDate LIKE '2024-05%' OR CS.rentDate LIKE '2024-06%' OR
			     CS.rentDate LIKE '2024-07%' OR CS.rentDate LIKE '2024-08%' OR CS.rentDate LIKE '2024-09%' OR
			     CS.rentDate LIKE '2024-10%' OR CS.rentDate LIKE '2024-11%' OR CS.rentDate LIKE '2024-12%')
			GROUP BY R.id
			HAVING B.id = #{bldgId}
			""")
	List<Dashboard> getRentStatus(int bldgId);

	

}
