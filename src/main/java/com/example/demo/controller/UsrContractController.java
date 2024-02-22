package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ContractService;
import com.example.demo.vo.Contract;

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


}
