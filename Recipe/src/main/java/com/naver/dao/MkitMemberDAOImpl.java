package com.naver.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.vo.mkitMemberVo;

@Repository
public class MkitMemberDAOImpl implements MkitMemberDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertmkitmem(mkitMemberVo mkitvo) {
		sqlSession.insert("mkitjoin",mkitvo);
	}

	@Override
	public mkitMemberVo idcheck(String id) {
		return sqlSession.selectOne("mkit_idcheck", id);
	}

	@Override
	public mkitMemberVo loginCheck(String login_id) {
		return sqlSession.selectOne("mkit_loginCk",login_id);
	}

	@Override
	public int grantcheck(String login_id) {
		return sqlSession.selectOne("grantcheck", login_id);
	}

	@Override
	public mkitMemberVo findId(mkitMemberVo m) {
		return sqlSession.selectOne("find_id", m);
	}

	@Override
	public mkitMemberVo findPwd(mkitMemberVo m) {
		return sqlSession.selectOne("find_pwd",m);
	}

	@Override
	public mkitMemberVo readMember(String id) {
		return sqlSession.selectOne("readM", id);
	}

	@Override
	public String findpass(String id) {
		return sqlSession.selectOne("check_pas", id);
	}

	@Override
	public void deluser(String id) {
		sqlSession.delete("deluser", id);
	}

	@Override
	public void edituser(mkitMemberVo mmvo) {
		sqlSession.update("edituser", mmvo);
	}
	
}
