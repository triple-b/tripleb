package com.jh.tripleb.machine.controller;

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

import com.google.gson.Gson;
import com.jh.tripleb.machine.model.service.MachineService;
import com.jh.tripleb.machine.model.vo.Machine;

@Controller
public class MachineController {
	
	@Autowired
	private MachineService hmService;
	
	
	
	@ResponseBody
	@RequestMapping(value="mclist.mc", produces="application/json; charset=utf-8")
	public String selectList() {
		
		ArrayList<Machine> list = hmService.selectList();
		
		Gson gson = new Gson();

		return  gson.toJson(list);
	}
	
//	@ResponseBody
//	@RequestMapping(value="mclist.hmc", produces="application/json; charset=utf-8")
//	public String selectlist() {
//		
//		ArrayList<Machine> list = hmService.selectList();
//		
//		Gson gson = new Gson();
//
//		return  gson.toJson(list);
//	}
	
	@RequestMapping("insert.mc")
	public String insertMachine(Machine m, 
								@RequestParam(value="uploadFile", required=false)MultipartFile file, HttpServletRequest request, Model model) {
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			String mcThumbnail = file.getOriginalFilename();
			
			m.setThumbChange(changeName);
			m.setThumbnail(mcThumbnail);
		}
		int result = hmService.insertMachine(m);
		
		if(result > 0) {
			return "redirect:mcList.mc";
		}else { //기구 등록 실패
			
			model.addAttribute("msg", "기구 등록 실패!");
			return "common/errorPage";
			
		}
		}
	
		@RequestMapping("delete.mc")
		public String deleteMachine(int mcno, Model model){
		     System.out.println(mcno);
			int result = hmService.deleteMachine(mcno);
			
			if(result > 0) { // 삭제 성공
				return "redirect:mcList.mc";
			}else { // 삭제 실패
				model.addAttribute("msg", "기구 삭제 실패!");
				return "common/errorPage";
			}
		}
	
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources + "\\upload_files\\";
			
			String mcThumbnail = file.getOriginalFilename(); // 원본명 
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String currentTime = sdf.format(new Date());
			String ext =mcThumbnail.substring(mcThumbnail.lastIndexOf("."));
			
			String changeName = currentTime + ext;
			
			try {
				file.transferTo(new File(savePath + currentTime)); // 서버에 업로드 시키는 구문
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			  return changeName;
		}
		
		
	}
	

