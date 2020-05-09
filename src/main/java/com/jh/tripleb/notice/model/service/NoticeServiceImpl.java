package com.jh.tripleb.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.notice.model.dao.NoticeDao;
import com.jh.tripleb.notice.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private NoticeDao nDao;

	@Override
	public ArrayList<Notice> selectList() {
		
		return nDao.selectList(sqlSession);
	}

	@Override
	public int insertNotice(Notice n) {
		
		return nDao.insertNotice(sqlSession, n);
	}

	@Override
	public Notice selectNotice(int nno) {
		
		return nDao.selectNotice(sqlSession, nno);
	}

	@Override
	public int deleteNotice(int nno) {
		
		return nDao.deleteNotice(sqlSession, nno);
	}

	@Override
	public int updateNotice(Notice n) {
	
		return nDao.updateNotice(sqlSession, n);
	}

	@Override
	public ArrayList<Notice> mainNotice() {
		return nDao.mainNotice(sqlSession);
	}

}
