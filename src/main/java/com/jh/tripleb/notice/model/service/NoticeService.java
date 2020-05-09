package com.jh.tripleb.notice.model.service;

import java.util.ArrayList;

import com.jh.tripleb.notice.model.vo.Notice;

public interface NoticeService {

	// 1. 공지사항 리스트 조회용 서비스
	//1_1. 현재 요청한 페이지에 보여져야할 리스트 조회용 서비스
	ArrayList<Notice> selectList();
	
	// 2. 공지사항 작성용 서비스
	int insertNotice(Notice n);
	
	// 3. 공지사항 상세조회용 서비스
	// 3_1. 공지사항 상세조회용 서비스
	Notice selectNotice(int nno);
	
	// 4. 공지사항 삭제용 서비스
	int deleteNotice(int nno);
	
	// 5. 공지사항 수정용 서비스
	int updateNotice(Notice n);
	
	/**
	 * 메인용 공지사항 리스트
	 * @author 김주
	 * @return		조회된 공지사항 리스트 최신 5개
	 */
	ArrayList<Notice> mainNotice();
}
