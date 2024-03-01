package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ContractService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Contract;
import com.example.demo.vo.ResultData;

@Controller
public class UsrContractController {

	@Autowired
	private ContractService contractService;

	// 액션 메소드
	@RequestMapping("/usr/bg12343/contract")
	public String getContract(Model model) {

		List<Contract> contracts = contractService.getForPrintContracts();

		int contractsCnt = contracts.size();

		model.addAttribute("contractsCnt", contractsCnt);
		model.addAttribute("contracts", contracts);
		return "usr/bg12343/contract";
	}
	
	@RequestMapping("/usr/bg12343/contractAdd")
	public String addContract(Model model) {

		List<Contract> contracts = contractService.getForPrintContracts();

		int contractsCnt = contracts.size();

		model.addAttribute("contractsCnt", contractsCnt);
		model.addAttribute("contracts", contracts);
		return "usr/bg12343/contractAdd";
	}
	
	@RequestMapping("/usr/bg12343/doContractAdd")
	@ResponseBody
	public String doContractAdd() {
		
		// 계약 작성 작업
//		ResultData BuildingAddRd = buildingService.addBuilding(bldgName, bldgAdd, roomTotal);
//
//		return Ut.jsReplace(BuildingAddRd.getResultCode(), BuildingAddRd.getMsg(), "../bg12343/roomAdd");
		return null;
	}

	@RequestMapping("/usr/bg12343/contractModify")
	public String modifyContract(Model model) {

		List<Contract> contracts = contractService.getForPrintContracts();

		int contractsCnt = contracts.size();

		model.addAttribute("contractsCnt", contractsCnt);
		model.addAttribute("contracts", contracts);
		return "usr/bg12343/contractModify";
	}

	@RequestMapping("/usr/bg12343/doContractModify")
	@ResponseBody
	public String doContractModify(int id[], String[] tenantName, String[] leaseType, int[] deposit, int[] rent,
			int[] maintenanceFee, String[] contractStartDate, String[] contractEndDate, String[] depositDate,
			String[] rentDate) {

		ResultData contractModifyRd = null;
		for (int i = 0; i < id.length; i++) {
			contractModifyRd = contractService.modifyContract(id[i], tenantName[i], leaseType[i], deposit[i], rent[i],
					maintenanceFee[i], contractStartDate[i], contractEndDate[i], depositDate[i], rentDate[i]);
		}

		return Ut.jsReplace(contractModifyRd.getResultCode(), contractModifyRd.getMsg(),
				"../bg12343/contract");
	}

}
