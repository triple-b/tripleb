package com.jh.tripleb.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.notice.model.vo.Notice;

@Repository("nDao")
public class NoticeDao {

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList");
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int nno) {
		 
		
		return sqlSession.selectOne("noticeMapper.selectNotice", nno);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int nno) {
		
		return sqlSession.update("noticeMapper.deleteNotice", nno);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	public ArrayList<Notice> mainNotice(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("noticeMapper.mainNotice");
	}

}
