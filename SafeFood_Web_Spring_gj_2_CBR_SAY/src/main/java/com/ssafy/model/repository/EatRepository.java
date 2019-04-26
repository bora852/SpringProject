package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;

public interface EatRepository {

	public int insert(Eat eat);
	public List<Food> searchMyList(String id);
	public List<Food> selectName(String name, String id);
	public List<Food> selectMaterial(String material, String id);
	public List<Food> selectMaker(String maker, String id);

}

