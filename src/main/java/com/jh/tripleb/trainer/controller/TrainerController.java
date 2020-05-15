package com.jh.tripleb.trainer.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jh.tripleb.trainer.model.service.TrainerService;
import com.jh.tripleb.trainer.model.vo.Trainer;

@Controller
public class TrainerController {
	
	@Autowired
	private TrainerService tService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginForm.utr")
	public String loginForm() {
		return "trainer/loginTrainer";
	}
	
	@RequestMapping("login.utr")
	public ModelAndView loginTrainer(Trainer t, HttpSession session, ModelAndView mv) {
		
		ArrayList<Trainer> list = tService.listTrainer();
		ArrayList<Trainer> onTrainer = tService.listTrainer();
		
		if(list != null) {
			for(Trainer loginUser : list) {
	
				if(bcryptPasswordEncoder.matches(t.getTrainerPwd(), loginUser.getTrainerPwd())){
					session.setAttribute("loginUser", loginUser);
				}
			}
			
			session.setAttribute("onTrainer", onTrainer);
			mv.setViewName("redirect:/");
			
		}else { // 로그인 실패
			
			mv.addObject("msg", "출근번호가 다릅니다. 다시 입력해주세요.");
			mv.setViewName("common/errorPage");
		}
			
		return mv;
		
	}
	
	@RequestMapping("change.utr")
	public ModelAndView changeTrainer(Trainer t, HttpSession session, ModelAndView mv) {
		
		Trainer loginUser = tService.changeTrainer(t);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(t.getTrainerPwd(), loginUser.getTrainerPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg", "출근번호가 다릅니다. 다시 입력해주세요.");
			mv.setViewName("common/errorPage");
			
		}
		return mv;

	}
	
	@RequestMapping("profileForm.utr")
	public String profileForm() {
		return "trainer/profileTrainer";
	}
	
