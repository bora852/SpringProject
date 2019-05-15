/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.LikeFood;

public interface LikeFoodService {
	public int insert(LikeFood likefood);
	public List<Food> selectAll(String userId);
	public int delete(LikeFood likefood);
}
