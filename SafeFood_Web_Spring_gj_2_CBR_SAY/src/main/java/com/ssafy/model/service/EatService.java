/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;

public interface EatService {
	
	int insert(Eat eat);

	List<Food> searchMyList(String id);

	List<Food> selectName(String name);

	List<Food> selectMaterial(String material);

	List<Food> selectMaker(String maker);

}
