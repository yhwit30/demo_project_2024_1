package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

	@Insert("""
			INSERT INTO
			tenant SET
			regDate = NOW(),
			updateDate = NOW(),
			tenantName = #{tenantName},
			tenantPhone = #{tenantPhone},
			tenantCarNum = #{tenantCarNum},
			tenantMemo = '세입자메모 테스트',
			roomId = 7
			""")
	public void addTenant(String tenantName, int tenantPhone, String tenantCarNum);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Update("""
			UPDATE tenant
			SET tenantName = #{tenantName},
			tenantPhone = #{tenantPhone},
			tenantCarNum = #{tenantCarNum}
			WHERE id = #{id}
			""")
	public void modifyBuilding(int id, String tenantName, int tenantPhone, String tenantCarNum);

//	@Insert("""
//			INSERT INTO tenant
//			SET regDate = NOW()
//			""")
//	public void addFirstTenant();

}
