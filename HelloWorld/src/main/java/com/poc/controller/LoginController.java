package com.poc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poc.entity.User;
import com.poc.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping("/showLogin")
	public String showAddForm(Model model) {
		model.addAttribute("user", new User());
		return "Login";
	}
	
	@RequestMapping("/login")
	public String saveStudentObj(@ModelAttribute("user") User userObj) {
		String message = loginService.authenticateUser(userObj);
		if("Authenticated".equals(message)) {
			return "redirect:/student/list";
		}
		else {
			return "redirect:/showLogin";
		}
	}

}
