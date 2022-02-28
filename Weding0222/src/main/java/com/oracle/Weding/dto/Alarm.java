package com.oracle.Weding.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Alarm {
	private String p_num;
	private String id;
	private String a_date;
	private String a_time;
	
	//알림신청한 사람들 이메일 담아오기
	private String name;
	private String email;  
	private String p_name; 

}