package com.ssafy.model.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
}