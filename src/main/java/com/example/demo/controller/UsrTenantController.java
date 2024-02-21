package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.TenantService;
import com.example.demo.vo.Tenant;

@Controller
public class UsrTenantController {

	@Autowired
	private TenantService tenantService;

	// 액션 메소드
	@RequestMapping("/usr/bg12343/tenant")
	public String getRoom(Model model) {

		List<Tenant> tenants = tenantService.getForPrintTenants();

		int tenantsCnt = tenants.size();

		model.addAttribute("tenantsCnt", tenantsCnt);
		model.addAttribute("tenants", tenants);
		return "usr/bg12343/tenant";
	}

}
