package com.ssafy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ssafy.model.service.EatService;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.UserService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired 
	UserService user;
	
	@Autowired 
	EatService eat;
	
	@Autowired
	FoodService food;
	
	@GetMapping("/index")
	public String index(Model model) {
		
		return "index";
	}
	
}
