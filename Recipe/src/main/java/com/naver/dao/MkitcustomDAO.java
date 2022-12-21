package com.naver.dao;

import java.util.List;

import com.naver.vo.MkitcustomVo;

public interface MkitcustomDAO {	

	void insertcustom(MkitcustomVo mc);
	int getCustomCount(MkitcustomVo m);
	List<MkitcustomVo> getCustomList(MkitcustomVo m);
	void updateHit(int custom_no);
	MkitcustomVo getCustomCont(int custom_no);
	void delcustom(int custom_no);
	void editcustom(MkitcustomVo m);

}
