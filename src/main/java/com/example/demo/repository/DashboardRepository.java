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
				MAX(CASE WHEN CS.rentDate LIKE '${year}-01%' THEN CS.paymentStatus ELSE NULL END) AS januaryPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '${year}-02%' THEN CS.paymentStatus ELSE NULL END) AS februaryPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '${year}-03%' THEN CS.paymentStatus ELSE NULL END) AS marchPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '${year}-04%' THEN CS.paymentStatus ELSE NULL END) AS aprilPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '${year}-05%' THEN CS.paymentStatus ELSE NULL END) AS mayPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '${year}-06%' THEN CS.paymentStatus ELSE NULL END) AS junePaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '${year}-07%' THEN CS.paymentStatus ELSE NULL END) AS julyPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '${year}-08%' THEN CS.paymentStatus ELSE NULL END) AS augustPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '${year}-09%' THEN CS.paymentStatus ELSE NULL END) AS septemberPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '${year}-10%' THEN CS.paymentStatus ELSE NULL END) AS octoberPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '${year}-11%' THEN CS.paymentStatus ELSE NULL END) AS novemberPaymentStatus,
			    MAX(CASE WHEN CS.rentDate LIKE '${year}-12%' THEN CS.paymentStatus ELSE NULL END) AS decemberPaymentStatus
			FROM room AS R
			LEFT JOIN contract AS C
			ON R.id = C.roomId
			LEFT JOIN building AS B
			ON R.bldgId = B.id
			LEFT JOIN tenant AS T
			ON C.tenantId = T.id
			LEFT JOIN contract_Status AS CS 
			ON C.tenantId = CS.tenantId
			AND (CS.rentDate LIKE '${year}-01%' OR CS.rentDate LIKE '${year}-02%' OR CS.rentDate LIKE '${year}-03%' OR
			     CS.rentDate LIKE '${year}-04%' OR CS.rentDate LIKE '${year}-05%' OR CS.rentDate LIKE '${year}-06%' OR
			     CS.rentDate LIKE '${year}-07%' OR CS.rentDate LIKE '${year}-08%' OR CS.rentDate LIKE '${year}-09%' OR
			     CS.rentDate LIKE '${year}-10%' OR CS.rentDate LIKE '${year}-11%' OR CS.rentDate LIKE '${year}-12%')
			GROUP BY R.id
			HAVING B.id = #{bldgId}
			""")
	List<Dashboard> getRentStatus(int bldgId, int year);

	

}
