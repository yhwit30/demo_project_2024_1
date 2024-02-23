package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.TenantRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Tenant;

@Service
public class TenantService {

	@Autowired
	private TenantRepository tenantRepository;

	public List<Tenant> getForPrintTenants() {
		return tenantRepository.getForPrintTenants();
	}

	public ResultData addTenant(String tenantName, int tenantPhone, String tenantCarNum) {
		tenantRepository.addTenant(tenantName, tenantPhone, tenantCarNum);
		int id = tenantRepository.getLastInsertId();
		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
	}

	public ResultData modifyTenant(int id, String tenantName, int tenantPhone, String tenantCarNum, String tenantMemo) {
		tenantRepository.modifyBuilding(id, tenantName, tenantPhone, tenantCarNum, tenantMemo);
		return ResultData.from("S-1", "세입자정보가 수정되었습니다");
	}


}
