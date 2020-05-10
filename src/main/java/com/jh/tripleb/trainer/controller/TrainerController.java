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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
			
			mv.addObject("msg", "로그인 실패");
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
			mv.addObject("msg", "로그인 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;

	}
	
	@RequestMapping("profileForm.utr")
	public String profileForm() {
		return "trainer/profileTrainer";
	}
	
	@RequestMapping("update.utr")
	public String updateTrainerProfile(Trainer t, HttpSession session, Model model, HttpServletRequest request,
									@RequestParam(value="newThumbnail", required=false) MultipartFile file) {
		
		// 전달된 파일이 있는 경우
			if(!file.getOriginalFilename().contentEquals("")) {
				String changeName = saveFile(file, request); // 실제로 업로드된 파일명
				t.setTrainerThumbnail(changeName);
			}
				
		int result = tService.updateTrainerProfile(t);
		
		
		if(result > 0) {
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
		
		System.out.println(otno);
		
		if(t != null) {
			mv.addObject("t", t).setViewName("trainer/lockTrainer");
		}else {
			mv.addObject("msg", "트레이너 조회 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	@RequestMapping("trainerList.jtr")
	public String trainerList() {
		return "trainer/trainerList";
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
