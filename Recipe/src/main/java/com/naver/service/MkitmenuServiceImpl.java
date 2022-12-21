package com.naver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dao.MkitmenuDAO;
import com.naver.vo.MkitmenuVo;

@Service
public class MkitmenuServiceImpl implements MkitmenuService {

	@Autowired
	private MkitmenuDAO mkitmenuDao;

	@Override
	public void insertmenu(MkitmenuVo mm) {
		mkitmenuDao.insertmenu(mm);
	}

	@Override
	public int getmenuCount(MkitmenuVo mc) {
		return mkitmenuDao.getmenuCount(mc);
	}

	@Override
	public List<MkitmenuVo> getmenuList(MkitmenuVo mc) {
		return mkitmenuDao.getmenuList(mc);
	}

	@Override
	public MkitmenuVo getmenuCont(int mk_id) {
		return mkitmenuDao.getmenuCont(mk_id);
	}

	@Override
	public List<MkitmenuVo> getbestmenu(MkitmenuVo mc) {
		return mkitmenuDao.getbestmenu(mc);
	}
}
