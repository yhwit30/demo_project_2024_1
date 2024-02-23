package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MaintenanceFeeRepository;
import com.example.demo.vo.MaintenanceFee;

@Service
public class MaintenanceFeeService {

	@Autowired
	private MaintenanceFeeRepository maintenanceFeeRepository;

	public List<MaintenanceFee> getMaintenanceFee() {
		return maintenanceFeeRepository.getMaintenanceFee();
	}
	
	
	
	
	
	
}
