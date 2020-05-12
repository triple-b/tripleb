package com.jh.tripleb.student.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jh.tripleb.student.model.service.StudentService;
import com.jh.tripleb.student.model.vo.StudentDtoJ;

@Controller
public class StudentController {

	@Autowired
	private StudentService stService;
	
	@RequestMapping("student.jst")
	public String selectList(Model model) {
		ArrayList<StudentDtoJ> list = stService.selectList();
		
		model.addAttribute("list", list);
		
		return "student/studentList";
	}
}
