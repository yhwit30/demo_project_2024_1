package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.TenantRepository;
import com.example.demo.vo.Tenant;

@Service
public class TenantService {

	@Autowired
	private TenantRepository tenantRepository;

	public List<Tenant> getForPrintTenants() {
		return tenantRepository.getForPrintTenants();
	}

}
