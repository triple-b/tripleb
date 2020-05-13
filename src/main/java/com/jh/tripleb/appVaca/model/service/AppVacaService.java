package com.jh.tripleb.appVaca.model.service;

import com.jh.tripleb.appVaca.model.vo.AppVaca;
import com.jh.tripleb.vacation.model.vo.Vacation;

public interface AppVacaService {

	Vacation avDetail(int vacNo);
	
	int insertApp(AppVaca av);
	
	int updateVaca(Vacation v);
	
	int insertApp2(AppVaca av);
	
	int updateVaca2(Vacation v);
}
