package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MaintenanceFeeRepository;
import com.example.demo.vo.MaintenanceFee;
import com.example.demo.vo.ResultData;

@Service
public class MaintenanceFeeService {

	@Autowired
	private MaintenanceFeeRepository maintenanceFeeRepository;

	public List<MaintenanceFee> getMaintenanceFeeMonthly(int bldgId, Integer year) {
		return maintenanceFeeRepository.getMaintenanceFeeMonthly(bldgId, year);
	}
	

	public List<MaintenanceFee> getMaintenanceFee(int bldgId, Integer year, Integer month) {
		return maintenanceFeeRepository.getMaintenanceFee(bldgId, year, month);
	}

	public ResultData modifyMaintenanceFee(int tenantId, int commonElec, int commonWater, int elevater, int internetTV,
			int fireSafety, int waterUse, int waterCost, int waterBill, int elecUse, int elecCost, int elecBill,
			int gasUse, int gasCost, int gasBill, int monthlyMaintenanceFee, int lateFee, int lateMaintenanceFee,
			int maintenanceFeeDate) {
		maintenanceFeeRepository.modifyMaintenanceFee(tenantId, commonElec, commonWater, elevater, internetTV,
				fireSafety, waterUse, waterCost, waterBill, elecUse, elecCost, elecBill, gasUse, gasCost, gasBill,
				monthlyMaintenanceFee, lateFee, lateMaintenanceFee, maintenanceFeeDate);
		return ResultData.from("S-1", "관리비정보가 수정되었습니다");
	}

	public int calculateBill(int use, int cost) {
		return use * cost;
	}

	public int sumMaintenanceFee(int waterBill, int elecBill, int gasBill) {
		return waterBill + elecBill + gasBill;
	}

	public int sumMaintenanceFee(int monthlyMaintenanceFee, int lateFee) {
		return monthlyMaintenanceFee + lateFee;
	}

	public int caculateLateFee(int monthlyMaintenanceFee) {
		return Math.round(monthlyMaintenanceFee / 20);
	}


}
