package com.naver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dao.MkitcustomDAO;
import com.naver.vo.MkitcustomVo;

@Service
public class MkitcustomServiceImpl implements MkitcustomService {
	
	@Autowired
	private MkitcustomDAO mkitcustomDao;	

	@Override
	public void insertcustom(MkitcustomVo mc) {
		mkitcustomDao.insertcustom(mc);
	}

	@Override
	public int getcustomCount(MkitcustomVo m) {
		 return this.mkitcustomDao.getCustomCount(m);
	}

	@Override
	public List<MkitcustomVo> getCustomList(MkitcustomVo m) {
		return this.mkitcustomDao.getCustomList(m);
	}

	@Override
	public void updateHit(int custom_no) {
		mkitcustomDao.updateHit(custom_no);
	}

	@Override
	public MkitcustomVo getCustomCont(int custom_no) {
		return mkitcustomDao.getCustomCont(custom_no);
	}

	@Override
	public void delcustom(int custom_no) {
		mkitcustomDao.delcustom(custom_no);
	}

	@Override
	public void editcustom(MkitcustomVo m) {
		mkitcustomDao.editcustom(m);
	}	
}
