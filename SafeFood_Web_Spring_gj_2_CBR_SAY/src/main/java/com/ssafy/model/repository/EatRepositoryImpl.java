package com.ssafy.model.repository;

import java.util.List;

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

	private static final String ns = "com.ssafy.model.mapper.Food.";
	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insert(Eat eat) {
		String statement = ns + "insert";
		return template.insert(statement, eat);
	}
	@Override
	public List<Food> searchMyList(String id) {
		String statement = ns + "searchMyList";
		return template.selectList(statement, id);
	}
	
	@Override
	public List<Food> selectName(String name) {
		String statement = ns + "selectName";
		return template.selectList(statement, name);
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
