package com.jh.tripleb.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jh.tripleb.member.model.service.MemberService;
import com.jh.tripleb.member.model.vo.MemberDtoU;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	// 주희 임시 수정
	@RequestMapping("list.ume")
	public ModelAndView selectListMember(ModelAndView mv) {
		
		ArrayList<MemberDtoU> list = mService.selectListMember();  // 전체회원
		ArrayList<MemberDtoU> plist = mService.pauseSelectListMember(); // 일시정지회원
		ArrayList<MemberDtoU> elist = mService.expSelectListMember(); // 만료회원
		ArrayList<MemberDtoU> blist = mService.blackSelectListMember(); // 블랙리스트회원
		
		if(list != null) { // 조회 성공
			mv.addObject("list", list).addObject("plist", plist).addObject("elist", elist).addObject("blist", blist).setViewName("member/memberListView");
		}else {	// 조회 실패
			mv.addObject("msg", "회원 전체 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="detail.ume", produces="application/json; charset=utf-8")
	public String detailMember(int mno) throws IOException {
		
		MemberDtoU m = mService.detailMember(mno);
		
		return new Gson().toJson(m);			

		
	}
	
	@RequestMapping("update.ume")
	public String updateMember(MemberDtoU mto, HttpServletRequest request, Model model,
			int memberYear, int memberMonth, int memberDay, @RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		// 전달된 파일이 있는 경우
		if(!file.getOriginalFilename().contentEquals("")) {
			String changeName = saveFile(file, request); // 실제로 업로드된 파일명
			mto.setMemberImage(changeName);
		}
		
		int memberBirth = memberYear + memberMonth + memberDay;
		
		mto.setMemberBirth(Integer.toString(memberBirth));
		
		int result = mService.updateMember(mto);
		
		if(result > 0) { // 성공
			
			return "redirect:list.ume";
			
		}else { // 실패
			
			model.addAttribute("msg", "회원 정보 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("delete.ume")
	public String deleteMember(String[] chk, Model model) {
		
		int result = 0;
		for(int i=0; i<chk.length; i++) {
			result = mService.deleteMember(Integer.parseInt(chk[i]));
		}
		
		if(result > 0 ) {
			return "redirect:list.ume";
		}else {
			model.addAttribute("msg", "회원 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("insert.ume")
	public String insertMember(MemberDtoU m, HttpServletRequest request, Model model,
			int memberYear, int memberMonth, int memberDay, @RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().contentEquals("")) {
			String changeName = saveFile(file, request); // 실제로 업로드된 파일명
			
			m.setMemberImage(changeName);
		}
		
		String memberBirth = Integer.toString(memberYear) + Integer.toString(memberMonth) + Integer.toString(memberDay);
		
		m.setMemberBirth(memberBirth);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "redirect:list.ume";
		}else {
			model.addAttribute("msg", "회원 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("black.ume")
	public String blackMember(int memberNo, String blacklistContent, Model model) {
		
		MemberDtoU mto = mService.detailMember(memberNo);
				
		mto.setBlacklistContent(blacklistContent);
		
		int result = mService.blackMember(mto);
		
		if(result > 0) {
			return "redirect:list.ume";
		}else {
			model.addAttribute("msg", "블랙리스트 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("blackCancel.ume")
	public String blackCancelMember(int memberNo, String memberNote, Model model) {
		
		MemberDtoU mto = mService.detailMember(memberNo);
		
		mto.setMemberNote(memberNote);
		
		int result = mService.blackCancelMember(mto);
		
		if(result > 0) {
			return "redirect:list.ume";
		}else {
			model.addAttribute("msg", "블랙리스트 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		String originName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		
			try {
				file.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		return changeName;
	}
}
