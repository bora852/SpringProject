package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Food;

public interface FoodRepository {

	public int insert(Food food);
	public Food selectCode(int code);
	public Food selectName1(String name);
	public List<Food> selectName2(String name);
	public List<Food> selectAll();
	public List<Food> selectMaterial(String material);
	public List<Food> selectMaker(String maker);
	public int updateSearchCnt(int code);
	public List<Food> selectOftenSearch();
	public Food selectSumDay(String userId, String date);
	public List<Food> selectRank();
}
