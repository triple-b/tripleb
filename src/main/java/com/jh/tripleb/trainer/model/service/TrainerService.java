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
	Trainer detailTrainer(int tno);
	
	



}
