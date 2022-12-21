package com.naver.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MkitcustomVo {
	private int custom_no;
	private String custom_title;
	private String custom_writer;
	private String custom_cont;
	private int custom_hit;
	private String custom_date;

	//페이징 관련변수
	private int startrow;//시작행 번호
	private int endrow;//끝행 번호

	//검색어와 검색필드 관련변수
	private String find_field;//검색필드
	private String find_name;//검색어	
}
