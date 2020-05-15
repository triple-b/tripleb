package com.jh.tripleb.trainer.model.service;

import java.util.ArrayList;

import com.jh.tripleb.trainer.model.vo.Trainer;

/**
 * @author 김주
 *
 */
public interface TrainerService {
	
	
	// 트레이너 전체 리스트 (로그인 리스트도 불러옴)
	/**
	 * @author 김주
	 * @return			전체 트레이너의 전체 정보
	 */
	ArrayList<Trainer> listTrainer();
	
	// 트레이너 변경 서비스
	/**
	 * @param t			트레이너 번호 + 비밀번호 가 담긴 객체 정보
	 * @return
	 */
	Trainer changeTrainer(Trainer t);
	
	// 트레이너 마이프로필 서비스
	/**
	 * @param t			수정할 값이 담긴 트레이너 객체
	 * @author 김주
	 * @return			처리된 행의 개수
	 */
	int updateTrainerProfile(Trainer t);
	
	// 트레이너 상세보기 서비스
	/**
	 * @param tno		클릭 시 전달 받은 트레이너 번호
	 * @author 김주
	 * @return			처리된 행의 개수
	 */
	
	int updateTrainer(Trainer t);
	
	// 트레이너 상세보기 서비스
	/**
	 * @param tno		클릭 시 전달 받은 트레이너 번호
	 * @author 김주
	 * @return			처리된 행의 개수
	 */
	
	
	Trainer detailTrainer(int tno);
	
	/** 1_1. 핸드폰번호 찾기 서비스
	 * @param phone		전달 받은 트레이너 핸드폰 번호
	 * @author 김주
	 * @return			조회된 트레이너 객체
	 */
	Trainer searchPhone(String phone);
	

	/** 1_2. 비밀번호 변경
	 * @param t			변경할 비밀번호, 트레이너 번호
	 * @author 김주
	 * @return			처리된 행의 개수
	 */
	int changePwd(Trainer t);
	
	
	/** 트레이너 퇴근 시간
	 * @param t			로그인된 유저 객체
	 * @return			처리된 행의 개수
	 */
	int updateECheck(Trainer t);
	
	int updateSCheck(Trainer t);
	
	
	// 트레이너 리스트 화면
	ArrayList<Trainer> selectList();
	
	// 트레이너 상세정보
	Trainer trDetail(int trainerNo);

	// 트레이너 추가
	int insertTr(Trainer t);
	
	// 출근번호 중복확인
	int pwdCheck(String trainerPwd2);
	
	// 팀장 리스트
	ArrayList<Trainer> expertList();
	
	// 일반 트레이너 리스트
	ArrayList<Trainer> beginnerList();
	
	// 트레이너 삭제
	int deleteTr(int checkArr);
	
	// 트레이너 퇴사일 업데이트
	int trEndDate(int checkArr);
	
	// 트레이너 수정 화면 이동
	Trainer selectTr(int trainerNo);
}
