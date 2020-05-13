package com.jh.tripleb.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.member.model.vo.MemberDtoU;

@Repository("mDao")
public class MemberDao {
	
	public ArrayList<MemberDtoU> selectListMember(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.selectListMember");
	}
	public ArrayList<MemberDtoU> pauseSelectListMember(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.pauseSelectListMember");
	}
	public ArrayList<MemberDtoU> blackSelectListMember(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.blackSelectListMember");
	}
	public ArrayList<MemberDtoU> expSelectListMember(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.expSelectListMember");
	}
	
	public MemberDtoU detailMember(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("memberMapper.detailMember", mno);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, MemberDtoU mto) {
		return sqlSession.update("memberMapper.updateMember", mto);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, int chk) {
		return sqlSession.update("memberMapper.deleteMember", chk);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, MemberDtoU mto) {
		return sqlSession.insert("memberMapper.insertMember", mto);
	}
	
	public int blackMember(SqlSessionTemplate sqlSession, MemberDtoU mto) {
		return sqlSession.update("memberMapper.blackMember", mto);
	}
	
	public int blackCancelMember(SqlSessionTemplate sqlSession, MemberDtoU mto) {
		return sqlSession.update("memberMapper.blackCancelMember", mto);
	}
	
	public int pauseMember(SqlSessionTemplate sqlSession, MemberDtoU mto) {
		return sqlSession.update("memberMapper.pauseMember", mto);
	}
	
	public int addDate(SqlSessionTemplate sqlSession, MemberDtoU mto) {
		return sqlSession.update("memberMapper.addDate", mto);
	}
	

}
