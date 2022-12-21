package com.naver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dao.MkitDAO;

@Service
public class MkitServiceImpl implements MkitService{
	
	@Autowired
	private MkitDAO mkitDao;
}
