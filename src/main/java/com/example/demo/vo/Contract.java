package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Contract {
	private int id;
	private String regDate;
	private String updateDate;
	private String leaseType;
	private int deposit;
	private int rent;
	private int maintenanceFee;
	private String contractStartDate;
	private String contractEndDate;
	private String depositDate;
	private String rentDay;
	private int roomId;
	private int tenantId;
	
	private String bldgName;
	private String roomNum;
	private String tenantName;
	private String tenantPhone;
	private String tenantCarNum;
	
	

}
