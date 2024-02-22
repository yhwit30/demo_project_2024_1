package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room {
	private int id;
	private String regDate;
	private String updateDate;
	private int roomNum;
	private String roomType;
	private String roomMemo;
	private int standardDeposit;
	private int standardRent;
	private int standardJeonse;

	private String bldgName;

}
