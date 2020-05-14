package com.jh.tripleb.mcManagement.Controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jh.tripleb.machine.model.vo.Machine;
import com.jh.tripleb.mcManagement.model.service.McmanagementService;
import com.jh.tripleb.mcManagement.model.vo.McManagement;
import com.jh.tripleb.mcManagement.model.vo.McManagementDto;


@Controller
public class McmanagementController {

	@Autowired
	private McmanagementService mcmService;
	
	 @RequestMapping("insert.mcm")
     public String insertMcManagement(int mcno, Model model) {
        
        McManagement mcm = new McManagement();
        
        mcm.setMcNo(mcno);
        
        int result = mcmService.insertMcManagement(mcm);
        
        if(result > 0) {
           return "redirect:mcList.mcm?type=leftmenu";
        }else {
           model.addAttribute("msg", "기구 등록 실패!");
           return "common/errorPage";
        }
        

     }
	@RequestMapping("mcList.mcm")
	public String selectList(String type, Model model) {
		
		ArrayList<McManagement> list = mcmService.selectList();
		
		model.addAttribute("list",list);
	
		if(type.equals("leftmenu")) {
			
			return "mcCheck/mcCheckListView";		
		}else {
			
			return "mcCheck/mcAllCheckList";
		}
		
	}

	@ResponseBody
	@RequestMapping(value="mcList2.mcm", produces="application/json; charset=utf-8")
	public String selectList2(){
		
		ArrayList<McManagement> list = mcmService.selectList2();
	
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
	
	
	@RequestMapping("delete.mcm")
	public String deleteMcManagement(int mano, Model model) {
		
		int result = mcmService.deleteMcManagement(mano);
		
		if(result > 0) { // 삭제 성공
			return "redirect:mcList.mcm?type=leftmenu";
		}else { // 삭제 실패
			model.addAttribute("msg", "기구관리 삭제 실패!");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="trouble.mcm", produces="application/json; charset=utf-8")
	public String troubleMcManagement(int mano) {
		
		int m = mcmService.troubleMcManagement(mano);
		
		Gson gson = new Gson();

		return  gson.toJson(m);
	}
	
	@RequestMapping("select.mcm")
	public ModelAndView selectMcManagement(int mano, ModelAndView mv) {
		
		McManagementDto mc = mcmService.selectMcManagement(mano);

		if(mc !=null) {
			mv.addObject("mc", mc).setViewName("redirect:mcList.mcm?type=leftmenu");
		}else {
			mv.addObject("msg", "유효한 게시글 아님!").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="selectMc1.mcm", produces="application/json; charset=utf-8")
	public String selectMachine(int mano) {
		
		McManagementDto mc = mcmService.selectMcManagement(mano);
		
		Gson gson = new Gson();

		return  gson.toJson(mc);
	}
	
	@RequestMapping("update.mcm")
	public ModelAndView updateMachine(McManagementDto m, HttpServletRequest request, ModelAndView mv,
									 @RequestParam(value="reUploadFile", required=false) MultipartFile file) {
		
	//새로 넘어온 첨부파일이 있을 경우
		if(!file.getOriginalFilename().equals("")) {
		
		// 새로 넘어온 첨부파일도 있고 뿐만아니라 기존의 첨부파일이 있었을 경우
		if(m.getThumbnail() !=null) {
			deleteFile(m.getThumbChange(), request);
		}
		String thumbChange = saveFile(file, request);
		String thumbnail = file.getOriginalFilename();
		
		m.setThumbChange(thumbChange);
		m.setThumbnail(thumbnail);
	
		}
	int result = mcmService.updateMachine(m);
	
	if(result > 0) {
		mv.setViewName("redirect:mcList.mcm?type=leftmenu");
	}else {
		mv.addObject("msg", "유효한 게시글 아님!").setViewName("common/errorPage");
	}
	
	return mv;
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
	
	// 전달받은 파일명을 찾아서 삭제시키는 메소드 (공유해서 쓸수 있게끔 따로 빼줌)
		public void deleteFile(String fileName, HttpServletRequest request) {
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources + "\\upload_files\\";
			
			File deleteFile = new File(savePath + fileName);
			deleteFile.delete();
		}
}
