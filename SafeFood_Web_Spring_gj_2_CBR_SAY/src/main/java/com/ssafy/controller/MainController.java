package com.ssafy.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.model.dto.Eat;
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

	/* ========================== User ========================================= */

	// 로그인
	@PostMapping("/login")
	public String login(Model model, User user, RedirectAttributes redir, HttpServletResponse res,
			HttpSession session) {

		String[] allergy_user = null;
		logger.trace("user : {}", user);
		User result = userService.login(user.getId(), user.getPw());
		if (result != null) {
			if (result.getAllergy() != null) {
				allergy_user = result.getAllergy().split(",");
			}

			StringBuilder my_allergy = new StringBuilder().append("[");
			for (String al : allergy_user) {
				my_allergy.append('"').append(al).append('"').append(',');
			}
			my_allergy.append("]");
			session.setAttribute("loginUser", result);
			logger.trace(">>>  getAllergy : {}", result.getAllergy());
			logger.trace("allergy : {}", Arrays.toString(allergy_user));
			session.setAttribute("allergy", my_allergy.toString());
		} else {
			redir.addFlashAttribute("alarm", "아이디와 비밀번호를 확인해 주세요!");
		}
		return "redirect:home";
	}

	// 회원가입
	@GetMapping("/signUp")
	public String signUpForm(Model model) {
		return "user/signUp";
	}

	@PostMapping("/signUp")
	public String doSignUp(Model model, User user, RedirectAttributes redir) {
		try {
			userService.insertUser(user);
			redir.addFlashAttribute("alarm", "회원가입되었습니다. 로그인해주세요.");
			return "redirect:/home";
		} catch (DuplicateKeyException e) {
			logger.trace("DuplicateKeyException : {}", e);
			model.addAttribute("alarm", "이미 존재하는 아이디입니다.");
			model.addAttribute("prev", user);
			return "user/signUp";
		}
	}

	// 로그아웃
	@GetMapping("/logout")
	public String doLogout(Model model, HttpSession session, RedirectAttributes redir) {
		User info = (User) session.getAttribute("loginUser");
		logger.trace("logout: {}", info.getId());
		redir.addFlashAttribute("alarm", "로그아웃 되었습니다.");
		session.invalidate();
		return "redirect:/home";
	}

	// 회원수정
	@GetMapping("/userInfo")
	public String userInfoForm(Model model, HttpSession session, RedirectAttributes redir) {
		return "user/userInfo";
	}

	@PostMapping("/modify")
	public String modify(Model model, RedirectAttributes redir, User user, HttpSession session) {
		logger.trace("modify: {}", user.getId());
		String[] allergy_user = null;
		int result = userService.updateUser(user);

		if (result > 0) {
			session.setAttribute("loginUser", user);
			allergy_user = user.getAllergy_arr();

			StringBuilder my_allergy = null;
			if (allergy_user != null) {
				my_allergy = new StringBuilder().append("[");
				for (String al : allergy_user) {
					my_allergy.append('"').append(al).append('"').append(',');
				}
				my_allergy.append("]");
				session.setAttribute("allergy", my_allergy.toString());
			} else {
				session.setAttribute("allergy", "");
			}

			redir.addFlashAttribute("alarm", "회원정보 수정 완료하였습니다.");
		} else {
			redir.addFlashAttribute("alarm", "회원정보 수정 실패하였습니다.");
		}
		return "redirect:/home";
	}

	// 탈퇴
	@GetMapping("/withdraw")
	public String doWithdraw(Model model, RedirectAttributes redir, User user, HttpSession session) {
		User users = (User) session.getAttribute("loginUser");
		logger.trace("logout: {}", users.getId());

		int result = userService.deleteUser(users.getId());

		if (result > 0) {
			redir.addFlashAttribute("alarm", "회원탈퇴되었습니다.");
			session.invalidate();
		} else {
			redir.addFlashAttribute("alarm", "회원실패하였습니다.");
		}
		return "redirect:/home";
	}

	// 아이디 찾기
	@GetMapping("/userfindId")
	public String userfindIdForm(Model model) {
		return "user/userfindId";
	}

	// 비밀번호 찾기
	@GetMapping("/userfindPw")
	public String userfindPwForm(Model model) {
		return "user/userfindPw";
	}

	@PostMapping("/userfindPw")
	public String doUserfindPw(Model model, RedirectAttributes redir, User user, HttpSession session, String div) {
		User users = (User) session.getAttribute("loginUser");

		logger.trace(">>> email {} :: {}", users.getEmail(), user.getEmail());
		userService.findPw(users);
		if (users.getEmail().equals(user.getEmail())) {
			userService.sendEmail(users, div);
			redir.addFlashAttribute("alarm", "임시비밀번호를 메일로 발송했습니다.");

		} else {
			redir.addFlashAttribute("alarm", "잘못된 이메일입니다.");

		}
		return null;
		/*
		 * int result = userService.findPw(user); if(result > 0) {
		 * session.setAttribute("id", user.getId()); session.setAttribute("tel",
		 * user.getPw()); session.setAttribute("findChk", "success"); return
		 * "user/userfindPw"; }else { redir.addFlashAttribute("alarm",
		 * "아이디 또는 패스워드가 다릅니다."); return "user/userfindPw"; }
		 */
	}

	// 비밀번호 재설정
	@PostMapping("/doePw")
	public String doRePw(Model model, RedirectAttributes redir, User user, HttpSession session) {
		int result = userService.updatePw(user);
		if (result > 0) {
			redir.addFlashAttribute("alarm", "비밀번호가 변경되었습니다.");
			return "redirect:/home";
		} else {
			redir.addFlashAttribute("alarm", "비밀번호가 다릅니다.");
			return "user/userfindPw";
		}
	}

	/* ========================== Food ========================================= */

	@GetMapping("/home")
	public String home(Model model) {
		logger.trace("home 방문.");
		List<Food> foods = food.selectAll();
		logger.trace("foods :: " + foods);
		model.addAttribute("list", foods);
		return "food/foodHome";
	}

	@PostMapping("/search")
	public String search(Model model, HttpServletRequest req, RedirectAttributes redir) {
		logger.trace("search 방문.");
		String by = req.getParameter("by");
		List<Food> result = null;
		if (by.equals("상품명")) {
			String name = req.getParameter("search_input");
			;
			result = food.selectName2(name);
		} else if (by.equals("제조사")) {
			String maker = req.getParameter("search_input");
			result = food.selectMaker(maker);
		} else if (by.equals("재료명")) {
			String material = req.getParameter("search_input");
			result = food.selectMaterial(material);
		}
		model.addAttribute("list", result);
		return "food/foodHome";
	}

	@GetMapping("/productinfo")
	public String productinfo(Model model, HttpSession session) {
		logger.trace("productinfo 방문.");
		User user = (User) session.getAttribute("loginUser");
		List<Food> foods = eat.searchMyList(user.getId());
		logger.trace("foods :: " + foods);
		model.addAttribute("list", foods);
		return "food/productinfo";
	}

	@GetMapping("/detail")
	public String foodDetail(Model model, HttpServletRequest req) {
		logger.trace("foodDetail 방문.");
		String name = req.getParameter("name");
		Food food1 = food.selectName1(name);
		logger.trace("food :: " + food1);
		model.addAttribute("food", food1);
		return "food/detailinfo";
	}

	@ResponseBody
	@PostMapping("/chart")
	public Food chart(Model model, int code) {
		Food foods = food.selectCode(code);
		logger.trace("chart :: " + foods);
		return foods;
	}

	/* ========================== Eat ========================================= */

	@GetMapping("/addEat")
	public String addEat(Model model, int code, RedirectAttributes redir, HttpSession session) {
		logger.trace("addEat : {}");
		User info = (User) session.getAttribute("loginUser");
		Eat eatNew = new Eat(info.getId(), code);
		eat.insert(eatNew);
		return "redirect:home";
	}

	/* ========================== Like ========================================= */

	/*
	 * ========================== Review =========================================
	 */

	/* ========================== etc ========================================= */

	// 에러 페이지 연결
	@RequestMapping("/error")
	public String errorHandling(Model model) {
		return "include/Error";
	}

	@GetMapping("/qna")
	public String qna(Model model) {
		return "menu/qna";
	}
}
