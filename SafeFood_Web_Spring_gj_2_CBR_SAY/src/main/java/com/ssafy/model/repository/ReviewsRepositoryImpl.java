package com.ssafy.model.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.model.dto.Reviews;

public class ReviewsRepositoryImpl implements ReviewsRepository {
	private static final Logger logger = LoggerFactory.getLogger(FoodRepositoryImpl.class);

	private static final String ns = "com.ssafy.model.mapper.Reviews.";
	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public int insert(Reviews reviews) {
		String statement = ns + "insert";
		return template.insert(statement, reviews);
	}

}
