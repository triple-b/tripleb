package com.jh.tripleb.member.model.service;

import java.util.ArrayList;

import com.jh.tripleb.member.model.vo.MemberDtoU;

public interface MemberService{
	
	// 1. 회원 전체 조회 (주)
	ArrayList<MemberDtoU> selectListMember();
	// 2. 일시정지 회원 조회 (주)
	ArrayList<MemberDtoU> pauseSelectListMember();
	// 3. 블랙 회원 조회 (주)
	ArrayList<MemberDtoU> blackSelectListMember();
	// 4. 만료 회원 조회 (주)
	ArrayList<MemberDtoU> expSelectListMember();
	// 5. 회원 상세 조회 (주)
	MemberDtoU detailMember(int mno);
	// 6. 회원 수정 (주)
	int updateMember(MemberDtoU mto);
	// 7. 회원 삭제 (주)
	int deleteMember(int chk);
	// 8. 회원 등록 (주)
	int insertMember(MemberDtoU mto);
	// 9. 블랙리스트 등록 (주)
	int blackMember(MemberDtoU mto);
	// 10. 블랙리스트 해제 (주)
	int blackCancelMember(MemberDtoU mto);
	// 11. 일시정지 등록 (주)
	int pauseMember(MemberDtoU mto);
	// 12. 회원권 종료일 증가 (주)
	int addDate(MemberDtoU mto);
	// 13. 리스트 조회 시 일시정지 상태 변경 (주)
	int pauseLate(int mno);
	// 14. 일시정지 해제(주)
	int pauseCancelMember(MemberDtoU mto);
	
	

}