	@RequestMapping("update.utr")
	public String updateTrainerProfile(Trainer t, HttpSession session, Model model, HttpServletRequest request, String detailAddress,
									@RequestParam(value="newThumbnail", required=false) MultipartFile file) {
		
		// 전달된 파일이 있는 경우
			if(!file.getOriginalFilename().contentEquals("")) {
				String changeName = saveFile(file, request); // 실제로 업로드된 파일명
				t.setTrainerThumbnail(changeName);
			}
			
			t.setTrainerAddress(t.getTrainerAddress() + " " + detailAddress);
			
			System.out.println(t);

		int result = tService.updateTrainerProfile(t);
		
		
		if(result > 0) {

			ArrayList<Trainer> onTrainer = tService.listTrainer();
			session.setAttribute("onTrainer", onTrainer);
			session.setAttribute("loginUser", tService.changeTrainer(t));
			return "redirect:profileForm.utr";
			
		}else {
			model.addAttribute("msg", "프로필 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("lock.utr")
	public ModelAndView lockPage(int otno, ModelAndView mv) {
		
		Trainer t = tService.detailTrainer(otno);
		
		if(t != null) {
			mv.addObject("t", t).setViewName("trainer/lockTrainer");
		}else {
			mv.addObject("msg", "트레이너 조회 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("searchForm.utr")
	public String serachForm() {
		return "trainer/recoverPTrainer";
	}
	
	@RequestMapping("searchPhone.utr")
	public ModelAndView searchPhone(String phone, ModelAndView mv) {
		
		Trainer t = tService.searchPhone(phone);
		
		if(t != null) {
			mv.addObject("t", t).setViewName("trainer/recoverPwdTrainer");
		}else {
			mv.addObject("msg", "트레이너 조회 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	
	@ResponseBody
	@RequestMapping("pwdCheck.utr")
	public String pwdSearch(String pwd) {
			
		ArrayList<Trainer> list = tService.listTrainer();

		int result = 0;
			for(Trainer t : list) {
				if(bcryptPasswordEncoder.matches(pwd, t.getTrainerPwd())){		
					result = 1;
				}
			}
			return String.valueOf(result);

	}
	
	
	
	@RequestMapping("changePwd.utr")
	public String changePwd(Trainer t, String newPwd) {
		
		String encPwd = bcryptPasswordEncoder.encode(newPwd);
		
		
		t.setTrainerPwd(encPwd);
		int result = tService.changePwd(t);
		

		return "redirect:/";

	}
	
	
	@RequestMapping("trainerList.utr")
	public String trainerList(Model model) {
		
		ArrayList<Trainer> list = tService.selectList();
		
		model.addAttribute("list", list);
		
		return "trainer/trainerList";
	}

	@ResponseBody
	@RequestMapping(value="trDetail.utr", produces="application/json; charset=utf-8")
	public String trDetail(int trainerNo) {
		Trainer t = tService.trDetail(trainerNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(t);
	}
	
	@ResponseBody
	@RequestMapping(value="randomPwd.utr", produces="application/json; charset=utf-8")
	public String pwdCheck(int trainerPwd) {
		
		String trainerPwd2 = Integer.toString(trainerPwd);
		
		int count = tService.pwdCheck(trainerPwd2);
		
		return String.valueOf(count);
	}
	
	@RequestMapping("insertTr.utr")
	public String insertTr(Trainer t, String trainerPwd, HttpSession session, HttpServletRequest request, Model model, 
							  @RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		String encPwd = bcryptPasswordEncoder.encode(trainerPwd);
		
		t.setTrainerPwd(encPwd);
		
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request); // 수정명
			
			t.setTrainerThumbnail(changeName);
		}
		
		int result = tService.insertTr(t);
		
		if(result > 0) {
			
			ArrayList<Trainer> onTrainer = tService.listTrainer();
			session.setAttribute("onTrainer", onTrainer);
			return "redirect:trainerList.utr";
		}else {
			model.addAttribute("msg", "트레이너 추가 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("expertList.utr")
	public String expertList(Model model){
		ArrayList<Trainer> list = tService.expertList();
		
		model.addAttribute("list", list);
		
		return "trainer/trainerList";
	}
	
	@RequestMapping("beginnerList.utr")
	public String beginnerList(Model model){
		ArrayList<Trainer> list = tService.beginnerList();
		
		model.addAttribute("list", list);
		
		return "trainer/trainerList";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteTr.utr", produces="application/json; charset=utf-8")
	public int deleteTr(@RequestParam(value="checkArr[]") String[] checkArr) {
		
		int result = 0;
		int result2 = 0;
		for(int i = 0; i<checkArr.length; i++) {
			result = tService.deleteTr(Integer.parseInt(checkArr[i]));
			if(result > 0) {
				result2 = tService.trEndDate(Integer.parseInt(checkArr[i]));
			}
		}
		
		return result2;
	}
	
	@RequestMapping("trUpdateForm.utr")
	public ModelAndView trUpdateForm(int trainerNo, ModelAndView mv) {
		
		Trainer t = tService.selectTr(trainerNo);

		mv.addObject("t", t).setViewName("trainer/trUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("trUpdateCurrent.utr")
	public String updateTr(Trainer t, HttpSession session, Model model, HttpServletRequest request, String detailAddress,
									@RequestParam(value="newThumbnail", required=false) MultipartFile file) {
		
		// 전달된 파일이 있는 경우
		if(!file.getOriginalFilename().contentEquals("")) {
			String changeName = saveFile(file, request); // 실제로 업로드된 파일명
			t.setTrainerThumbnail(changeName);
		}
		System.out.println(t);
		t.setTrainerAddress(t.getTrainerAddress() + " " + detailAddress);
		
		int result = tService.updateTrainerProfile(t);
		
		if(result > 0) {

			ArrayList<Trainer> onTrainer = tService.listTrainer();
			
			return "redirect:trainerList.utr";
			
		}else {
			model.addAttribute("msg", "프로필 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="updateGrade.utr", produces="application/json; charset=utf-8;")
	public Trainer updateGradere(int trainerNo, String trainerGrade) {
		Trainer t = tService.selectTr(trainerNo);
		
		t.setTrainerGrade(trainerGrade);
		
		return t;
	}
	
	// 파일명 수정 메소드
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
