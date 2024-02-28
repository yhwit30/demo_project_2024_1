package com.example.demo.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MaintenanceFeeService;
import com.example.demo.util.Ut;
import com.example.demo.vo.MaintenanceFee;
import com.example.demo.vo.ResultData;

@Controller
public class UsrMaintenanceFeeController {

	LocalDate now = LocalDate.now();
	int nowYear = now.getYear();
	int nowMonth = now.getMonthValue();

	@Autowired
	private MaintenanceFeeService maintenanceFeeService;

	// 액션 메소드
	@RequestMapping("/usr/bg12343/maintenanceFee")
	public String getMaintenanceFee(Model model, @RequestParam(defaultValue = "1") int bldgId, Integer year) {

		// RequestParam 기본값문법으로 nowYear 데이터가 잘 안 들어가서 이렇게 체크
		if (year == null) {
			year = nowYear;
		}

		List<MaintenanceFee> maintenanceFeeMonthly = maintenanceFeeService.getMaintenanceFeeMonthly(bldgId, year);

		model.addAttribute("maintenanceFeeMonthly", maintenanceFeeMonthly);
		return "usr/bg12343/maintenanceFee";
	}

	@RequestMapping("/usr/bg12343/maintenanceFeeDetail")
	public String getMaintenanceFeeDetail(Model model, @RequestParam(defaultValue = "1") int bldgId, Integer year, Integer month) {

		// RequestParam 기본값문법으로 nowYear 데이터가 잘 안 들어가서 이렇게 체크
		if (year == null) {
			year = nowYear;
		}
		if (month == null) {
			month = nowMonth;
		}

		List<MaintenanceFee> maintenanceFee = maintenanceFeeService.getMaintenanceFee(bldgId, year, month);

		model.addAttribute("maintenanceFee", maintenanceFee);
		return "usr/bg12343/maintenanceFeeDetail";
	}

	@RequestMapping("/usr/bg12343/maintenanceFeeModify")
	public String showMaintenanceFeeModify(Model model, @RequestParam(defaultValue = "1") int bldgId, Integer year) {

		// RequestParam 기본값문법으로 nowYear 데이터가 잘 안 들어가서 이렇게 체크
		if (year == null) {
			year = nowYear;
		}

//		List<MaintenanceFee> maintenanceFee = maintenanceFeeService.getMaintenanceFee(bldgId, year);
//		model.addAttribute("maintenanceFee", maintenanceFee);
		return "usr/bg12343/maintenanceFeeModify";
	}

	@RequestMapping("/usr/bg12343/doMaintenanceFeeModify")
	@ResponseBody
	public String doMaintenanceFeeModify(int[] tenantId, int[] commonElec, int[] commonWater, int[] elevater,
			int[] internetTV, int[] fireSafety, int[] waterUse, int[] waterCost, int[] elecUse, int[] elecCost,
			int[] gasUse, int[] gasCost, int[] maintenanceFeeDate) {

		int[] waterBill = new int[tenantId.length];
		int[] elecBill = new int[tenantId.length];
		int[] gasBill = new int[tenantId.length];
		int[] monthlyMaintenanceFee = new int[tenantId.length];
		int[] lateFee = new int[tenantId.length];
		int[] lateMaintenanceFee = new int[tenantId.length];

		ResultData maintenanceFeeModifyRd = null;
		for (int i = 0; i < tenantId.length; i++) {

			waterBill[i] = maintenanceFeeService.calculateBill(waterUse[i], waterCost[i]);
			elecBill[i] = maintenanceFeeService.calculateBill(elecUse[i], elecCost[i]);
			gasBill[i] = maintenanceFeeService.calculateBill(gasUse[i], gasCost[i]);
			monthlyMaintenanceFee[i] = maintenanceFeeService.sumMaintenanceFee(waterBill[i], elecBill[i], gasBill[i]);
			lateFee[i] = maintenanceFeeService.caculateLateFee(monthlyMaintenanceFee[i]);
			lateMaintenanceFee[i] = maintenanceFeeService.sumMaintenanceFee(monthlyMaintenanceFee[i], lateFee[i]);

			maintenanceFeeModifyRd = maintenanceFeeService.modifyMaintenanceFee(tenantId[i], commonElec[i],
					commonWater[i], elevater[i], internetTV[i], fireSafety[i], waterUse[i], waterCost[i], waterBill[i],
					elecUse[i], elecCost[i], elecBill[i], gasUse[i], gasCost[i], gasBill[i], monthlyMaintenanceFee[i],
					lateFee[i], lateMaintenanceFee[i], maintenanceFeeDate[i]);
		}

		return Ut.jsReplace(maintenanceFeeModifyRd.getResultCode(), maintenanceFeeModifyRd.getMsg(),
				"../bg12343/maintenanceFee");
	}

}
