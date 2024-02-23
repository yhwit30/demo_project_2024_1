package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

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

}
