package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.LikeFood;


public interface LikeFoodRepository {
	public int insert(LikeFood likefood);
	public List<Food> selectAll(String userId);
}

