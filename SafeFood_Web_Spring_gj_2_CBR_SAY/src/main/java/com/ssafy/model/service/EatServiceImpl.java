/**
 *
 */
package com.ssafy.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;
import com.ssafy.model.repository.EatRepository;
import com.ssafy.model.repository.EatRepositoryImpl;

@Transactional
@Service
public class EatServiceImpl implements EatService {
	private static final Logger logger = LoggerFactory.getLogger(EatRepositoryImpl.class);
	private EatRepository eatRepo;

	public EatServiceImpl(EatRepository repo) {
		eatRepo = repo;
	}

	@Override
	@Transactional
	public int insert(Eat eat) {
		eatRepo.updateEatCnt(eat.getFoodCode());
		return eatRepo.insert(eat);
	}

	@Override
	public List<Eat> searchMyList(String id) {
		
		return eatRepo.searchMyList(id);
	}

	@Override
	public List<Food> selectName(String name, String id) {
		return eatRepo.selectName(name,id);
	}
	
	@Override
	public List<Food> selectMaterial(String material, String id) {
		return eatRepo.selectMaterial(material,id);
	}
	
	@Override
	public List<Food> selectMaker(String maker, String id) {
		return eatRepo.selectMaker(maker,id);
	}

	@Override
	public List<Food> selectChartDay(Food food, String userId) {
		return  eatRepo.selectChartDay(food, userId);
	}

	@Override
	public List<Food> selectChartWeek(Food food, String userId) {
		return eatRepo.selectChartWeek(food, userId);
	}

	@Override
	public List<Food> selectChartMonth(Food food, String userId) {
		logger.trace("selectChartMonth : ", food+"  userId : "+ userId);
		return eatRepo.selectChartMonth(food, userId);
	}

}