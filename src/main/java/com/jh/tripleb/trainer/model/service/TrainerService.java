package com.jh.tripleb.trainer.model.service;

import java.util.ArrayList;

import com.jh.tripleb.trainer.model.vo.Trainer;

public interface TrainerService {
	
	// 1. 트레이너 로그인용 서비스
	Trainer loginTrainer(Trainer t);
	
	// 2. 트레이너 변경 서비스
	Trainer changeTrainer(Trainer t);
	
	// 3. 트레이너 마이프로필 서비스
	int updateTrainerProfile(Trainer t);
	
	
	
	
	
	
	// 김주희
	
	// 1. 캘린더 트레이너 리스트 서비스
	ArrayList<Trainer> calListTrainer();

}
