package com.ssafy.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.model.dto.Food;
import com.ssafy.model.service.EatService;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.UserService;

//@Controller
public class MainController2 {
	private static final Logger logger = LoggerFactory.getLogger(MainController2.class);
	
	@Autowired 
	UserService user;
	
	@Autowired 
	EatService eat;
	
	@Autowired
	FoodService food;
	
	@GetMapping("/home")
	public String home(Model model) {
		logger.trace("home 방문.");
		List<Food> foods = food.selectAll();
		logger.trace("foods :: "+foods);
		model.addAttribute("list", foods);
		return "food/foodHome";
	}
	
	@GetMapping("/index")
	public String index(Model model) {
		logger.trace("index 방문.");
		List<Food> foods = food.selectAll();
		logger.trace("foods :: "+foods);
		model.addAttribute("list", foods);
		return "index";
	}
	
//	@PostMapping("/login")
//	public String login(Model model, User user, RedirectAttributes redir, HttpServletResponse res,
//			HttpSession session) {
//
//		// 3.뷰 연결
//		User result = userService.login(user.getId(), user.getPassword());
//
//		logger.trace("result :{}", result);
//		if (result != null
//				&& (result.getId().equals(user.getId()) && result.getPassword().equals(user.getPassword()))) {
//
//			Cookie cookie = new Cookie("loginUser", user.getId());
//			cookie.setPath("/");
//			cookie.setMaxAge(60 * 2);
//			res.addCookie(cookie);
//			session.setAttribute("loginUser", user.getId());
//			// redir.addFlashAttribute("alarm", "로그인 되었습니다.");
//
//			return "redirect:index";
//		} else
//			return "index";
//
//	}

}
