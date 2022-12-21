package com.naver.dao;

import java.util.List;

import com.naver.vo.mkitgongjiVo;

public interface mkitgongjiDAO {

	int getListCount(mkitgongjiVo m);

	List<mkitgongjiVo> getBoardList(mkitgongjiVo m);

	void updateHit(int gongji_no);

	mkitgongjiVo getGongjiCont(int gongji_no);

	void insertgongji(mkitgongjiVo g);

	void delgongji(int gongji_no);

	void editgongji(mkitgongjiVo mk);
	
}
