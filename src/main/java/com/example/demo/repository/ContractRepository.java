package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Contract;

@Mapper
public interface ContractRepository {

	
	@Select("""
			SELECT *
			FROM contract
			""")
	List<Contract> getForPrintContracts();

}
