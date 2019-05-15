package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.LikeFood;

@Repository
public class LikeFoodRepositoryImpl implements LikeFoodRepository {
	
	private static final Logger logger = LoggerFactory.getLogger(FoodRepositoryImpl.class);

	private static final String ns = "com.ssafy.model.mapper.LikeFood.";
	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insert(LikeFood likefood) {
		String statement = ns + "insert";
		return template.insert(statement, likefood);
	}

	@Override
	public List<Food> selectAll(String userId) {
		String statement = ns + "selectAll";
		return template.selectList(statement, userId);
	}
}
