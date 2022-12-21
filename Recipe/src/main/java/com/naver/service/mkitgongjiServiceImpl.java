package com.naver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dao.mkitgongjiDAO;
import com.naver.vo.mkitgongjiVo;

@Service
public class mkitgongjiServiceImpl implements mkitgongjiService{

	@Autowired
	private mkitgongjiDAO mkitgongjiDao;

	@Override
	public int getListCount(mkitgongjiVo m) {
		return mkitgongjiDao.getListCount(m);
	}

	@Override
	public List<mkitgongjiVo> getBoardList(mkitgongjiVo m) {
		return mkitgongjiDao.getBoardList(m);
	}

	@Override
	public void updateHit(int gongji_no) {
		mkitgongjiDao.updateHit(gongji_no);
	}

	@Override
	public mkitgongjiVo getGongjiCont(int gongji_no) {
		return mkitgongjiDao.getGongjiCont(gongji_no);
	}

	@Override
	public void insertgongji(mkitgongjiVo g) {
		mkitgongjiDao.insertgongji(g);
	}

	@Override
	public void delgongji(int gongji_no) {
		mkitgongjiDao.delgongji(gongji_no);
	}

	@Override
	public void editgongji(mkitgongjiVo mk) {
		mkitgongjiDao.editgongji(mk);
	}

}
