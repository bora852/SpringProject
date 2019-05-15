/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;

public interface EatService {
	
	int insert(Eat eat);
	List<Eat> searchMyList(String id);
	public List<Food> selectName(String name, String id);
	public List<Food> selectMaterial(String material, String id);
	public List<Food> selectMaker(String maker, String id);
	public List<Food> selectChartDay(Food food, String userId);
	public List<Food> selectChartWeek(Food food, String userId);
	public List<Food> selectChartMonth(Food food, String userId);

}
