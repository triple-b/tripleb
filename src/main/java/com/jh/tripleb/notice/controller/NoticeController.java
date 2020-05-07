package com.jh.tripleb.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jh.tripleb.notice.model.service.NoticeService;
import com.jh.tripleb.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	  @Autowired private NoticeService nService;

	@RequestMapping("List.no")
	public String selectList(Model model) {		
		
		ArrayList<Notice> list = nService.selectList();
		
		model.addAttribute("list",list);
	
		return "notice/noticeListView";		
	}
	
	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		return "notice/noticeEnrollForm";		
	}
	
	@RequestMapping("insert.no")
	public String insertNotice(Notice n,Model model) {
		
	int result = nService.insertNotice(n);
	
	if(result > 0) { // 공지사항 등록 성공
		
		return "redirect:List.no";
	}else { //공지사항 등록 실패
		
		model.addAttribute("msg", "공지사항 작성 실패!");
		return "common/errorPage";
	}
		
	
	}
	/*
	@RequestMapping("detail.no")
	public String selectNotice(int nno,Model model) {
		
		Notice n = nService.selectNotice(nno);
		
		if(n > 0) { // 유효한게시글 --> 조회 성공
			
			model.addAttribute("n",n);
			return "notice/noticeDetailView";
		}else { //유효한게시글x --> 조회 실패
			
			model.addAttribute("msg", "공지사항 작성 실패!");
			return "common/errorPage";
		}
		
		
	}
	*/
	
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		
		Notice n = nService.selectNotice(nno);
		
		
		if(n !=null) { // 유효한게시글 --> 조회 성공
			
			//mv.addObject("n",n);
			//mv.setViewName("notice/noticeDetailView");
			mv.addObject("n", n).setViewName("notice/noticeDetailView");
		}else { //유효한게시글x --> 조회 실패
			
			mv.addObject("msg", "유효한 게시글 아님!");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	@RequestMapping("delete.no")
	public String deleteNotice(int nno, Model model) {
		
		int result = nService.deleteNotice(nno);
		
		if(result > 0) { // 삭제 성공
			return "redirect:List.no";
		}else { // 삭제 실패
			model.addAttribute("msg", "공지사항 삭제 실패!");
			return "common/errorPage";
		}
	}
	@RequestMapping("updateForm.no")
	public ModelAndView updaateForm(int nno, ModelAndView mv) {
		
		Notice n = nService.selectNotice(nno);
		
		mv.addObject("n", n).setViewName("notice/noticeUpdateForm");
		
		return mv;
	}
	@RequestMapping("update.no")
	public ModelAndView updateNotice(Notice n,ModelAndView mv) {
		
		int result = nService.updateNotice(n);
		 
		if(result > 0) { // 수정 성공했을경우 -->상세보기 요청
			mv.addObject("nno", n.getNoticeNo()).setViewName("redirect:detail.no");
		}else { // 수정실패했을경우 --> errorPage
			mv.addObject("msg", "유효한 게시글 아님!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
}
