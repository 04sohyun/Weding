package com.oracle.Weding.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Board {
	private int    	b_num;      //글번호
	private String	main_cat;
	private String	mini_cat;
	private String	id;
	private String  b_title;   //글제목
	private String  b_content;   //글내용
	private String    b_date;      //글 작성일
	private String	b_image;   //이미지
	private int		b_group;   //답글 그룹
	private int		b_step;      //답글 순서
	private int		b_level;   //답글 들여쓰기
	private String  b_password;   //비밀글
	private String  b_category;   //비밀번호
	private String	p_num;
	private int		b_hit;
	   
	// 조회용
	private String search;      private String keyword;
	private String pageNum;  
	private int start;           private int end;
	
	
	private String answer;
	   
	   

}
