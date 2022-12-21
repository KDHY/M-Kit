package com.naver.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class mkitgongjiVo {
	private int gongji_no;
	private String gongji_title;
	private String gongji_writer;
	private String gongji_cont;
	private int gongji_hit;
	private String gongji_date;

	//페이징 관련변수
	private int startrow;//시작행 번호
	private int endrow;//끝행 번호

	//검색어와 검색필드 관련변수
	private String find_field;//검색필드
	private String find_name;//검색어	
}
