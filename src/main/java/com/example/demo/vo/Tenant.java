package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tenant {
	private int id;
	private String regDate;
	private String updateDate;
	private String tenantName;
	private int tenantPhone;
	private String tenantCarNum;
	private String tenantMemo;
	private int roomId;
	
	
	private String bldgName;

}
