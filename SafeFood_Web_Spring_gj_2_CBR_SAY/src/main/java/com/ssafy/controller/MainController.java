package com.ssafy.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.User;
import com.ssafy.model.service.EatService;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.UserService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired 
	UserService userService;
	
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
		return "home";
	}
	
	//로그인
	@PostMapping("/login")
	public String login(Model model, User user, RedirectAttributes redir, HttpServletResponse res,
			HttpSession session) {

		logger.trace("user : {}", user);
		User result = userService.login(user.getId(), user.getPw());
		if (result != null) {
			String[] allergy_user = result.getAllergy().split(",");
//			redir.addFlashAttribute("alarm", "반갑습니다. "+result.getId()+"님");
			session.setAttribute("loginUser", result);
			session.setAttribute("allergy", allergy_user);
		} else{ 
			redir.addFlashAttribute("alarm", "아이디와 비밀번호를 확인해 주세요!");
		}
		return "redirect:home";

	}
	
	//회원가입
	@GetMapping("/signUp")
	public String signUpForm(Model model){
		return "user/signUp";
	}
	
	@PostMapping("/signUp")
	public String doSignUp(Model model, User user, RedirectAttributes redir) {
		try {
			userService.insertUser(user);
			redir.addFlashAttribute("alarm", "회원가입되었습니다. 로그인해주세요.");
			return "redirect:/home";
		}catch(DuplicateKeyException e) {
			logger.trace("DuplicateKeyException : {}", e);
//			redir.addFlashAttribute("alarm", "이미 존재하는 아이디입니다.");
			model.addAttribute("alarm", "이미 존재하는 아이디입니다.");
			model.addAttribute("prev", user);
			return "user/signUp";
		}
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String doLogout(Model model, HttpSession session, RedirectAttributes redir) {
		User info = (User) session.getAttribute("loginUser");
		logger.trace("logout: {}", info.getId());
		redir.addFlashAttribute("alarm", "로그아웃 되었습니다.");
		session.invalidate();
		return "redirect:/home";
	}
	
	//회원수정
	@GetMapping("/userInfo")
	public String userInfoForm(Model model, HttpSession session, RedirectAttributes redir) {
		return "user/userInfo";
	}
	
	//에러 페이지 연결
	@RequestMapping("/error")
	public String errorHandling(Model model) {
		return "include/Error";
	}
	

}
