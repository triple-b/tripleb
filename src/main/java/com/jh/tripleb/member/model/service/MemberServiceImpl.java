package com.jh.tripleb.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jh.tripleb.member.model.dao.MemberDao;
import com.jh.tripleb.member.model.vo.MemberDtoU;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao mDao;
	
	
	@Override
	public ArrayList<MemberDtoU> selectListMember() {
		return mDao.selectListMember(sqlSession);
	}

	@Override
	public ArrayList<MemberDtoU> pauseSelectListMember() {
		return mDao.pauseSelectListMember(sqlSession);
	}

	@Override
	public ArrayList<MemberDtoU> blackSelectListMember() {
		return mDao.blackSelectListMember(sqlSession);
	}

	@Override
	public ArrayList<MemberDtoU> expSelectListMember() {
		return mDao.expSelectListMember(sqlSession);
	}

	@Override
	public MemberDtoU detailMember(int mno) {
		return mDao.detailMember(sqlSession, mno);
	}

	@Override
	public int updateMember(MemberDtoU mto) {
		return mDao.updateMember(sqlSession, mto);
	}

	@Override
	public int deleteMember(int chk) {
		return mDao.deleteMember(sqlSession, chk);
	}

	@Override
	public int insertMember(MemberDtoU mto) {
		return mDao.insertMember(sqlSession, mto);
	}

	@Override
	public int blackMember(MemberDtoU mto) {
		return mDao.blackMember(sqlSession, mto);
	}

	@Override
	public int blackCancelMember(MemberDtoU mto) {
		return mDao.blackCancelMember(sqlSession, mto);
	}

	@Override
	public int pauseMember(MemberDtoU mto) {
		return mDao.pauseMember(sqlSession, mto);
	}

	@Override
	public int addDate(MemberDtoU mto) {
		return mDao.addDate(sqlSession, mto);
	}

	@Override
	public int pauseLate(int mno) {
		return mDao.pauseLate(sqlSession, mno);
	}

}
