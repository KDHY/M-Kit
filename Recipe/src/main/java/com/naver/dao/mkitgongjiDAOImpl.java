package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.vo.mkitgongjiVo;

@Repository
public class mkitgongjiDAOImpl implements mkitgongjiDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getListCount(mkitgongjiVo m) {
		return sqlSession.selectOne("gongji_count",m);
	}

	@Override
	public List<mkitgongjiVo> getBoardList(mkitgongjiVo m) {
		return sqlSession.selectList("gongji_li", m);
	}

	@Override
	public void updateHit(int gongji_no) {
		sqlSession.update("update_hit", gongji_no);
	}

	@Override
	public mkitgongjiVo getGongjiCont(int gongji_no) {
		return sqlSession.selectOne("gong_cont", gongji_no);
	}

	@Override
	public void insertgongji(mkitgongjiVo g) {
		sqlSession.insert("gong_insert",g);
	}

	@Override
	public void delgongji(int gongji_no) {
		sqlSession.delete("gong_del", gongji_no);
	}

	@Override
	public void editgongji(mkitgongjiVo mk) {
		sqlSession.update("gong_edit", mk);
	}

	
}
