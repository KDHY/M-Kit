package com.naver.dao;

import com.naver.vo.mkitMemberVo;

public interface MkitMemberDAO {

	void insertmkitmem(mkitMemberVo mkitvo);

	mkitMemberVo idcheck(String id);

	mkitMemberVo loginCheck(String login_id);

	int grantcheck(String login_id);

	mkitMemberVo findId(mkitMemberVo m);

	mkitMemberVo findPwd(mkitMemberVo m);

	mkitMemberVo readMember(String id);

	String findpass(String id);

	void deluser(String id);

	void edituser(mkitMemberVo mmvo);

}
