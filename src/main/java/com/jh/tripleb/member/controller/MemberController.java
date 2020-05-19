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
import com.google.gson.GsonBuilder;
import com.jh.tripleb.member.model.service.MemberService;
import com.jh.tripleb.member.model.vo.MemberDtoU;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	
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

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	      
	    return gson.toJson(m);		

	}
	
	@RequestMapping("update.ume")
	public String updateMember(MemberDtoU mto, HttpServletRequest request, Model model,
			String memberYear, String memberMonth, String memberDay, @RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		// 전달된 파일이 있는 경우
		if(!file.getOriginalFilename().contentEquals("")) {
			String changeName = saveFile(file, request); // 실제로 업로드된 파일명
			mto.setMemberImage(changeName);
		}
		
		String memberBirth = memberYear + memberMonth + memberDay;
		
		mto.setMemberBirth(memberBirth);
		
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
			String memberYear, String memberMonth, String memberDay, @RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().contentEquals("")) {
			String changeName = saveFile(file, request); // 실제로 업로드된 파일명
			
			m.setMemberImage(changeName);
		}
		
		String memberBirth = memberYear + memberMonth + memberDay;
		
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
	
	@RequestMapping("pause.ume")
	public String pauseMember(MemberDtoU m, Model model) {

		int result = mService.pauseMember(m); // 일시정지로 변경
		
		if(result > 0) {
			int result2 = mService.addDate(m);	// 상품권 종료일 증가
				if(result2 > 0) {
					return "redirect:list.ume";
				}
				model.addAttribute("msg", "존재하는 상품권이 없습니다.");
				return "common/errorPage";
		}else {
			model.addAttribute("msg", "일시정지 할 수 없는 회원입니다.");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("pauseCancel.ume")
	public String pauseCancelMember(MemberDtoU m, Model model) {
		
		MemberDtoU mem = mService.detailMember(m.getMemberNo()); // 상세정보 조회
		
		long sub = mem.getPauseEnd().getTime() - m.getPauseCancelDate().getTime(); // 날짜간 빼기
		
		
		int pauseDate = (int)sub / ( 24*60*60*1000); // 일시정지 변경되는 기간
		
		m.setPauseDate(pauseDate);

		int result = mService.pauseCancelMember(m); // 회원 일시정지 상태 변경 서비스

		
		if(result > 0) {
			int result2 = mService.pauseCanceladdDate(m);
			return "redirect:list.ume";
		}else {
			model.addAttribute("msg", "일시정지 해제 할 수 없는 회원입니다.");
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
