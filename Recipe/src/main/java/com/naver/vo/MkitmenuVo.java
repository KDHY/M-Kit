package com.naver.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MkitmenuVo {

	private String mk_id; /*품목 번호*/
	private String mk_name;/*품목명*/
	private int mk_price;/*가격*/
	private String mk_images;/*메인 이미지*/
	private String mk_info;/*상품 상세정보*/
	private int mk_sell;/*판매량*/
	private String mk_date;/*등록 날짜*/

	//페이징 관련변수
	private int startrow;//시작행 번호
	private int endrow;//끝행 번호

	//검색어와 검색필드 관련변수
	private String find_field;//검색필드
	private String find_name;//검색어	
}
