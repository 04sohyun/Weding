package com.oracle.Weding.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Product {
	private String p_num;			//상품번호 
	private String id;				//판매자아이디
	private String main_cat;		//대분류
	private String mini_cat;		//중분류
	private String p_name;			//상품이름
	private String p_description;	//상품설명 
	private String p_start;			//펀딩시작
	private String p_end;			//펀딩종료
	private String p_time;			//펀딩시간
	private int p_currentprice;		//현재달성금액
	private int p_goalprice;		//목표금액
	private String p_image1;		//상품이미지1
	private String p_image2;		//상품이미지2
	private String p_condition;		//펀딩상태(1.펀딩예정, 2.펀딩중, 3.펀딩종료)
	private int	p_price;			//상품가격
	private String p_store;			//판매업체
	
	// 조회용
	private String search;   	private String keyword;
	private String pageNum;  
	private int start; 		 	private int end;
	
	// 마이페이지 - 찜목록 조회용 
	private String consumer_id;     // member 소비자Id
	private String main_content;	//대분류 내용
	private String mini_content;	//중분류 내용
	private String leftdate;	 //남은기간
	
	private int attainment;  //달성률 
	
	// 주문한 사람 정보 
	private int countOrders;   // 주문한 사람 수
	
	private int alarmingDate; //상품오픈까지 남은 시간 
	private int countAlarm; //알림신청한 사람 수
	
	private String sort; // 정렬
	
	private int cntAnswer; //1:1문의 소비자 판매자 연결

	
}
