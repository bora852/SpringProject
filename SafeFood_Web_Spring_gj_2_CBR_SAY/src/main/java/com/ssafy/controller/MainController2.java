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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.xdevapi.JsonArray;
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
public class MainController2 {
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
	
	public String nations[]= {"국산","국내산","수입","가나","가이아나","감비아","과테말라","그리스",
			"나이지리아","남아프리카 공화국","네덜란드","네팔","노르웨이","뉴질랜드","니제르",
			"덴마크","도미니카","도미니카 공화국","독일","동티모르","라오스","라이베리아","라트비아","러시아","레바논",
			"루마니아","룩셈부르크","리비아","리투아니아","리히텐슈타인","마케도니아 공화국",
			"말레이시아","멕시코","모나코","모로코","몽골","미국",
			"미얀마","바레인","바베이도스","바하마","방글라데시","베네수엘라","베트남","벨기에","벨라루스",
			"볼리비아","불가리아","브라질","브루나이",
			"사우디아라비아","세네갈","세르비아",
			"소말리아","수단","스리랑카","스와질란드","스웨덴","스위스","스페인","슬로바키아","슬로베니아","시리아","싱가포르",
			"아랍에미리트","아르메니아","아르헨티나","아이슬란드","아이티","아일랜드","아제르바이잔","아프가니스탄","안도라","알바니아","알제리",
			"앙골라","에리트레아","에스토니아","에스파냐","에콰도르","에티오피아","엘살바도르","영국","예멘","오만","호주",
			"오스트리아","온두라스","요르단","우간다","우루과이","우즈베키스탄","우크라이나","이라크","이란","이스라엘","이집트","이탈리아","인도",
			"인도네시아","일본","자메이카","잠비아","중국","짐바브웨","체코","칠레",
			"카자흐스탄","카타르","캄보디아","캐나다","케냐","코스타리카","콜롬비아","콩고 공화국",
			"콩고 민주 공화국","쿠바","쿠웨이트","크로아티아","키르기스스탄","타이","타이완","탄자니아","터키",
			"튀니지","트리니다드 토바고","파나마","파라과이","파키스탄","페루","포르투갈","폴란드",
			"프랑스","피지","핀란드","필리핀","헝가리"};
	
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
	
	/////////////////////
	
	@ResponseBody
	@PostMapping("/chartNation")
	public Map chartNation(Model model, int code) {
		Food foods = food.selectCode(code);
		
		Map<String, Integer> nationsMap = new HashMap<>();
		int occurance = 0;
		occurance += StringUtils.countOccurrencesOf(foods.getMaterial(), "(국산");	
		occurance += StringUtils.countOccurrencesOf(foods.getMaterial(), "(국내산");
		
		occurance += StringUtils.countOccurrencesOf(foods.getMaterial(), " 국산");
		occurance += StringUtils.countOccurrencesOf(foods.getMaterial(), " 국내산");
		
		occurance += StringUtils.countOccurrencesOf(foods.getMaterial(), ";국산");
		
		nationsMap.put("국산", occurance);
		
		for(int i = 2 ; i < nations.length; i++) {
			occurance =  StringUtils.countOccurrencesOf(foods.getMaterial(), nations[i]);
			if(occurance!=0)
				nationsMap.put(nations[i], occurance);
		}
		
		return nationsMap;
	}
	///////////////////
	
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

	/* ========================== Like ========================================= */

	
	@GetMapping("/likeList")
	public String LikeList1(Model model, HttpSession session) {
		logger.trace("LikeList 방문.");
		User info = (User) session.getAttribute("loginUser");
		List<Food> foods = foodLike.selectAll(info.getId());
		logger.trace("foods :: " + foods);
		model.addAttribute("likefoodlist", foods);
		return "like/likeHome";
	}
	
	@GetMapping("/searchLikeList")
	public String LikeList2(Model model, HttpSession session) {
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
		return "redirect:likeList";
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
	
	@GetMapping("/likeDelete")
	public String likeDelete(Model model, int code, RedirectAttributes redir, HttpSession session ) {
		logger.trace("likeDelete : {}");
		User info = (User) session.getAttribute("loginUser");
		LikeFood like= new LikeFood(1,info.getId(), code);
		foodLike.delete(like);
		return "redirect:likeList";
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
