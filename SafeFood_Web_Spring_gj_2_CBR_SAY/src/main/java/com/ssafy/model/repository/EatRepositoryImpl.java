package com.ssafy.model.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;

@Repository
public class EatRepositoryImpl implements EatRepository {
	private static final Logger logger = LoggerFactory.getLogger(EatRepositoryImpl.class);

	private static final String ns = "com.ssafy.model.mapper.Eat.";
	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insert(Eat eat) {
		String statement = ns + "insert";
		return template.insert(statement, eat);
	}
	@Override
	public List<Eat> searchMyList(String id) {
		String statement = ns + "searchMyList";
		return template.selectList(statement, id);
	}
	
	@Override
	public List<Food> selectName(String name, String id) {
		String statement = ns + "selectName";
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		return template.selectList(statement, map);
	}

	@Override
	public List<Food> selectMaterial(String material, String id) {
		String statement = ns + "selectMaterial";
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("material", material);
		return template.selectList(statement, map);
	}

	@Override
	public List<Food> selectMaker(String maker, String id) {
		String statement = ns + "selectMaker";
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("maker", maker);
		return template.selectList(statement, map);
	}
	
	@Override
	public int updateEatCnt(int code) {
		String statement = ns + "updateEatCnt";
		return template.update(statement, code);
	}
	@Override
	public List<Food> selectChartDay(Food food, String userId) {
		String statement = ns + "selectChartDay";
		Map<String, String> map = new HashMap<>();
		map.put("srtDate",food.getSrtDate());
		map.put("endDate",food.getEndDate());
		map.put("userId",userId);
		return template.selectList(statement);
	}
	@Override
	public List<Food> selectChartWeek(Food food, String userId) {
		String statement = ns + "selectChartWeek";
		Map<String, String> map = new HashMap<>();
		map.put("srtDate",food.getSrtDate());
		map.put("endDate",food.getEndDate());
		map.put("userId",userId);
		return template.selectList(statement);
	}
	@Override
	public List<Food> selectChartMonth(Food food, String userId) {
		logger.trace("selectChartMonth : {}", food);
		String statement = ns + "selectChartMonth";
		Map<String, String> map = new HashMap<>();
		map.put("srtDate","2019-04");
		map.put("endDate","2019-06");
		map.put("userId",userId);
		return template.selectList(statement);
	}
}