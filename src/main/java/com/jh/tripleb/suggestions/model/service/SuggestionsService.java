package com.jh.tripleb.suggestions.model.service;

import java.util.ArrayList;

import com.jh.tripleb.suggestions.model.vo.Suggestions;

public interface SuggestionsService {
	
	// 1. 건의사항 리스트 조회용 서비스
	// 1_1. 건의사항 총 갯수 조회용 서비스
	int getListCount();
	
	// 1_2. 현재 요청한 페이지에 보여져야할 리스트 조회용 서비스
	ArrayList<Suggestions> selectList();
	
	// 2. 건의사항 작성용 서비스
	int insertSug(Suggestions s);
	
	// 3. 건의사항 상세조회용 서비스
	Suggestions selectSug(int sugNo);
	
	// 5. 건의사항 수정용 서비스
	int updateSug(Suggestions s);

}
