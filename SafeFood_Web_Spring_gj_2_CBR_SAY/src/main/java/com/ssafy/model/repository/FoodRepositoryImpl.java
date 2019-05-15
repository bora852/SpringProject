package com.ssafy.model.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Food selectCode(int code) {
		String statement = ns + "selectCode";
		return template.selectOne(statement, code);
	}
	
	@Override
	public Food selectName1(String name) {
		String statement = ns + "selectName1";
		System.out.println(name);
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

	@Override
	public int updateSearchCnt(int code) {
		String statement = ns + "updateSearchCnt";
		return template.update(statement, code);
	}

	@Override
	public List<Food> selectOftenSearch() {
		String statement = ns + "selectOftenSearch";
		return template.selectList(statement);
	}
	
	@Override
	public Food selectSumDay(String userId, String date) {
		String statement = ns + "selectSumDay";
		Map<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("date", date);
		return template.selectOne(statement,map);
	}
}
