package com.naver.service;


import java.util.List;

import com.naver.vo.MkitcustomVo;

public interface MkitcustomService {

	void insertcustom(MkitcustomVo mc);
	int getcustomCount(MkitcustomVo m);
	List<MkitcustomVo> getCustomList(MkitcustomVo m);
	void updateHit(int custom_no);
	MkitcustomVo getCustomCont(int custom_no);
	void delcustom(int custom_no);
	void editcustom(MkitcustomVo m);

}
