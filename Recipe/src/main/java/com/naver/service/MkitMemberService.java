package com.naver.service;

import com.naver.vo.mkitMemberVo;

public interface MkitMemberService {

	public void insertmkitmem(mkitMemberVo mkitvo);

	public mkitMemberVo idCheck(String id);

	public mkitMemberVo loginCheck(String login_id);

	public int grantcheck(String login_id);

	public mkitMemberVo findId(mkitMemberVo m);

	public mkitMemberVo findPwd(mkitMemberVo m);

	public mkitMemberVo readMember(String id);

	public String findpass(String id);

	public void deluser(String id);

	public void edituser(mkitMemberVo mmvo);

}
