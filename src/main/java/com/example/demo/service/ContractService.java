package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ContractRepository;
import com.example.demo.vo.Contract;

@Service
public class ContractService {

	@Autowired
	private ContractRepository contractRepository;

	public List<Contract> getForPrintContracts() {
		return contractRepository.getForPrintContracts();
	}
	
}
