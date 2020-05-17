package com.jh.tripleb.preview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PreviewController {
	
	@RequestMapping("preview.mpv")
	public String preview() {		
		return "preview/main_preview";		
	}
	
	// 일정관리
	@RequestMapping("capage.mpv")
	public String selectListCalendar() {		
		return "caledar/calendarList";
	}
	
	// 공지사항
	@RequestMapping("npage.mpv")
	public String selectListNotice() {		
		return "notice/noticeListView";
	}
	
	// 트레이너 관리
	@RequestMapping("tpage.mpv")
	public String selectListTrainer() {		
		return "trainer/trainerList";
	}
	
	// 트레이너 휴가관리
	@RequestMapping("vpage.mpv")
	public String selectListVacation() {		
		return "vacation/vacationList";
	}
	
	// 수업관리
	@RequestMapping("cpage.mpv")
	public String selectListClass() {		
		return "classInfo/classList";
	}

	// 건의사항
	@RequestMapping("spage.mpv")
	public String selectListSuggestions() {		
		return "suggestions/suggestionsList";
	}
	
	// 상품관리
	@RequestMapping("ppage.mpv")
	public String selectListProduct() {		
		return "product/productList";
	}	

	// PT회원관리
	@RequestMapping("ptpage.mpv")
	public String selectListPT() {		
		return "sales/salesChart";
	}
	
	// 시설관리
	@RequestMapping("mcpage.mpv")
	public String selectListMC() {		
		return "sales/salesChart";
	}
	
	// 비품관리
	@RequestMapping("eqpage.mpv")
	public String selectListEQ() {		
		return "sales/salesChart";
	}
	
	// 시설점검
	@RequestMapping("mcheckpage.mpv")
	public String selectListMcheck() {		
		return "sales/salesChart";
	}
	
	// 락커관리
	@RequestMapping("lpage.mpv")
	public String selectListLocker() {		
		return "locker/lockerListView";
	}	
	
	// 매출현황
	@RequestMapping("slpage.mpv")
	public String selectList() {		
		return "sales/salesListView";		
	}
	
	// 매출통계
	@RequestMapping("scpage.mpv")
	public String selectListChart() {		
		return "preview/salesChart";
	}
	
}
