/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Food;


public interface FoodService {
	int insert(Food book);

	Food selectCode(int code);
	
	Food selectName1(String name);
	
	List<Food> selectName2(String name);

	List<Food> selectMaterial(String material);
	
	List<Food> selectMaker(String maker);
	
	List<Food> selectAll();
	
	public List<Food> selectOftenSearch();

}
