package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Tenant;

@Mapper
public interface TenantRepository {

	@Select("""
			SELECT *
			FROM tenant AS T
			LEFT JOIN contract AS C
			ON T.roomId = C.roomId
			LEFT JOIN room AS R
			ON T.roomId = R.id
			LEFT JOIN building AS B
			ON R.bldgId = B.id;
			""")
	public List<Tenant> getForPrintTenants();

}
