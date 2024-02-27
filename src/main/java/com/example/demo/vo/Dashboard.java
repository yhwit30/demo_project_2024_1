package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dashboard {

	private int id;
	private String regDate;
	private String updateDate;
	private int standardDeposit;
	private int standardRent;
	private int standardJeonse;
	private String leaseType;
	private String deposit;
	private String rent;
	private String maintenanceFee;
	private String contractStartDate;
	private String contractEndDate;
	private String depositDate;
	private String rentDate;

	private int bldgId;
	private String bldgName;
	private String roomNum;
	private String tenantName;
	private String tenantPhone;
	private String januaryPaymentStatus;
	private String februaryPaymentStatus;
	private String marchPaymentStatus;
	private String aprilPaymentStatus;
	private String mayPaymentStatus;
	private String junePaymentStatus;
	private String julyPaymentStatus;
	private String augustPaymentStatus;
	private String septemberPaymentStatus;
	private String octoberPaymentStatus;
	private String novemberPaymentStatus;
	private String decemberPaymentStatus;

}
