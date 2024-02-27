package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.DashboardRepository;
import com.example.demo.vo.Dashboard;

@Service
public class DashboardService {
	
	@Autowired
	private DashboardRepository dashboardRepository;

	public List<Dashboard> getDashboard() {
		return dashboardRepository.getDashboard();
	}

	public List<Dashboard> getRentStatus(int bldgId) {
		return dashboardRepository.getRentStatus(bldgId);
	}



}
