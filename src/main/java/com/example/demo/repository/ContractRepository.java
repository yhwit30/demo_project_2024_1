package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Contract;

@Mapper
public interface ContractRepository {

	@Select("""
			SELECT *
			FROM contract AS C
			LEFT JOIN room AS R
			ON C.roomId = R.id
			LEFT JOIN building AS B
			ON R.bldgId = B.id
			LEFT JOIN tenant AS T
			ON C.tenantId = T.id
			GROUP BY C.id;
			""")
	List<Contract> getForPrintContracts();

	@Update("""
			<script>
			UPDATE contract AS C INNER JOIN Tenant AS T
			ON C.tenantId = T.id
			SET C.updateDate = NOW(),
			T.tenantName = #{tenantName},
			C.leaseType = #{leaseType},
			C.deposit = #{deposit},
			C.rent = #{rent},
			C.maintenanceFee = #{maintenanceFee},
			C.contractStartDate = #{contractStartDate},
			C.contractEndDate = #{contractEndDate},
			C.depositDate = #{depositDate},
			C.rentDate = #{rentDate}
			WHERE C.id = #{id}
			</script>
			""")
	void modifyContract(int id, String tenantName, String leaseType, int deposit, int rent, int maintenanceFee,
			String contractStartDate, String contractEndDate, String depositDate, String rentDate);

	@Insert("""
			INSERT INTO contract (tenantId, updateDate, leaseType, deposit, rent, maintenanceFee, contractStartDate, contractEndDate, depositDate, rentDate)
			SELECT T.id, NOW(), #{leaseType}, #{deposit}, #{rent}, #{maintenanceFee}, #{contractStartDate}, #{contractEndDate}, #{depositDate}, #{rentDate}
			FROM Tenant AS T
			WHERE T.tenantName = #{tenantName};
			""")
	void addContract(int tenantId, String tenantName, int tenantPhone, String leaseType, int deposit, int rent,
			int maintenanceFee, String contractStartDate, String contractEndDate, String depositDate, String rentDate);

}
