package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Building {
	private int id;
	private String regDate;
	private String updateDate;
	private String bldgName;
	private String bldgAdd;
	private int roomTotal;
	private String bldgMemo;

	private int roomNum;
	private String roomType;
	private String roomMemo;
	private int standardDeposit;
	private int standardRent;
	private int standardJeonse;
	private int bldgId;
}
