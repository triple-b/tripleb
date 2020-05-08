package com.jh.tripleb.trainer.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	@RequestMapping("loginForm.utr")
	public String loginForm() {
		return "trainer/loginTrainer";
	}
	
	@RequestMapping("login.utr")
	public ModelAndView loginTrainer(Trainer t, HttpSession session, ModelAndView mv) {
		
		Trainer loginUser = tService.loginTrainer(t);
		ArrayList<Trainer> onTrainer = tService.onListTrainer();
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("onTrainer", onTrainer);
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("msg", "로그인 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	@RequestMapping("change.utr")
	public ModelAndView changeTrainer(Trainer t, HttpSession session, ModelAndView mv) {
		
		Trainer loginUser = tService.changeTrainer(t);
		
		if(loginUser != null) {
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
	
	
	@RequestMapping("trainerList.jtr")
	public String trainerList() {
		return "trainer/trainerList";
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
