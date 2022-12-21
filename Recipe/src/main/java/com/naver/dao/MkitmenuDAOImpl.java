package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.vo.MkitmenuVo;

@Repository
public class MkitmenuDAOImpl implements MkitmenuDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertmenu(MkitmenuVo mm) {
		sqlSession.insert("menu_in", mm);
	}

	@Override
	public int getmenuCount(MkitmenuVo mc) {
		return sqlSession.selectOne("countmenu",mc);
	}

	@Override
	public List<MkitmenuVo> getmenuList(MkitmenuVo mc) {
		return sqlSession.selectList("menulist",mc);
	}

	@Override
	public MkitmenuVo getmenuCont(int mk_id) {
		return sqlSession.selectOne("menucont", mk_id);
	}

	@Override
	public List<MkitmenuVo> getbestmenu(MkitmenuVo mc) {
		return sqlSession.selectList("bestmenu", mc);
	}

}
