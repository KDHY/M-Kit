package com.naver.dao;


import java.util.List;

import com.naver.vo.MkitmenuVo;

public interface MkitmenuDAO {

	void insertmenu(MkitmenuVo mm);

	int getmenuCount(MkitmenuVo mc);

	List<MkitmenuVo> getmenuList(MkitmenuVo mc);

	MkitmenuVo getmenuCont(int mk_id);

	List<MkitmenuVo> getbestmenu(MkitmenuVo mc);

}
