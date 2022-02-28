package com.oracle.Weding.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Orders {
	private String id;
	private String p_num;
	private String o_num;
	private int o_qty;
	private int o_sum;
	private String o_phone;
	private String o_zipcode;
	private String o_roadAddress;
	private String o_detailAddress;
	private String o_payday;
	private String o_shipStatus;
	
	//조회용
	private String p_condition;
	private String p_name;
	
	private int start;
	private int end;
	
	private String success;
	
	private int p_price;
}
