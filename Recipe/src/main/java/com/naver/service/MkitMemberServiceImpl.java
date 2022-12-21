package com.naver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dao.MkitMemberDAO;
import com.naver.vo.mkitMemberVo;

@Service
public class MkitMemberServiceImpl implements MkitMemberService {

	@Autowired
	private MkitMemberDAO mkitmemberDao;

	@Override
	public void insertmkitmem(mkitMemberVo mkitvo) {
		mkitmemberDao.insertmkitmem(mkitvo);
	}

	@Override
	public mkitMemberVo idCheck(String id) {
		return mkitmemberDao.idcheck(id);
	}

	@Override
	public mkitMemberVo loginCheck(String login_id) {
		return mkitmemberDao.loginCheck(login_id);
	}

	@Override
	public int grantcheck(String login_id) {
		return mkitmemberDao.grantcheck(login_id);
	}

	@Override
	public mkitMemberVo findId(mkitMemberVo m) {
		return mkitmemberDao.findId(m);
	}

	@Override
	public mkitMemberVo findPwd(mkitMemberVo m) {
		return mkitmemberDao.findPwd(m);
	}

	@Override
	public mkitMemberVo readMember(String id) {
		return mkitmemberDao.readMember(id);
	}

	@Override
	public String findpass(String id) {
		return mkitmemberDao.findpass(id);
	}

	@Override
	public void deluser(String id) {
		mkitmemberDao.deluser(id);
	}

	@Override
	public void edituser(mkitMemberVo mmvo) {
		mkitmemberDao.edituser(mmvo);
	}
}
