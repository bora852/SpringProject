package com.ssafy.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Food;

@Repository
public class FoodRepositoryImpl implements FoodRepository {
	private static final Logger logger = LoggerFactory.getLogger(FoodRepositoryImpl.class);

	private static final String ns = "com.ssafy.model.mapper.Food.";
	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insert(Food food) {
		String statement = ns + "insert";
		return template.insert(statement, food);
	}

	@Override
	public Food selectName1(String name) {
		String statement = ns + "selectName1";
		return template.selectOne(statement, name);
	}
	
	@Override
	public List<Food> selectName2(String name) {
		String statement = ns + "selectName2";
		return template.selectList(statement, name);
	}

	@Override
	public List<Food> selectAll() {
		String statement = ns + "selectAll";
		return template.selectList(statement);
	}

	@Override
	public List<Food> selectMaterial(String material) {
		String statement = ns + "selectMaterial";
		return template.selectList(statement, material);
	}

	@Override
	public List<Food> selectMaker(String maker) {
		String statement = ns + "selectMaker";
		return template.selectList(statement, maker);
	}
	
}
