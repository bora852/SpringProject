package com.ssafy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.LikeFood;
import com.ssafy.model.dto.Notice;
import com.ssafy.model.dto.User;
import com.ssafy.model.service.EatService;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.LikeFoodService;
import com.ssafy.model.service.NoticeService;
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

	@Autowired
	LikeFoodService foodLike;
	
	@Autowired
	NoticeService noticeService;
	
	public boolean[] checkOver(List<Food> foods) {
		boolean[] check = new boolean[20];
		for(int i=0;i<20;i++) {
			check[i] = true;
			if(foods.get(i).getCalory() > 1300) {
				check[i] = false;
			}
			if(foods.get(i).getCarbo() > 230) {
				check[i] = false;
			}
			if(foods.get(i).getProtein() > 27.5) {
				check[i] = false;
			}
			if(foods.get(i).getFat() > 800) {
				check[i] = false;
			}
			if(foods.get(i).getNatrium() > 750) {
				check[i] = false;
			}
			foods.get(i).setOverFood(check[i]);
		}
		
		return check;
	}
	
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
			logger.trace("allergy : {}", Arrays.toString(allergy_user));
			session.setAttribute("loginUser", result);
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
	
	@PostMapping("/userfindId")
	@ResponseBody
	public Map<String, Object> doUserfindId(Model model,@RequestBody User user) {
		Map<String, Object> map = new HashMap<>();
		User userResult = userService.findId(user);
		model.addAttribute("prev", user);
		if(userResult != null) {
			logger.trace("userID : {}",userResult.getId());
			model.addAttribute("findId", userResult.getId());
			map.put("findId", userResult.getId());
			return map;
//			return userResult.getId();
		}else {
			model.addAttribute("findId", "가입된 아이디가 존재하지 않습니다.");
//			return "가입된 아이디가 존재하지 않습니다.";
			map.put("findId", "가입된 아이디가 존재하지 않습니다.");
			return map;
		}
	}

	// 비밀번호 찾기-임시비밀번호 메일로 발송
	@GetMapping("/userfindPw")
	public String userfindPwForm(Model model) {
		return "user/userfindPw";
	}

	@PostMapping("/userfindPw")
	public String doUserfindPw(Model model, RedirectAttributes redir, User user, HttpSession session, String div) {
		User userResult = userService.findPw(user);   
		if (userResult != null) {
			redir.addFlashAttribute("alarm", "임시비밀번호를 메일로 발송했습니다.");
			return "redirect:/home";
		} else {
			redir.addFlashAttribute("alarm", "잘못된 이메일입니다.");
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
		boolean[] checkOver = checkOver(foods);
		System.out.println("넘음?" + Arrays.toString(checkOver));
		return "food/foodHome";
	}

	@PostMapping("/search")
	public String search(Model model, HttpServletRequest req, RedirectAttributes redir) {
		logger.trace("search 방문.");
		String by = req.getParameter("by");
		List<Food> result = null;
		if (by.equals("상품명")) {
			String name = req.getParameter("search_input");
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
		List<Food> foods = food.selectAll();
		logger.trace("foods :: " + foods);
		model.addAttribute("list", foods);
		return "food/productinfo";
	}
	
	@GetMapping("/searchMyList")
	public String myFoodInfo(Model model, HttpSession session) {
		logger.trace("searchMyList 방문.");
		User user = (User) session.getAttribute("loginUser");
		List<Eat> eats = eat.searchMyList(user.getId());
		List<Food> foods = new ArrayList<>();
		if(eats != null) {
			for(Eat myeat: eats) {
				foods.add(food.selectCode(myeat.getFoodCode()));
			}
		}
		logger.trace("eat :: " + eats);
		logger.trace("foods :: " + foods);
		model.addAttribute("eatList", eats);
		model.addAttribute("foodList",foods);
		return "food/myFood";
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
	
	//인기검색어 
	@ResponseBody
	@GetMapping("/oftenSearch")
	public List<Food> oftenSearch(Model model){
		List<Food> foods = food.selectOftenSearch();
		logger.trace("인기검색어 :: {}" + foods);
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
	
	@GetMapping("/addEatDetail")
	@ResponseBody
	public int addEatDetail(Model model, HttpServletRequest req, RedirectAttributes redir, HttpSession session) {
		logger.trace("addEat : {}");
		
		User info = (User) session.getAttribute("loginUser");
		Eat eatNew = new Eat(info.getId(), Integer.parseInt(req.getParameter("code")));
		int result = eat.insert(eatNew);
		return result;
	}

	//내 섭취 정보 - 차트 데이터 조회
	@ResponseBody
	@GetMapping("/chartSearch/{type}/{srtDate}/{endDate}")
	public List<Food> chartDay(Food foods, Model model, HttpSession session, @PathVariable String type, @PathVariable String srtDate, @PathVariable String endDate, HttpServletRequest req) {
		foods.setSrtDate(srtDate);
		foods.setEndDate(endDate);
		logger.trace("chart 조회 : {}", foods);
		String by = req.getParameter("type");
		logger.trace("type 조회 : {}", type);
		User info = (User)session.getAttribute("loginUser");
		List<Food> list = null; 
		if(type.equals("day")) {
			list = eat.selectChartDay(foods, info.getId());
		}else if(type.equals("week")) {
			list = eat.selectChartWeek(foods, info.getId());
		}else {
			list = eat.selectChartMonth(foods, info.getId());
		}
		logger.trace("chart 조회 결과 : {}", list);
		return list;
	}

//	@PostMapping("/deleteMyFood")
//	public String deleteMyFood(Model model, HttpServletRequest req, RedirectAttributes redir) {
//		Integer[] nums = (Integer[])req.getParameterValues("check");
//		ArrayList<Integer> numsL = new ArrayList<Integer>(Arrays.asList(nums));
//		   	
//		if(nums != null && nums.length > 0) {
//			eat.deleteMyFood(nums);
//			redir.addFlashAttribute("alarm", "삭제 성공!");
//		}else {
//			redir.addFlashAttribute("alarm", "삭제할 음식을 선택해주세요.");
//		}
//		return "redirect:searchMyList";
//	}
	/* ========================== Like ========================================= */

	@GetMapping("/searchLikeList")
	public String LikeList(Model model, HttpSession session) {
		logger.trace("LikeList 방문.");
		User info = (User) session.getAttribute("loginUser");
		List<Food> foods = foodLike.selectAll(info.getId());
		logger.trace("foods :: " + foods);
		model.addAttribute("likefoodlist", foods);
		return "like/likeList";
	}
	
	@GetMapping("/addLike")
	public String addLike(Model model, int code, RedirectAttributes redir, HttpSession session) {
		logger.trace("addLike : {}");
		User info = (User) session.getAttribute("loginUser");
		LikeFood like= new LikeFood(1,info.getId(), code);
		foodLike.insert(like);
		return "redirect:home";
	}
	
	@GetMapping("/daySum")
	public String selectSumDay(Model model, HttpServletRequest req, RedirectAttributes redir, HttpSession session) {
		logger.trace("daySum : {}");
		String[] likeCheck = req.getParameterValues("likeCheck");
		logger.trace(Arrays.toString(likeCheck)); 
		User info = (User) session.getAttribute("loginUser");
		Date date = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(date);
		
		logger.trace("daySum : "+to);
		Food foodSum = food.selectSumDay(info.getId(), to);
		/* logger.trace("foods :: " + foodSum); */
		model.addAttribute("foodSum", foodSum);
		
		//afterfoodsum
		
		Food afterSum = food.selectSumDay(info.getId(), to);
		for(int i=0;i<likeCheck.length;i++) {
			Food newFood = food.selectCode(Integer.parseInt(likeCheck[i]));
			afterSum.setSupportpereat(afterSum.getSupportpereat() + newFood.getSupportpereat());
			afterSum.setCalory(afterSum.getCalory() + newFood.getCalory());
			afterSum.setCarbo(afterSum.getCarbo()+newFood.getCarbo());
			afterSum.setProtein(afterSum.getProtein()+newFood.getProtein());
			afterSum.setFat(afterSum.getFat()+newFood.getFat());
			afterSum.setSugar(afterSum.getSugar()+newFood.getSugar());
			afterSum.setNatrium(afterSum.getNatrium()+newFood.getNatrium());
			afterSum.setChole(afterSum.getChole()+newFood.getChole());
			afterSum.setFattyacid(afterSum.getFattyacid()+newFood.getFattyacid());
			afterSum.setTransfat(afterSum.getTransfat()+newFood.getTransfat());
		}
		model.addAttribute("afterSum", afterSum);

		///////////////////////////////
		List<Food> foods = foodLike.selectAll(info.getId());
		logger.trace("foods :: " + foods);
		model.addAttribute("likefoodlist", foods);
		return "like/likeList";
	}
	
	/* =========================== best ==========================================*/
	
	@GetMapping("/bestList")
	public String best(Model model) {
		logger.trace("best 방문.");
		List<Food> foods = food.selectRank();
		model.addAttribute("rankFoods", foods);
		return "best/bestFood";
	}
	
	/* ========================== Review =========================================*/
	
	/* ========================== Notice =========================================*/
	
	//공지사항 리스트 
	@GetMapping("/notice")
	public String noticeForm(Model model){
		model.addAttribute("noticeList", noticeService.selectAll());
		return "menu/notice";
	}
	
	//공지사항 등록폼
	@GetMapping("/writeNotice")
	public String writeNoticeForm(Model model) {
		return "menu/noticeWrite";
	}
	
	//공지사항 등록
	@PostMapping("/writeNotice")
	public String writeNotice(Model model, Notice notice, RedirectAttributes redir) {
		noticeService.insertNotice(notice);
		redir.addFlashAttribute("alarm", "글이 등록되었습니다.");
		return "redirect:/notice";
	}
	
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
	
	@GetMapping("/qnas")
	public String qnas(Model model) {
		return "menu/qnas";
	}
	
	@GetMapping("/cancel")
	public String cancel() {
		return "redirect:home";
	}
}
