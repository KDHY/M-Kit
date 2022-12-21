package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.vo.MkitcustomVo;

@Repository
public class MkitcustomDAOImpl implements MkitcustomDAO {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public void insertcustom(MkitcustomVo mc) {
		sqlSession.insert("cus_insert", mc);
	}


	@Override
	public int getCustomCount(MkitcustomVo m) {		
		return sqlSession.selectOne("cus_count",m);
	}//검색전후 레코드 개수


	@Override
	public List<MkitcustomVo> getCustomList(MkitcustomVo m) {
		return this.sqlSession.selectList("cus_li",m);
	}


	@Override
	public void updateHit(int custom_no) {
		sqlSession.update("up_hit", custom_no);
	}


	@Override
	public MkitcustomVo getCustomCont(int custom_no) {
		return sqlSession.selectOne("cus_cont", custom_no);
	}


	@Override
	public void delcustom(int custom_no) {
		sqlSession.delete("cus_del", custom_no);
	}


	@Override
	public void editcustom(MkitcustomVo m) {
		sqlSession.update("cus_edit", m);
	}
}
