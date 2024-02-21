package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Tenant;

@Mapper
public interface TenantRepository {

	@Select("""
			SELECT *
			FROM tenant
			""")
	public List<Tenant> getForPrintTenants();

}
