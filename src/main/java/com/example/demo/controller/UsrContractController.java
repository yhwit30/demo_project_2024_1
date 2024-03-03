package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.BuildingService;
import com.example.demo.service.ContractService;
import com.example.demo.service.TenantService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Building;
import com.example.demo.vo.Contract;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Room;

@Controller
public class UsrContractController {

	@Autowired
	private ContractService contractService;

	@Autowired
	private BuildingService buildingService;

	@Autowired
	private TenantService tenantService;

	// 액션 메소드
	@RequestMapping("/usr/bg12343/contract")
	public String getContract(Model model) {

		List<Contract> contracts = contractService.getForPrintContracts();

		int contractsCnt = contracts.size();

		model.addAttribute("contractsCnt", contractsCnt);
		model.addAttribute("contracts", contracts);
		return "usr/bg12343/contract";
	}

	@RequestMapping("/usr/bg12343/contractSetupAdd")
	public String addContract(Model model) {

		int getLastBldgId = buildingService.getLastBldgId();
		Building addedBuilding = buildingService.getForPrintBuilding(getLastBldgId);
		List<Room> rooms = buildingService.getForPrintRooms(getLastBldgId);

		model.addAttribute("addedBuilding", addedBuilding);
		model.addAttribute("rooms", rooms);
		return "usr/bg12343/contractSetupAdd";
	}

	@RequestMapping("/usr/bg12343/doContractSetupAdd")
	@ResponseBody
	public String doContractSetupAdd(int roomId[], String[] tenantName, int[] tenantPhone, String[] tenantCarNum,
			String[] leaseType, int[] deposit, int[] rent, int[] maintenanceFee, String[] contractStartDate,
			String[] contractEndDate, String[] depositDate, String[] rentDate) {

		// Contract 객체를 생성하고 컨트롤러에서 넘어온 값들을 저장한다.
		List<Contract> contractSet = new ArrayList<>();
		for (int i = 0; i < roomId.length; i++) {
		    Contract contract = new Contract(); 
		    contract.setRoomId(roomId[i]); 
		    contract.setTenantName(tenantName[i]); 
		    contract.setTenantPhone(tenantPhone[i]); 
		    contract.setTenantCarNum(tenantCarNum[i]); 
		    contract.setLeaseType(leaseType[i]); 
		    contract.setDeposit(deposit[i]); 
		    contract.setRent(rent[i]); 
		    contract.setMaintenanceFee(maintenanceFee[i]); 
		    contract.setContractStartDate(contractStartDate[i]); 
		    contract.setContractEndDate(contractEndDate[i]); 
		    contract.setDepositDate(depositDate[i]); 
		    contract.setRentDate(rentDate[i]);
		    
		    // leaseType이 0이 아닌 경우에만 contractSet에 추가한다.
		    if (!"0".equals(contract.getLeaseType())) {
		        contractSet.add(contract);
		    }
		}

		System.out.println(contractSet.toString());
		
		
		
		// tenantId가 먼저 있어야 계약정보 insert가 가능하다
		boolean tenantDataCheck = false;
		for (int i = 0; i < contractSet.size(); i++) {
			Contract contract = contractSet.get(i);
			tenantDataCheck = tenantService.isTenantData(contract.getRoomId());
			if (!tenantDataCheck) {
				return Ut.jsReplace("F-1", "이미 roomId가 있습니다", "../bg12343/contract");
			}

			tenantService.addTenantSetup(contract.getRoomId(), contract.getTenantName(), contract.getTenantPhone(),contract.getTenantCarNum());
		}

		// tenantId 가져오기
		int[] tenantIds = new int[contractSet.size()];
		for (int i = 0; i < contractSet.size(); i++) {
			Contract contract = contractSet.get(i);
		    tenantIds[i] = tenantService.getTenantIds(contract.getRoomId());
		}
		
		
		if(contractSet.isEmpty()) {
			return Ut.jsReplace("S-2", "모두 공실처리되었습니다", "../bg12343/contract");
		}

		
		 // 공실을 제외한 데이터 contract 데이터베이스에 넣기
	    for (int i = 0; i < contractSet.size(); i++) {
	        Contract contract = contractSet.get(i);
	        ResultData contractAddRd = contractService.addContractSetup(contract.getRoomId(), contract.getLeaseType(), contract.getDeposit(),
	                contract.getRent(), contract.getMaintenanceFee(), contract.getContractStartDate(), contract.getContractEndDate(),
	                contract.getDepositDate(), contract.getRentDate(), tenantIds[i]);
	       
	    }

	    return Ut.jsReplace("S-1", "계약 정보가 추가되었습니다", "../bg12343/contract");
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

		return Ut.jsReplace(contractModifyRd.getResultCode(), contractModifyRd.getMsg(), "../bg12343/contract");
	}

}
