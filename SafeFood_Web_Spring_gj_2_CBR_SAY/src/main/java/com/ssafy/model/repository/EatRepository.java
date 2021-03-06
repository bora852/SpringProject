package com.ssafy.model.repository;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;

public interface EatRepository {

	public int insert(Eat eat);
	public List<Eat> searchMyList(String id);
	public List<Food> selectName(String name, String id);
	public List<Food> selectMaterial(String material, String id);
	public List<Food> selectMaker(String maker, String id);
	public int updateEatCnt(int code);
	public List<Food> selectChartDay(Food food, String userId);
	public List<Food> selectChartWeek(Food food, String userId);
	public List<Food> selectChartMonth(Food food, String userId);
	public int deleteMyFood(List<Integer> num);
}

