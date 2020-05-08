package com.jh.tripleb.trainer.model.service;

import java.util.ArrayList;

import com.jh.tripleb.trainer.model.vo.Trainer;

public interface TrainerService {
	
	
	// 트레이너 전체 리스트
	/**
	 * @author 김주
	 * @return			전체 트레이너의 전체 정보
	 */
	ArrayList<Trainer> listTrainer();
	
	// 트레이너 로그인용 서비스
	/**
	 * @param t			트레이너의 출근번호 담긴 트레이너 객체
	 * @author 김주
	 * @return			조회된 트레이너의 정보
	 */
	Trainer loginTrainer(Trainer t);
	
	// 트레이너 변경 서비스
	/**
	 * @param t			---------------- 김주 다시 볼 파트 (로그인트레이너랑 다른 게 뭔지?)
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
	Trainer detailTrainer(int tno);



}
