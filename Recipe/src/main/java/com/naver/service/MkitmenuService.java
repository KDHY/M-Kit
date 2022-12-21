package com.naver.service;

import java.util.List;

import com.naver.vo.MkitmenuVo;

public interface MkitmenuService {

	void insertmenu(MkitmenuVo mm);

	int getmenuCount(MkitmenuVo mc);

	List<MkitmenuVo> getmenuList(MkitmenuVo mc);

	MkitmenuVo getmenuCont(int mk_id);

	List<MkitmenuVo> getbestmenu(MkitmenuVo mc);

}
